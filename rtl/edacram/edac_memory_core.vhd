---------------------------------------------------------------------------------------------------
-- Project name: Reusable
-- Submodule/macrocell name: EDAC protected RAM
-- File name: edac_memory_core.vhd
-- Author: Dávid Velki
-- Version: 1.0
-- Description:
--	...
--	...
--	...
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.edac_protected_ram_pkg.all;
use ieee.std_logic_textio.all;
use std.textio.all;
---------------------------------------------------------------------------------------------------
entity edac_memory_core is
	generic (
		address_width:										integer range 2 to 12 := 12;
		data_width:											data_width_range := 32;
		registered_input:									boolean := true;
		registered_output:									boolean := true;
		scrubber_present:									boolean := true;
		scrb_prescaler_width:								integer range 1 to 18 := 18;		-- prescaler: 18, timer: 24, clk: 50 MHz -> cycle time: 24.43 hours
		scrb_timer_width:									integer range 1 to 24 := 24;
		init_from_file:										boolean := false;
		initfile_path:										string := "";
		initfile_format:									string := ""
	);
	
	port (				
		clk:											in	std_logic;
		as_reset_n:										in	std_logic;
		error_injection:								in	std_logic_vector (data_width-1 downto 0);
		data_in:										in	std_logic_vector (data_width-1 downto 0);
		data_out:										out	std_logic_vector (data_width-1 downto 0);
		write_address:									in	std_logic_vector (address_width-1 downto 0);
		read_address:									in	std_logic_vector (address_width-1 downto 0);
		write_strobe:									in	std_logic;
		read_strobe:									in	std_logic;
		uncorrectable_error:							out	std_logic;
		correctable_error:								out	std_logic;
		force_scrubbing:								in	std_logic;
		scrubber_invalid_state_error:					out	std_logic;
		scrubber_recover_fsm_n:							in	std_logic;
		dbg_scrubber_invalid_state_error_injection:		in	std_logic
	);
end entity edac_memory_core;
---------------------------------------------------------------------------------------------------
architecture rtl of edac_memory_core is
	
	constant code_width:	integer range code_width_min to code_width_max		:= get_code_size(data_width);
	constant block_width:	integer range block_width_min to block_width_max	:= data_width + code_width;
	
	constant shift_reg_depth:		integer	:= get_decoding_delay(registered_input, registered_output)+1;
	
	type memory_content_type is array (0 to 2**address_width-1) of std_logic_vector (block_width-1 downto 0);
	
	impure function mem_init(initfile_path: string) return memory_content_type is
		file initfile: text;
		variable line_buffer: line;
		variable recent_word: std_logic_vector (block_width-1 downto 0);
		variable tmp: memory_content_type;
	begin
		if ( init_from_file = true ) then
			file_open(initfile, initfile_path, read_mode);
			for i in 0 to 2**address_width-1 loop
				readline(initfile, line_buffer);
				
				if ( initfile_format = "BIN" ) then
					read(line_buffer, recent_word);
				elsif ( initfile_format = "HEX" ) then
					hread(line_buffer, recent_word);
				else
					assert false report "EDAC memory core: initfile format error" severity failure;
				end if;
				
				tmp(i) := recent_word;
			end loop;
			return tmp;
		else
			return tmp;
		end if;
	end function;
	
    signal memory_content: memory_content_type := mem_init(initfile_path => initfile_path);
	
    attribute syn_ramstyle: string;
    attribute syn_ramstyle of memory_content:signal is "block_ram";
	
	signal block_out_enc:			std_logic_vector (block_width-1 downto 0);
	signal data_out_enc:			std_logic_vector (data_width-1 downto 0);
	signal code_out_enc:			std_logic_vector (code_width-1 downto 0);
	
	signal data_in_mem:				std_logic_vector (block_width-1 downto 0);
	signal data_out_mem:			std_logic_vector (block_width-1 downto 0);
	signal write_address_mem:		std_logic_vector (address_width-1 downto 0);
	signal read_address_mem:		std_logic_vector (address_width-1 downto 0);
	signal write_strobe_mem:		std_logic;
	signal read_strobe_mem:			std_logic;
	
	signal data_out_dec:			std_logic_vector (data_width-1 downto 0);
	signal code_out_dec:			std_logic_vector (code_width-1 downto 0);
	signal block_out_dec_d:			std_logic_vector (block_width-1 downto 0);
	signal read_strobe_mem_shr:		std_logic_vector (shift_reg_depth-1 downto 0);
	signal corr_error:				std_logic;
	signal uncorr_error:			std_logic;
	
	signal suspend:					std_logic;
	signal awake:					std_logic;
	signal scrubbing_in_prog:		std_logic;
	signal address_scrb:			std_logic_vector (address_width-1 downto 0);
	signal write_strobe_scrb:		std_logic;
	signal read_strobe_scrb:		std_logic;
	
	signal ff_scrubbing_in_prog:						std_logic;
	signal scrubbing_in_prog_rising:					std_logic;
	signal data_out_shadow_buffer:						std_logic_vector (data_width-1 downto 0);
	signal data_out_selector:							std_logic;
	
