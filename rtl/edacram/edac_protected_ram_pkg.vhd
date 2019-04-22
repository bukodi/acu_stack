library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------------------------
package edac_protected_ram_pkg is
	
	subtype data_width_range is integer range 2 to 64;
	
	constant data_width_min:			integer;
	constant data_width_max:			integer;
	constant code_width_min:			integer;
	constant code_width_max:			integer;
	constant block_width_min:			integer;
	constant block_width_max:			integer;
	
	-- Function for calculating code size
	function get_code_size(
		constant message_size:	data_width_range
	) return integer;
	
	--------------------------------------------------------
    --------------------------------------------------------
    --------------------------------------------------------
	
	-- Function for calculating decoding delay based on parameters
	function get_decoding_delay(
		constant registered_input:	boolean;
		constant registered_output:	boolean
	) return integer;
	
end package edac_protected_ram_pkg;


package body edac_protected_ram_pkg is

	function get_code_size(
		constant message_size:	data_width_range
	) return integer is
		variable code_size:		integer := 2;
	begin

		while ( 2**code_size < code_size+message_size+1 ) loop
			code_size := code_size + 1;
		end loop;
		
		-- Return calculated code_size+1 for including overall parity bit
		return code_size+1;

	end function;
	
	--------------------------------------------------------
    --------------------------------------------------------
    --------------------------------------------------------
	
	function get_decoding_delay(
		constant registered_input:	boolean;
		constant registered_output:	boolean
	) return integer is
		variable delay:		integer := 1;
	begin
		
		if( registered_input = true ) then
			delay := delay + 1;
		end if;
		
		if( registered_output = true ) then
			delay := delay + 1;
		end if;
		
		return delay;
		
	end function;
	
	--------------------------------------------------------
    --------------------------------------------------------
    --------------------------------------------------------
	
	constant data_width_min:			integer	:= data_width_range'low;
	constant data_width_max:			integer	:= data_width_range'high;
	constant code_width_min:			integer	:= get_code_size(data_width_min);
	constant code_width_max:			integer	:= get_code_size(data_width_max);
	constant block_width_min:			integer	:= data_width_min + code_width_min;
	constant block_width_max:			integer	:= data_width_max + code_width_max;

end package body edac_protected_ram_pkg;