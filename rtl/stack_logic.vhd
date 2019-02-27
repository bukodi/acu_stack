library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------------------------
entity edac_protected_stack is
	generic (
		data_width:							integer range 0 to 16;
		stack_size_log2:					integer range 0 to 16;
		addr_push:							integer range 0 to 16;
		addr_pop:							integer range 0 to 16;
		addr_top:							integer range 0 to 16
	);
	
	port (
		adapt_push:							in		std_logic;
		adapt_pop:							in		std_logic;
		adapt_top:							in		std_logic;
		adapt_re:							in	 	std_logic;
		adapt_we:							in		std_logic;
		adapt_re_ack:						out		std_logic;
		adapt_we_ack:						out		std_logic;
		adapt_data							inout	std_logic_vector(data_width-1 downto 0);
		clk:								in		std_logic;
		as_reset_n:							in		std_logic;
		recover_fsm_n:						in		std_logic;
		user_fsm_invalid_state_error:		out		std_logic;
		mem_data_in:						in		std_logic_vector(data_width-1 downto 0);
		mem_data_out:						out		std_logic_vector(data_width-1 downto 0);
		mem_re:								out		std_logic;
		mem_we:								out		std_logic;
		mem_re_ack:							in		std_logic;
		mem_we_ack:							in		std_logic;
		mem_addr							out		std_logic_vector(data_width-1 downto 0);
	);
end entity edac_protected_stack;
---------------------------------------------------------------------------------------------------
architecture rtl of edac_protected_stack is

    type state is(
    	proc_command,
    	mem_op_req,
    	mem_op_compl,
    	adapt_op_req,
    	adapt_op_compl
    )
	
begin
    L_USER_LOGIC: process(clk,as_reset_n)
    -- Points to the last used address (eg. top of the stack)
    variable stack_pointer:                 uinsinged(stack_size_log2-1 downto 0);
    
    begin
        if(as_reset_n='0') then
            --
        elsif(rising_edge(clk)) then
            --PUSH
            if(adapt_push = '1' and adapt_we = '1') then
                if(adapt_pop /= '0' or adapt_top /= '0' or adapt_we /= '0') then
                    user_fsm_invalid_state_error <= '1';
                    report "bajvan"
                else then
                    mem_we <= adapt_we;
                    case state when po

            --POP
            --TOP	

end architecture rtl;
---------------------------------------------------------------------------------------------------
