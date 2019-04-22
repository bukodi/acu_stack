---------------------------------------------------------------------------------------------------
-- Project name: PLATO 2.0
-- Submodule/macrocell name: EDAC-protected RAM
-- File name: edac_protected_ram.vhd
-- Author: Péter Horváth
-- Version: 1.0
-- Description:
--	...
--	...
--	...
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
---------------------------------------------------------------------------------------------------
entity edac_protected_ram is
	generic (
		address_width:						integer range 2 to 12;
		data_width:							integer range 2 to 64;
		edac_latency:						integer range 4 to 10;
		prot_bram_registered_in:			boolean;
		prot_bram_registered_out:			boolean;
		prot_bram_scrubber_present:			boolean;
		prot_bram_scrb_prescaler_width:		integer range 1 to 18;
		prot_bram_scrb_timer_width:			integer range 1 to 24;
		init_from_file:						boolean;
		initfile_path:						string;
		initfile_format:					string
	);
	
	port (
		clk:											in	std_logic;
		as_reset_n:										in	std_logic;
		reset_error_flags_n:							in	std_logic;
		uncorrectable_error:							out	std_logic;
		correctable_error:								out	std_logic;
		we:												in	std_logic;
		we_ack:											out	std_logic;
		re:												in	std_logic;
		re_ack:											out	std_logic;
		write_address:									in	std_logic_vector (address_width-1 downto 0);
		read_address:									in	std_logic_vector (address_width-1 downto 0);
		data_in:										in	std_logic_vector (data_width-1 downto 0);
		data_out:										out	std_logic_vector (data_width-1 downto 0);
		error_injection:								in	std_logic_vector (1 downto 0);
		force_scrubbing:								in	std_logic;
		scrubber_invalid_state_error:					out	std_logic;
		scrubber_recover_fsm_n:							in	std_logic;
		dbg_scrubber_invalid_state_error_injection:		in	std_logic
	);
end entity edac_protected_ram;
---------------------------------------------------------------------------------------------------
architecture unprotected_bram of edac_protected_ram is

	type memory_content_type is array (0 to 2**address_width-1) of std_logic_vector (data_width-1 downto 0);
	
	impure function mem_init(initfile_path: string) return memory_content_type is
		file initfile: text;
		variable line_buffer: line;
		variable recent_word: std_logic_vector (data_width-1 downto 0);
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
					assert false report "EDAC-protected RAM: initfile format error" severity failure;
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
	
	-- write latency handler resources
	signal we_d:					std_logic;
	signal we_rising_edge:			std_logic;
	signal we_hold_counter:			integer range 0 to edac_latency;
	signal we_internal:				std_logic;
	
	-- read latency handler resources
	signal re_d:					std_logic;
	signal re_rising_edge:			std_logic;
	signal re_hold_counter:			integer range 0 to edac_latency;
	signal re_internal:				std_logic;
	
	signal data_out_mem:			std_logic_vector (data_width-1 downto 0);

begin
	
	uncorrectable_error <= '0';
	correctable_error <= '0';
	scrubber_invalid_state_error <= '0';
	
	------------------------------------------------------------
	-- Write latency handler -----------------------------------
	------------------------------------------------------------
	
	L_WE_RISING_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			we_d <= '0';
		elsif ( rising_edge(clk) ) then
			we_d <= we;
		end if;
	end process;
	we_rising_edge <= we and not we_d;
	
	L_WE_HOLD_COUNTER: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			we_hold_counter <= 0;
		elsif ( rising_edge(clk) ) then
			if ( we_rising_edge = '1' ) then
				we_hold_counter <= edac_latency;
			else
				if ( we_hold_counter /= 0 ) then
					we_hold_counter <= we_hold_counter - 1;
				end if;
			end if;
		end if;
	end process;
	we_internal <= '1' when we_hold_counter /= 0 else '0';
	we_ack <= not we_internal;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------
	
	------------------------------------------------------------
	-- Read latency handler -----------------------------------
	------------------------------------------------------------
	
	L_RE_RISING_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			re_d <= '0';
		elsif ( rising_edge(clk) ) then
			re_d <= re;
		end if;
	end process;
	re_rising_edge <= re and not re_d;
	
	L_RE_HOLD_COUNTER: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			re_hold_counter <= 0;
		elsif ( rising_edge(clk) ) then
			if ( re_hold_counter /= 0 ) then
				if ( write_address = read_address and (we_internal = '1' or we_rising_edge = '1') ) then
					re_hold_counter <= edac_latency;
				else
					re_hold_counter <= re_hold_counter - 1;
				end if;
			else
				if ( re_rising_edge = '1' ) then
					re_hold_counter <= edac_latency;
				end if;
			end if;
		end if;
	end process;
	re_internal <= '1' when re_hold_counter /= 0 else '0';
	re_ack <= not re_internal;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------

	L_WRITE: process ( clk )
	begin
		if ( rising_edge(clk) ) then
			if ( we_internal = '1' ) then
				memory_content(to_integer(unsigned(write_address))) <= data_in;
			end if;
			if ( re_internal = '1' ) then data_out_mem <= memory_content(to_integer(unsigned(read_address))); end if;
		end if;
	end process;
	
	data_out <= data_out_mem;

