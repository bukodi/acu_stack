library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------------------------
entity edac_protected_stack is
	generic (
		data_width      : integer range 0 to 16;
		stack_size_log2 : integer range 0 to 16;
		addr_push       : integer range 0 to 16;
		addr_pop        : integer range 0 to 16;
		addr_top        : integer range 0 to 16
	);
 
	port (
		adapt_push : in std_logic;
		adapt_pop  : in std_logic;
		adapt_top  : in std_logic;
		-- to do: adapt_re/we ports redundant can be calc from push/pop/top
		adapt_re : in std_logic;
		adapt_we : in std_logic;
		--
		adapt_re_ack                 : out std_logic;
		adapt_we_ack                 : out std_logic;
		adapt_data                   : inout std_logic_vector(data_width - 1 downto 0);
		clk                          : in std_logic;
		as_reset_n                   : in std_logic;
		recover_fsm_n                : in std_logic;
		user_fsm_invalid_state_error : out std_logic;
		mem_data_in                  : in std_logic_vector(data_width - 1 downto 0);
		mem_data_out                 : out std_logic_vector(data_width - 1 downto 0);
		mem_re                       : out std_logic;
		mem_we                       : out std_logic;
		mem_re_ack                   : in std_logic;
		mem_we_ack                   : in std_logic;
		mem_addr                     : out std_logic_vector(data_width - 1 downto 0)
	);
end entity edac_protected_stack;
---------------------------------------------------------------------------------------------------
architecture rtl of edac_protected_stack is

	type state_t is(
	idle, 
	process_command, 
	push_calc_addr, 
	push_before_mem, 
	push_after_mem, 
	pop_before_mem, 
	pop_after_mem, 
	top_before_mem, 
	top_after_mem, 
	invalid
	);
 
	signal stack_empty : std_logic;
	signal state       : state_t;

begin
	L_USER_LOGIC : process (clk, as_reset_n)
		-- Points to the last used address (eg. top of the stack)
		variable stack_pointer : uinsinged(stack_size_log2 - 1 downto 0);
 
	begin
		if (as_reset_n = '0') then
			--
		elsif (rising_edge(clk)) then
			case state is
				when idle => if (adapt_push = '1') then
					-- check invalid state
					if (adapt_we /= '1' or adapt_re /= '0' or adapt_pop /= '0' or adapt_top /= '0' or mem_re_ack /= '0' or mem_we_ack /= '0') then
						state <= invalid;
					else
						state <= push_before_mem;
						if (stack_empty = '1') then
							stack_pointer <= '0';
							stack_empty   <= '0';
						else
							stack_pointer <= stack_logic_vector(unsigned(stack_pointer) + 1);
						end if;
					end if;
			elsif (adapt_pop = '1') then
				-- check invalid state
				if (adapt_re /= '1' or adapt_we /= '0' or adapt_push /= '0' or adapt_top /= '0' or mem_re_ack /= '0' or mem_we_ack /= '0') then
					state <= invalid;
				else
					state <= pop_before_mem;
				end if;
			elsif (adapt_top = '1') then
				-- check invalid state
				if (adapt_re /= '1' or adapt_we /= '0' or adapt_push /= '0' or adapt_pop /= '0' or mem_re_ack /= '0' or mem_we_ack /= '0') then
					state <= invalid;
				else
					state <= top_before_mem;
				end if;
			end if;
 
			--PUSH--------------------------------------------------
				when push_calc_addr => if (adapt_we /= '1' or adapt_re /= '0' or adapt_push /= '1' or adapt_pop /= '0' or adapt_top /= '0' or mem_re_ack /= '0' or mem_we_ack /= '0') then
				state <= invalid;
				else
				mem_addr     <= stack_pointer;
				mem_data_out <= adapt_data;
				state        <= push_before_mem;
		end if;
				when push_before_mem => if (adapt_we /= '1' or adapt_re /= '0' or adapt_push /= '1' or adapt_pop /= '0' or adapt_top /= '0' or mem_re_ack /= '0' or mem_we_ack /= '0') then
			state <= invalid;
	else
		mem_we <= '1';
		state  <= push_wait_mem;
	end if;
				when push_after_mem => if (mem_we_ack = '1') then
			if (adapt_we /= '1' or adapt_re /= '0' or adapt_push /= '1' or adapt_pop /= '0' or adapt_top /= '0' or mem_re_ack /= '0') then
				state <= invalid;
			else
				adapt_we_ack <= mem_we_ack;
				state        <= idle;
			end if;
	end if;
	--POP---------------------------------------------------
	--when pop_before_mem
	--when pop_after_mem
	--TOP---------------------------------------------------
	--when top_before_mem
	--when top_after_mem
	--INVALID STATE-----------------------------------------
	--when invalid
 
				when others => state <= error;
 
	end case;
end if;
end process;
end architecture rtl;
---------------------------------------------------------------------------------------------------
