library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.edac_protected_ram_pkg.all;
---------------------------------------------------------------------------------------------------
entity edac_encoder is
	generic (
		data_width:						data_width_range := 32;
		registered_input:				boolean := true;
		registered_output:				boolean := true
	);
	
	port (
		clk:						in	std_logic;
		as_reset_n:					in	std_logic;
		
		data_in:					in	std_logic_vector (data_width-1 downto 0);
		data_out:					out	std_logic_vector (data_width+get_code_size(data_width)-1 downto 0)
	);
end entity edac_encoder;
---------------------------------------------------------------------------------------------------
architecture arithmetic of edac_encoder is
	
	constant code_width:	integer range code_width_min to code_width_max		:= get_code_size(data_width);
	constant block_width:	integer range block_width_min to block_width_max	:= data_width + code_width;
	
	type bit_selection_array_t is array (0 to code_width_max-2) of std_logic_vector (data_width_max-1 downto 0);
	type data_vector_array_t is array (0 to code_width-2) of std_logic_vector (data_width-1 downto 0);
	
	constant bit_selection:	bit_selection_array_t
				:= (B"1010101101010101010101010101010101010110101010101010110101011011",
					B"1100110110011001100110011001100110011011001100110011011001101101",
					B"1111000111100001111000011110000111100011110000111100011110001110",
					B"0000000111111110000000011111111000000011111111000000011111110000",
					B"0000000111111111111111100000000000000011111111111111100000000000",
					B"0000000111111111111111111111111111111100000000000000000000000000",
					B"1111111000000000000000000000000000000000000000000000000000000000");
		
	signal selection_vectors:			data_vector_array_t;
	signal selected_data:				data_vector_array_t;
	signal code:						std_logic_vector (code_width-1 downto 0);
	
	signal data_in_d:					std_logic_vector (data_width-1 downto 0);
	signal message:						std_logic_vector (data_width-1 downto 0);
	signal result:						std_logic_vector (block_width-1 downto 0);
	signal result_d:					std_logic_vector (block_width-1 downto 0);
	
begin
	
	L_IN_REG: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			data_in_d <= (others => '0');
		elsif ( rising_edge(clk) ) then
			data_in_d <= data_in;
		end if;
	end process;
	message <= data_in_d when registered_input = true else data_in;
	
	L_GENERATE_SELECTION_VECTORS: for i in selection_vectors'range generate
		selection_vectors(i) <= bit_selection(i)(data_width-1 downto 0);
	end generate;
	
	L_SELECT_MESSAGE_BITS: for i in selected_data'range generate
		selected_data(i) <= message and selection_vectors(i);
	end generate;
	
	L_CODE: for i in 1 to code_width-1 generate
		code(i) <= xor_reduce( selected_data(i-1) );
	end generate;
	code(0) <= xor_reduce( message & code(code_width-1 downto 1) );
	
	-- L_CODE: for i in selected_data'range generate
		-- code(i) <= xor_reduce( selected_data(i) );
	-- end generate;
	-- code(code'high) <= xor_reduce( message & code(code'high-1 downto 0) );
	
	result <= message & code;
	
	L_OUT_REG: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			result_d <= (others => '0');
		elsif ( rising_edge(clk) ) then
			result_d <= result;
		end if;
	end process;
	data_out <= result_d when registered_output = true else result;

end architecture arithmetic;
---------------------------------------------------------------------------------------------------