end architecture unprotected_bram;
---------------------------------------------------------------------------------------------------
architecture unprotected_reg of edac_protected_ram is

	
	type memory_content_type is array (0 to 2**address_width-1) of std_logic_vector (data_width-1 downto 0);
	
	impure function mem_init(initfile_path: string) return memory_content_type is
		file initfile: text;
		variable line_buffer: line;
		variable recent_word: std_logic_vector (data_width-1 downto 0);
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
					assert false report "EDAC-protected RAM: initfile format error" severity failure;
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
    attribute syn_ramstyle of memory_content:signal is "registers";
	
	-- write latency handler resources
	signal we_d:					std_logic;
	signal we_rising_edge:			std_logic;
	signal we_hold_counter:			integer range 0 to edac_latency;
	signal we_internal:				std_logic;
	
	-- read latency handler resources
	signal re_d:					std_logic;
	signal re_rising_edge:			std_logic;
	signal re_hold_counter:			integer range 0 to edac_latency;
	signal re_internal:				std_logic;
	
	signal data_out_mem:			std_logic_vector (data_width-1 downto 0);

begin
	
	uncorrectable_error <= '0';
	correctable_error <= '0';
	
	------------------------------------------------------------
	-- Write latency handler -----------------------------------
	------------------------------------------------------------
	
	L_WE_RISING_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			we_d <= '0';
		elsif ( rising_edge(clk) ) then
			we_d <= we;
		end if;
	end process;
	we_rising_edge <= we and not we_d;
	
	L_WE_HOLD_COUNTER: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			we_hold_counter <= 0;
		elsif ( rising_edge(clk) ) then
			if ( we_rising_edge = '1' ) then
				we_hold_counter <= edac_latency;
			else
				if ( we_hold_counter /= 0 ) then
					we_hold_counter <= we_hold_counter - 1;
				end if;
			end if;
		end if;
	end process;
	we_internal <= '1' when we_hold_counter /= 0 else '0';
	we_ack <= not we_internal;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------
	
	------------------------------------------------------------
	-- Read latency handler -----------------------------------
	------------------------------------------------------------
	
	L_RE_RISING_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			re_d <= '0';
		elsif ( rising_edge(clk) ) then
			re_d <= re;
		end if;
	end process;
	re_rising_edge <= re and not re_d;
	
	L_RE_HOLD_COUNTER: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			re_hold_counter <= 0;
		elsif ( rising_edge(clk) ) then
			if ( re_hold_counter /= 0 ) then
				if ( write_address = read_address and (we_internal = '1' or we_rising_edge = '1') ) then
					re_hold_counter <= edac_latency;
				else
					re_hold_counter <= re_hold_counter - 1;
				end if;
			else
				if ( re_rising_edge = '1' ) then
					re_hold_counter <= edac_latency;
				end if;
			end if;
		end if;
	end process;
	re_internal <= '1' when re_hold_counter /= 0 else '0';
	re_ack <= not re_internal;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------

	L_WRITE: process ( clk )
	begin
		if ( rising_edge(clk) ) then
			if ( we_internal = '1' ) then
				memory_content(to_integer(unsigned(write_address))) <= data_in;
			end if;
			if ( re_internal = '1' ) then data_out_mem <= memory_content(to_integer(unsigned(read_address))); end if;
		end if;
	end process;
	
	data_out <= data_out_mem;

end architecture unprotected_reg;
---------------------------------------------------------------------------------------------------
architecture protected_bram of edac_protected_ram is
	
	-- write latency handler resources
	signal we_d:							std_logic;
	signal we_rising_edge:					std_logic;
	signal we_hold_counter:					integer range 0 to edac_latency;
	signal we_internal:						std_logic;
	
	-- read latency handler resources
	signal re_d:							std_logic;
	signal re_rising_edge:					std_logic;
	signal re_hold_counter:					integer range 0 to edac_latency;
	signal re_internal:						std_logic;
	
	-- error signaling resources
	signal inner_uncorrectable_error:		std_logic;
	signal inner_correctable_error:			std_logic;
	signal inner_uncorrectable_error_d:		std_logic;
	signal inner_correctable_error_d:		std_logic;
	signal uncorrectable_error_flag_rising:	std_logic;
	signal correctable_error_flag_rising:	std_logic;
	signal uncorrectable_error_flag:		std_logic;
	signal correctable_error_flag:			std_logic;
	
	signal error_injection_extended:		std_logic_vector (data_width-1 downto 0);
	
