-- Testbench for ACU stack
library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration for your testbench.
entity testbench is
	--Notice that the entity port list is empty here.
end testbench;

architecture tb of testbench is

	-- component declaration for the unit under test (uut)
	component edac_protected_stack is
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
			adapt_data                   : inout std_logic_vector(4 - 1 downto 0);
			clk                          : in std_logic;
			as_reset_n                   : in std_logic;
			recover_fsm_n                : in std_logic;
			user_fsm_invalid             : out std_logic;
			mem_data_in                  : in std_logic_vector(4 - 1 downto 0);
			mem_data_out                 : out std_logic_vector(4 - 1 downto 0);
			mem_re                       : out std_logic;
			mem_we                       : out std_logic;
			mem_re_ack                   : in std_logic;
			mem_we_ack                   : in std_logic;
			mem_addr                     : out std_logic_vector(4 - 1 downto 0)
		);
	end component edac_protected_stack;
    
    
	--declare inputs and outputs. Inputs initialized to zero.
	signal adapt_push                   : std_logic := '0';
	signal adapt_pop                    : std_logic := '0';
	signal adapt_top                    : std_logic := '0';
	signal adapt_re                     : std_logic := '0';
	signal adapt_we                     : std_logic := '0';
	signal adapt_re_ack                 : std_logic := '1';
	signal adapt_we_ack                 : std_logic;
	signal adapt_data                   : std_logic_vector(4 - 1 downto 0);
	signal clk                          : std_logic := '0';
	signal as_reset_n                   : std_logic := '1';
	signal recover_fsm_n                : std_logic := '1';
	signal user_fsm_invalid             : std_logic;
	signal mem_data_in                  : std_logic_vector(4 - 1 downto 0);
	signal mem_data_out                 : std_logic_vector(4 - 1 downto 0);
	signal mem_re                       : std_logic;
	signal mem_we                       : std_logic;
	signal mem_re_ack                   : std_logic := '0';
	signal mem_we_ack                   : std_logic := '0';
	signal mem_addr                     : std_logic_vector(4 - 1 downto 0);

-- define the period of clock here.
	constant CLK_PERIOD : time := 10 ns;

begin

			-- Clock process definitions(clock with 50% duty cycle is generated here.
			Clk_process : process
			begin
				Clk <= '0';
				wait for CLK_PERIOD/2;
				Clk <= '1';
				wait for CLK_PERIOD/2;
			end process;
 

			push_process : process
			begin
				as_reset_n <= '0';
				wait for CLK_PERIOD/2*5;
				as_reset_n <= '1';

				wait for CLK_PERIOD/2*5;
				adapt_we <= '1';
				wait for CLK_PERIOD/2*5;
				adapt_push <= '1';
				wait for CLK_PERIOD/2*6;
				adapt_push <= '0';
				wait for CLK_PERIOD*100;
			end process;

	-- instantiate the unit under test (uut)
	UUT : edac_protected_stack
		generic map(
		data_width      => 4, 
		stack_size_log2 => 4, 
		addr_push       => 1, 
		addr_pop        => 2, 
		addr_top        => 3 
		)
		port map(
			adapt_push                   => adapt_push, 
			adapt_pop                    => adapt_pop, 
			adapt_top                    => adapt_top, 
			adapt_re                     => adapt_re, 
			adapt_we                     => adapt_we, 
			adapt_re_ack                 => adapt_re_ack, 
			adapt_we_ack                 => adapt_we_ack, 
			adapt_data                   => adapt_data, 
			clk                          => clk, 
			as_reset_n                   => as_reset_n, 
			recover_fsm_n                => recover_fsm_n, 
			user_fsm_invalid             => user_fsm_invalid, 
			mem_data_in                  => mem_data_in, 
			mem_data_out                 => mem_data_out, 
			mem_re                       => mem_re, 
			mem_we                       => mem_we, 
			mem_re_ack                   => mem_re_ack, 
			mem_we_ack                   => mem_we_ack, 
			mem_addr                     => mem_addr
		); 

end architecture tb;