begin
	
	L_ENCODER: entity work.edac_encoder(arithmetic)
		generic map(
			data_width						=> data_width,
			registered_input				=> registered_input,
			registered_output				=> registered_output
		)
		port map(
			clk								=> clk,
			as_reset_n						=> as_reset_n,
			data_in							=> data_in,
			data_out						=> block_out_enc
		);
	data_out_enc <= block_out_enc(block_width-1 downto code_width);
	code_out_enc <= block_out_enc(code_width-1 downto 0);
	
	data_in_mem <= (data_out_enc xor error_injection) & code_out_enc when scrubbing_in_prog = '0' else block_out_dec_d;
	write_address_mem <= write_address when scrubbing_in_prog = '0' else address_scrb;
	read_address_mem <= read_address when scrubbing_in_prog = '0' else address_scrb;
	write_strobe_mem <= write_strobe when scrubbing_in_prog = '0' else write_strobe_scrb;
	read_strobe_mem <= read_strobe when scrubbing_in_prog = '0' else read_strobe_scrb;
	
	L_MEMORY: process ( clk )
	begin
		if ( rising_edge(clk) ) then
		
			if ( write_strobe_mem = '1' ) then
				memory_content(to_integer(unsigned(write_address_mem))) <= data_in_mem;
			end if;
			if ( read_strobe_mem = '1' ) then
				data_out_mem <= memory_content(to_integer(unsigned(read_address_mem)));
			end if;
			
		end if;
	end process;
	
	L_DECODER: entity work.edac_decoder(arithmetic)
		generic map(
			data_width						=> data_width,
			registered_input				=> registered_input,
			registered_output				=> registered_output
		)
		port map(
			clk								=> clk,
			as_reset_n						=> as_reset_n,
			data_in							=> data_out_mem,
			data_out						=> data_out_dec,
			code_out						=> code_out_dec,
			corr_error						=> corr_error,
			uncorr_error					=> uncorr_error
		);
	
	
	L_DATA_OUT_SHADOWING_LOGIC: block
	begin
		
		L_SCRUBBING_IN_PROG_RISING_DETECTOR: process ( clk, as_reset_n )
		begin
			if ( as_reset_n = '0' ) then
				ff_scrubbing_in_prog <= '0';
			elsif ( rising_edge(clk) ) then
				ff_scrubbing_in_prog <= scrubbing_in_prog;
			end if;
		end process;
		scrubbing_in_prog_rising <= scrubbing_in_prog and not ff_scrubbing_in_prog;
		
		L_DATA_OUT_SHADOW_BUFFER: process ( clk, as_reset_n )
		begin
			if ( as_reset_n = '0' ) then
				data_out_shadow_buffer <= (others => '0');
			elsif ( rising_edge(clk) ) then
				if ( scrubbing_in_prog_rising = '1' ) then
					data_out_shadow_buffer <= data_out;
				end if;
			end if;
		end process;
		
		L_DATA_OUT_SELECTOR: process ( clk, as_reset_n )
		begin
			if ( as_reset_n = '0' ) then
				data_out_selector <= '1';
			elsif ( rising_edge(clk) ) then
				if ( read_strobe = '1' ) then
					data_out_selector <= '1';
				elsif ( scrubbing_in_prog_rising = '1' ) then
					data_out_selector <= '0';
				end if;
			end if;
		end process;
		data_out <= data_out_dec when data_out_selector = '1' else data_out_shadow_buffer;
		
	end block L_DATA_OUT_SHADOWING_LOGIC;
	
	L_READ_STROBE_MEM_SHR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			read_strobe_mem_shr <= (others => '0');
		elsif ( rising_edge(clk) ) then
			read_strobe_mem_shr <= read_strobe_mem & read_strobe_mem_shr(shift_reg_depth-1 downto 1);
		end if;
	end process;
	uncorrectable_error <= uncorr_error and read_strobe_mem_shr(0);
	correctable_error <= corr_error and read_strobe_mem_shr(0);
	
	suspend <= read_strobe or write_strobe;
	scrubbing_in_prog <= not suspend and awake;
	
	L_SCRUBBER: entity work.scrubber(rtl)
		generic map(
			address_width						=> address_width,
			registered_input					=> registered_input,
			registered_output					=> registered_output,
			scrubber_present					=> scrubber_present,
			prescaler_counter_width				=> scrb_prescaler_width,
			timer_counter_width					=> scrb_timer_width
		)	
		port map(	
			clk									=> clk,
			as_reset_n							=> as_reset_n,
			suspend								=> suspend,
			awake								=> awake,
			read_strobe							=> read_strobe_scrb,
			address								=> address_scrb,
			write_strobe						=> write_strobe_scrb,
			correctable_error					=> corr_error,
			force_scrubbing						=> force_scrubbing,
			invalid_state_error					=> scrubber_invalid_state_error,
			recover_fsm_n						=> scrubber_recover_fsm_n,
			dbg_invalid_state_error_injection	=> dbg_scrubber_invalid_state_error_injection
		);
		
	L_DECODER_OUT_REG: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			block_out_dec_d <= (others => '0');
		elsif ( rising_edge(clk) ) then
			if( scrubbing_in_prog = '1' ) then
				block_out_dec_d <= data_out_dec & code_out_dec;
			end if;
		end if;
	end process;
	
end architecture rtl;
---------------------------------------------------------------------------------------------------