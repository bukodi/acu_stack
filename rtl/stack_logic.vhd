library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------------------------------------------------
entity edac_protected_stack is
	generic (
		data_width      : integer range 0 to 16;
		stack_size_log2 : integer range 0 to 16;
		addr_push       : integer range 0 to 16;
		addr_pop        : integer range 0 to 16;
		addr_top        : integer range 0 to 16
	);

	port (
		adapt_push					 : in std_logic;
		adapt_pop					 : in std_logic;
		adapt_top					 : in std_logic;
		adapt_re 					 : in std_logic;
		adapt_we					 : in std_logic;
		adapt_re_ack                 : out std_logic;
		adapt_we_ack                 : out std_logic;
		adapt_data                   : inout std_logic_vector(data_width - 1 downto 0);
		clk                          : in std_logic;
		as_reset_n                   : in std_logic;
		recover_fsm_n                : in std_logic;
		user_fsm_invalid			 : out std_logic;
		mem_data_in                  : in std_logic_vector(data_width - 1 downto 0);
		mem_data_out                 : out std_logic_vector(data_width - 1 downto 0);
		mem_re                       : out std_logic;
		mem_we                       : out std_logic;
		mem_re_ack                   : in std_logic;
		mem_we_ack                   : in std_logic;
		mem_addr                     : out std_logic_vector(data_width - 1 downto 0)
	);
end entity edac_protected_stack;
------------------------------------------------------------------------
architecture rtl of edac_protected_stack is

	type state_t is(
		idle, 
		push_calc_addr, 
		push_before_mem, 
		push_after_mem, 
		pop_calc_addr,
		pop_before_mem, 
		pop_after_mem,
		top_calc_addr, 
		top_before_mem, 
		top_after_mem, 
		invalid
	);

	-- Points to the last used address (eg. top of the stack)
	signal stack_pointer : std_logic_vector(stack_size_log2 - 1 downto 0);
	signal state         : state_t;
	signal stack_is_empty    : std_logic;