begin
	
	------------------------------------------------------------
	-- Write latency handler -----------------------------------
	------------------------------------------------------------
	
	L_WE_RISING_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			we_d <= '0';
		elsif ( rising_edge(clk) ) then
			we_d <= we;
		end if;
	end process;
	we_rising_edge <= we and not we_d;
	
	L_WE_HOLD_COUNTER: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			we_hold_counter <= 0;
		elsif ( rising_edge(clk) ) then
			if ( we_rising_edge = '1' ) then
				we_hold_counter <= edac_latency;
			else
				if ( we_hold_counter /= 0 ) then
					we_hold_counter <= we_hold_counter - 1;
				end if;
			end if;
		end if;
	end process;
	we_internal <= '1' when we_hold_counter /= 0 else '0';
	we_ack <= not we_internal;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------
	
	------------------------------------------------------------
	-- Read latency handler -----------------------------------
	------------------------------------------------------------
	
	L_RE_RISING_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			re_d <= '0';
		elsif ( rising_edge(clk) ) then
			re_d <= re;
		end if;
	end process;
	re_rising_edge <= re and not re_d;
	
	L_RE_HOLD_COUNTER: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			re_hold_counter <= 0;
		elsif ( rising_edge(clk) ) then
			if ( re_hold_counter /= 0 ) then
				if ( write_address = read_address and (we_internal = '1' or we_rising_edge = '1') ) then
					re_hold_counter <= edac_latency;
				else
					re_hold_counter <= re_hold_counter - 1;
				end if;
			else
				if ( re_rising_edge = '1' ) then
					re_hold_counter <= edac_latency;
				end if;
			end if;
		end if;
	end process;
	re_internal <= '1' when re_hold_counter /= 0 else '0';
	re_ack <= not re_internal;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------
	
	------------------------------------------------------------
	-- EDAC protected memory instantiation ---------------------
	------------------------------------------------------------
	
	L_EDAC_PROTECTED_MEMORY: entity work.edac_memory_core(rtl)
		generic map (
			address_width					=> address_width,
			data_width						=> data_width,
			registered_input				=> prot_bram_registered_in,
			registered_output				=> prot_bram_registered_out,
			scrubber_present				=> prot_bram_scrubber_present,
			scrb_prescaler_width			=> prot_bram_scrb_prescaler_width,
			scrb_timer_width				=> prot_bram_scrb_timer_width,
			init_from_file					=> init_from_file,
			initfile_path					=> initfile_path,
			initfile_format					=> initfile_format
		)		
		
		port map (		
			clk											=> clk,
			as_reset_n									=> as_reset_n,
			error_injection								=> error_injection_extended,
			data_in										=> data_in,
			data_out									=> data_out,
			write_address								=> write_address,
			read_address								=> read_address,
			write_strobe								=> we_internal,
			read_strobe									=> re_internal,
			uncorrectable_error							=> inner_uncorrectable_error,
			correctable_error							=> inner_correctable_error,
			force_scrubbing								=> force_scrubbing,
			scrubber_invalid_state_error				=> scrubber_invalid_state_error,
			scrubber_recover_fsm_n						=> scrubber_recover_fsm_n,
			dbg_scrubber_invalid_state_error_injection	=> dbg_scrubber_invalid_state_error_injection
		);
		
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------
	
	------------------------------------------------------------
	-- Error injection and signaling ---------------------------
	------------------------------------------------------------
	
	error_injection_extended(1 downto 0) <= error_injection;
	error_injection_extended(data_width-1 downto 2) <= (others => '0');
	
	L_ERROR_FLAG_EDGE_DETECTOR: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			inner_uncorrectable_error_d <= '0';
			inner_correctable_error_d <= '0';
		elsif ( rising_edge(clk) ) then
			inner_uncorrectable_error_d <= inner_uncorrectable_error;
			inner_correctable_error_d <= inner_correctable_error;
		end if;
	end process;
	uncorrectable_error_flag_rising <= inner_uncorrectable_error and not inner_uncorrectable_error_d;
	correctable_error_flag_rising <= inner_correctable_error and not inner_correctable_error_d;
	
	L_ERROR_FLAG_OUTPUT: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			uncorrectable_error_flag <= '0';
			correctable_error_flag <= '0';
		elsif ( rising_edge(clk) ) then
			if ( reset_error_flags_n = '0' ) then
				uncorrectable_error_flag <= '0';
				correctable_error_flag <= '0';
			else
				if ( uncorrectable_error_flag_rising = '1' ) then 
					uncorrectable_error_flag <= '1';
				end if;
				if ( correctable_error_flag_rising = '1' ) then 
					correctable_error_flag <= '1';
				end if;
			end if;
		end if;
	end process;
	uncorrectable_error <= uncorrectable_error_flag;
	correctable_error <= correctable_error_flag;
	
	------------------------------------------------------------
	------------------------------------------------------------
	------------------------------------------------------------
	
end architecture protected_bram;
---------------------------------------------------------------------------------------------------