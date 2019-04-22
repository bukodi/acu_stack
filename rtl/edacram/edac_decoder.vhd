library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.edac_protected_ram_pkg.all;
---------------------------------------------------------------------------------------------------
entity edac_decoder is
	generic (
		data_width:						data_width_range := 32;
		registered_input:				boolean := true;
		registered_output:				boolean := true
	);
	
	port (
		clk:						in	std_logic;
		as_reset_n:					in	std_logic;
		
		data_in:					in	std_logic_vector (data_width+get_code_size(data_width)-1 downto 0);
		data_out:					out	std_logic_vector (data_width-1 downto 0);
		code_out:					out std_logic_vector (get_code_size(data_width)-1 downto 0);
		
		corr_error:					out std_logic;
		uncorr_error:				out std_logic
	);
end entity edac_decoder;
---------------------------------------------------------------------------------------------------
architecture arithmetic of edac_decoder is
	
	constant code_width:	integer range code_width_min to code_width_max		:= get_code_size(data_width);
	constant block_width:	integer range block_width_min to block_width_max	:= data_width + code_width;
	
	signal data_in_d:					std_logic_vector (block_width-1 downto 0);
	signal inner_data_in:				std_logic_vector (block_width-1 downto 0);
	signal message_in:					std_logic_vector (data_width-1 downto 0);
	signal code_in:						std_logic_vector (code_width-1 downto 0);
	
	signal local_calc_block:			std_logic_vector (block_width-1 downto 0);
	signal local_calc_code:				std_logic_vector (code_width-1 downto 0);
	signal error_syndrome:				std_logic_vector (code_width-1 downto 0);
	signal data_par_syn:				std_logic_vector (code_width-2 downto 0);
	signal overall_par_syn:				std_logic;
	
	signal data_par_error:				std_logic;
	signal overall_par_error:			std_logic;
	signal corr_n_uncorr:				std_logic;
	signal inner_corr_error:			std_logic;
	signal inner_corr_error_d:			std_logic;
	signal inner_uncorr_error:			std_logic;
	signal inner_uncorr_error_d:		std_logic;
	
	signal corrected_message:			std_logic_vector (data_width-1 downto 0);
	signal corrected_message_d:			std_logic_vector (data_width-1 downto 0);
	signal corrected_code:				std_logic_vector (code_width-1 downto 0);
	signal corrected_code_d:			std_logic_vector (code_width-1 downto 0);
	
	--constant onehot:					unsigned (block_width-1 downto 0) := to_unsigned(1, block_width);
	--signal faulty_bit_pos:	std_logic_vector (block_width-1 downto 0);
	
begin
	
	L_IN_REG: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			data_in_d <= (others => '0');
		elsif ( rising_edge(clk) ) then
			data_in_d <= data_in;
		end if;
	end process;
	inner_data_in <= data_in_d when registered_input = true else data_in;
	
	L_ENCODER: entity work.edac_encoder(arithmetic)
		generic map(
			data_width						=> data_width,
			registered_input				=> false,
			registered_output				=> false
		)
		port map(
			clk								=> clk,
			as_reset_n						=> as_reset_n,
			data_in							=> message_in,
			data_out						=> local_calc_block
		);
	
	code_in <= inner_data_in(code_width-1 downto 0);
	message_in <= inner_data_in(block_width-1 downto code_width);
	
	-- Calculate syndromes
	local_calc_code <= local_calc_block(code_width-1 downto 0);
	error_syndrome <= code_in xor local_calc_code;
	overall_par_syn <= error_syndrome(0);
	data_par_syn <= error_syndrome(code_width-1 downto 1);
	
	-- -- ///////////////////////	
	-- process ( inner_data_in, data_par_syn, overall_par_error )
		-- variable shift_number:		integer;
		-- variable data_par_syn_int:	integer;
		-- variable code_idx:			integer;
		-- variable mes_idx:			integer;
	-- begin
		
		-- shift_number := 0;
		-- data_par_syn_int := to_integer(unsigned(data_par_syn));
		-- code_idx := 0;
		-- mes_idx := code_width-1;
		-- for i in 0 to block_width-1 loop
			
			-- if( i = 1 or i = 2 or i = 4 or i = 8 or i = 16 or i = 32 or i = 64 ) then
				-- code_idx := code_idx + 1;
				-- shift_number := code_idx;
			-- else
				-- mes_idx := mes_idx + 1;
				-- shift_number := mes_idx;
			-- end if;
			
			-- if( i = data_par_syn_int ) then
				-- exit;
			-- end if;
			
		-- end loop;
		
		-- faulty_bit_pos <= std_logic_vector(shift_left( onehot, shift_number ));
		
		-- corrected_code(0) <= code_in(0) xor overall_par_error;
		-- corrected_code(code_width-1 downto 1) <= code_in(code_width-1 downto 1) xor faulty_bit_pos(code_width-1 downto 1);
		-- corrected_message <= message_in xor faulty_bit_pos(block_width-1 downto code_width);
		
	-- end process;
	-- -- ///////////////////////
	
	L_CORRECT_DATA: process ( code_in, message_in, data_par_syn, overall_par_error )
		variable err:		std_logic;
		variable code_idx:	integer;
		variable mes_idx:	integer;
	begin
	
		code_idx := 0;
		mes_idx := 0;
		for i in 0 to block_width-1 loop
			if( i = to_integer(unsigned(data_par_syn)) ) then
				err := '1';
			else
				err := '0';
			end if;
			
			if( i = 0 ) then
				corrected_code(code_idx) <= code_in(code_idx) xor overall_par_error;
				code_idx := code_idx + 1;
			elsif( i = 1 or i = 2 or i = 4 or i = 8 or i = 16 or i = 32 or i = 64 ) then
				corrected_code(code_idx) <= code_in(code_idx) xor err;
				code_idx := code_idx + 1;
			else
				corrected_message(mes_idx) <= message_in(mes_idx) xor err;
				mes_idx := mes_idx + 1;
			end if;
		end loop;
		
	end process;
	
	-- Signal errors
	data_par_error <= '1' when data_par_syn /= (data_par_syn'range => '0') else '0';
	overall_par_error <= '1' when data_par_error = '0' and overall_par_syn = '1' else '0';
	corr_n_uncorr <= overall_par_syn xor xor_reduce( data_par_syn );
	
	inner_corr_error <= '1' when (data_par_error = '1' and corr_n_uncorr = '1') or (overall_par_error = '1') else '0';
	inner_uncorr_error <= '1' when data_par_error = '1' and corr_n_uncorr = '0' else '0';
	
	L_OUT_REG: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			corrected_code_d <= (others => '0');
			corrected_message_d <= (others => '0');
			inner_corr_error_d <= '0';
			inner_uncorr_error_d <= '0';
		elsif ( rising_edge(clk) ) then
			corrected_code_d <= corrected_code;
			corrected_message_d <= corrected_message;
			inner_corr_error_d <= inner_corr_error;
			inner_uncorr_error_d <= inner_uncorr_error;
		end if;
	end process;
	code_out <= corrected_code_d when registered_output = true else corrected_code;
	data_out <= corrected_message_d when registered_output = true else corrected_message;
	corr_error <= inner_corr_error_d when registered_output = true else inner_corr_error;
	uncorr_error <= inner_uncorr_error_d when registered_output = true else inner_uncorr_error;
	
end architecture arithmetic;
---------------------------------------------------------------------------------------------------