begin
	L_USER_LOGIC : process (clk, as_reset_n)
	
	variable free_stack_space:	integer range 0 to stack_size_log2;
    
   	constant sp_all_zero : std_logic_vector(stack_pointer'range) := (others => '0');
   	constant sp_all_one : std_logic_vector(stack_pointer'range) := (others => '1');

	begin
		if (as_reset_n = '0') then
           	report "Reset detected";

			stack_pointer 		<= sp_all_zero;
			free_stack_space 	:= stack_size_log2 - 1;
            stack_is_empty 		<= '1';
			adapt_re_ack 		<= '1';
			adapt_we_ack 		<= '1';
			adapt_data 			<= (others => '0');
			user_fsm_invalid 	<= '0';
			mem_data_out 		<= (others => '0');
			mem_re 				<= '0';
			mem_we 				<= '0';
			mem_addr 			<= (others => '0');
			state 				<= idle;
            
		elsif (rising_edge(clk)) then
            report "clk rising edge, input state = " & state_t'image(state);
			case state is
				when idle => 			
                    adapt_we_ack <= '1';
                    adapt_re_ack <= '1';
					if (adapt_push = '1') then
						report "CASE: idle && adapt_push detected";
						-- check invalid state
						if (adapt_we /= '1' or adapt_re /= '0' 
							or adapt_pop /= '0' or adapt_top /= '0' 
							or mem_re_ack /= '1' or mem_we_ack /= '1') 
						then
							state <= invalid;
						else
							if (stack_is_empty = '1') then
                            	report "PROC: push when stack is empty";
                                stack_is_empty 		<= '0';
								stack_pointer		<=	(others => '0');
                                mem_addr <= (others => '0');
								mem_data_out <= adapt_data;
	                            adapt_we_ack <= '0';
								state					<=	push_calc_addr;
							elsif ( stack_pointer = sp_all_one ) then 
                            	report "PROC: push when stack is full";
								state					<=	invalid;
							else
                            	report "PROC: push and increment stack_pointer";
								stack_pointer <= std_logic_vector(unsigned(stack_pointer) + 1);
                                mem_addr <= std_logic_vector(unsigned(stack_pointer) + 1);
                            	mem_data_out <= adapt_data;
	                            adapt_we_ack <= '0';
								state					<=	push_calc_addr;
							end if;
						end if;

					elsif (adapt_pop = '1') then
						report "CASE: idle && adapt_pop detected";
						-- check invalid state
						if (adapt_re /= '1' or adapt_we /= '0' 
                        	or adapt_push /= '0' or adapt_top /= '0' 
                            or mem_re_ack /= '0' or mem_we_ack /= '0') 
						then
							state <= invalid;
						else
							free_stack_space		:=	free_stack_space + 1;
							state <=	pop_before_mem;
						end if;
                        
                        
					elsif (adapt_top = '1') then
						report "CASE: idle && adapt_top detected";
						-- check invalid state
						if (adapt_re /= '1' or adapt_we /= '0' 
                        	or adapt_push /= '0' or adapt_pop /= '0' 
                            or mem_re_ack /= '0' or mem_we_ack /= '0') 
						then
							state <= invalid;
						else
							state <= top_before_mem;
						end if;
                    else
						report "CASE: idle but none of adapt_push/pop/top detected";
					end if; -- END OF when idle

				--PUSH--------------------------------------------------
				when push_calc_addr =>	
					report "CASE: push_calc_addr";
                	if (adapt_we /= '1' or adapt_re /= '0' 
                    	or adapt_push /= '1' or adapt_pop /= '0' or adapt_top /= '0' 
                        or mem_re_ack /= '1' or mem_we_ack /= '1') 
					then
						state <= invalid;
					else
						mem_we <= '1';
						state <= push_before_mem;
					end if;
										
				when push_before_mem =>	
					if (adapt_re /= '0' 
                       	or adapt_pop /= '0' or adapt_top /= '0' 
						or mem_re_ack /= '1') 
					then
						state <= invalid;
                    else 
	                	if (mem_we_ack = '0') then
							report "CASE: push_before_mem and mem_we_ack is LOW";
                            mem_we <= '0';
							state <= push_after_mem;                            
						else
							report "CASE:  push_before_mem and waiting for mem_we_ack LOW";
						end if;
					end if;
										
				when push_after_mem =>	
					report "CASE: push_after_mem";
					if (adapt_re /= '0' 
                        or adapt_pop /= '0' or adapt_top /= '0' 
                        or mem_we /= '0' or mem_re_ack /= '1') 
					then
						state <= invalid;
					else
	                	if (mem_we_ack = '1') then
							report "CASE: push_before_mem and mem_we_ack is LOW";
							adapt_we_ack <= '1';
							state	<= idle;
						else
							report "CASE:  push_before_mem and waiting for mem_we_ack HIGH";
						end if;
					end if;
										
				--POP---------------------------------------------------
				when pop_calc_addr =>	
					report "CASE: pop_calc_addr";
                	if (adapt_re /= '1' or adapt_we /= '0' 
                		or adapt_pop /= '1' or adapt_top /= '0' or adapt_push /= '0' 
                		or mem_re_ack /= '0' or mem_we_ack /= '0') 
					then
						state <= invalid;
					else
						mem_addr	<= stack_pointer;
						mem_re		<= adapt_re;
						state		<= pop_before_mem;
					end if;
										
				when pop_before_mem =>	
					report "CASE: pop_before_mem";
                	if (mem_re_ack = '1') then
						if (adapt_re /= '1' or adapt_we /= '0' 
                        	or adapt_top /= '0' or adapt_push /= '0' 
                            or mem_we_ack /= '0') 
						then
							state <= invalid;
						else
							adapt_data		<= mem_data_in;
							adapt_re_ack	<= mem_re_ack;
							state			<= pop_after_mem;
						end if;
					end if;
										
				when pop_after_mem =>	
					report "CASE: pop_after_mem";
                	if (adapt_re = '0') then
						if (adapt_we /= '0' 
                    		or adapt_top /= '0' or adapt_push /= '0' 
                        	or mem_re_ack /= '1' or mem_we_ack /= '0') 
						then
							state <= invalid;
						else
							mem_re			<= adapt_re;
							stack_pointer	<= std_logic_vector(unsigned(stack_pointer) - 1);
							state			<= idle;
						end if;
					end if;
										
				--TOP---------------------------------------------------
				when top_calc_addr =>	
					report "CASE: top_calc_addr";
                	if (adapt_re /= '1' or adapt_we /= '0' 
                    	or adapt_top /= '1' or adapt_pop /= '0' or adapt_push /= '0' 
                        or mem_re_ack /= '0' or mem_we_ack /= '0') 
					then
						state <= invalid;
					else
						mem_addr	<= stack_pointer;
						mem_re		<= adapt_re;
						state		<= top_before_mem;
					end if;
										
				when top_before_mem =>	
					report "CASE: top_before_mem";
	                if (mem_re_ack = '1') then
						if (adapt_re /= '1' or adapt_we /= '0' 
        	            	or adapt_pop /= '0' or adapt_push /= '0' 
            	            or mem_we_ack /= '0') 
						then
							state <= invalid;
						else
							adapt_data		<= mem_data_in;
							adapt_re_ack	<= mem_re_ack;
							state			<= top_after_mem;
						end if;
					end if;
										
				when top_after_mem =>	
					report "CASE: top_after_mem";
                	if (adapt_re = '0') then
						if (adapt_we /= '0' 
                	        or adapt_pop /= '0' or adapt_push /= '0' 
                    	    or mem_re_ack /= '1' or mem_we_ack /= '0') 
						then
							state <= invalid;
						else
							mem_re			<= adapt_re;
							state			<= idle;
						end if;
					end if;
										
				--INVALID STATE-----------------------------------------
				when invalid =>			
					report "CASE: invalid";
                	user_fsm_invalid <= '1';
				
				when others =>
					report "CASE: when others (This should not happen)";
                	state <= invalid;
				
			end case;
		end if;
	end process;
end architecture rtl;
------------------------------------------------------------------------
--to do: -indulaskor alaphelyzetbe allito 
--	 -invalidbol recover esten alaphelyzetbe allito resz
--	 -pop eseten figyelje h ures e a stack es az empty flaget huzza fel 1-esbe

