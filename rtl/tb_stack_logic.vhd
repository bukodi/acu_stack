-- Testbench for ACU stack
library IEEE;
use IEEE.std_logic_1164.all;
use edac_protected_ram_pkg.all;

-- entity declaration for your testbench.
entity testbench is
	--Notice that the entity port list is empty here.
end testbench;

architecture tb of testbench is

	constant CLK_PERIOD : time := 10 ns;
    constant DATA_WIDTH : integer := 4;
    constant ADDR_WIDTH : integer := 4;
    constant TEST_DATA_0 : std_logic_vector( DATA_WIDTH-1 downto 0) := "1010";
    constant TEST_DATA_1 : std_logic_vector( DATA_WIDTH-1 downto 0) := "0110";


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
			adapt_data                   : inout std_logic_vector( data_width-1 downto 0);
			clk                          : in std_logic;
			as_reset_n                   : in std_logic;
			recover_fsm_n                : in std_logic;
			user_fsm_invalid             : out std_logic;
			mem_data_in                  : in std_logic_vector( data_width-1 downto 0);
			mem_data_out                 : out std_logic_vector( data_width-1 downto 0);
			mem_re                       : out std_logic;
			mem_we                       : out std_logic;
			mem_re_ack                   : in std_logic;
			mem_we_ack                   : in std_logic;
			mem_addr                     : out std_logic_vector( stack_size_log2 - 1 downto 0)
		);
	end component edac_protected_stack;
    
    ---------------------------------------------------------------------------------------------------
	component edac_protected_ram is
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
	end component edac_protected_ram;

    
	--declare inputs and outputs. Inputs initialized to zero.
	signal adapt_push                   : std_logic := '0';
	signal adapt_pop                    : std_logic := '0';
	signal adapt_top                    : std_logic := '0';
	signal adapt_re                     : std_logic := '0';
	signal adapt_we                     : std_logic := '0';
	signal adapt_re_ack                 : std_logic := '0';
	signal adapt_we_ack                 : std_logic;
	signal adapt_data                   : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal clk                          : std_logic := '0';
	signal as_reset_n                   : std_logic := '1';
	signal recover_fsm_n                : std_logic := '1';
	signal user_fsm_invalid             : std_logic;
	signal mem_data_in                  : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal mem_data_out                 : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal mem_re                       : std_logic;
	signal mem_we                       : std_logic;
	signal mem_re_ack                   : std_logic;
	signal mem_we_ack                   : std_logic;
	signal mem_addr                     : std_logic_vector( ADDR_WIDTH-1 downto 0);
    
    signal mem_uncorrectable_error		: std_logic;
	signal mem_correctable_error		: std_logic;
	signal mem_scrubber_invalid_state_error: std_logic;

	signal mem_error_injection: std_logic_vector (1 downto 0) := (others => '0');
	signal mem_force_scrubbing:	std_logic := '0';
	signal mem_scrubber_recover_fsm_n: std_logic := '1';
	signal mem_dbg_scrubber_invalid_state_error_injection: std_logic := '0';

		
begin

			-- Clock process definitions(clock with 50% duty cycle is generated here.
			Clk_process : process
			begin
				Clk <= '0';
				wait for CLK_PERIOD/2;
				Clk <= '1';
				wait for CLK_PERIOD/2;
			end process;
 
			fsm_error_monitor : process
			begin
				wait until user_fsm_invalid = '1';
                assert user_fsm_invalid /= '1' 
               		report "invalid state occured"  
                    severity failure;
			end process;

			push_top_pop_process : process
			begin
            
            -- Initial RESET --
				as_reset_n <= '0';
				wait for CLK_PERIOD/10;
				as_reset_n <= '1';
				wait for CLK_PERIOD;
			
			-- First PUSH operation
            	adapt_data <= TEST_DATA_0;
				adapt_we <= '1';
				wait for CLK_PERIOD/10;
				adapt_push <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_we_ack = '0' 
                	report "adapt_we_ack is not pulled down"  
                    severity failure;
				adapt_push <= '0'; 
				adapt_we <= '0';
                wait until mem_we_ack = '1'; -- mem write completed
                wait for CLK_PERIOD/10*15;
                assert adapt_we_ack = '1' 
                	report "adapt_we_ack isn't swithed back to high"  
                    severity failure;                

				wait for CLK_PERIOD * 3;
                
			-- Second PUSH operation
            	adapt_data <= TEST_DATA_1;
				adapt_we <= '1';
				wait for CLK_PERIOD/10;
				adapt_push <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_we_ack = '0' 
                	report "adapt_we_ack is not pulled down"  
                    severity failure;
				adapt_push <= '0'; 
				adapt_we <= '0';
                wait until mem_we_ack = '1'; -- mem write completed
                wait for CLK_PERIOD/10*15;
                assert adapt_we_ack = '1' 
                	report "adapt_we_ack isn't swithed back to high"  
                    severity failure;                

				wait for CLK_PERIOD * 3;
                
			-- Single TOP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_top <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0'
                	report "adapt_re_ack is not pulled down"
                    severity failure;
				adapt_top <= '0';
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD/10*15;
                assert adapt_re_ack = '1'
                	report "adapt_re_ack isn't swithed back to high"
                    severity failure;
                assert adapt_data /= TEST_DATA_1
                	report "wrong data returned"
                    severity failure;

				wait for CLK_PERIOD * 3;

			-- First POP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_pop <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_pop <= '0'; 
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD/10*15;
                assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data /= TEST_DATA_1 
                	report "wrong data returned"
                    severity failure;

				wait for CLK_PERIOD * 3;
                
			-- Second POP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_pop <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_pop <= '0'; 
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD/10*15;
                assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data /= TEST_DATA_0 
                	report "wrong data returned"
                    severity failure;

				wait for CLK_PERIOD * 3;
                
			-- Trailing edge
                report "*** TESTS COMPLETED SUCCESSFULLY ***";  
				wait for CLK_PERIOD*100;
                
			end process;

	-- instantiate the design under test (DUT)
	DUT : edac_protected_stack
		generic map(
		data_width      => DATA_WIDTH, 
		stack_size_log2 => ADDR_WIDTH, 
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

	-- instantiate edac protected memory 
	MEM : edac_protected_ram
		generic map(
		address_width						=> ADDR_WIDTH,
		data_width							=> DATA_WIDTH,
		edac_latency						=> 4,
		prot_bram_registered_in				=> true,
		prot_bram_registered_out			=> true,
		prot_bram_scrubber_present			=> false,
		prot_bram_scrb_prescaler_width		=> 1,
		prot_bram_scrb_timer_width			=> 1, 
		init_from_file						=> false,
		initfile_path						=> "",
		initfile_format						=> ""
		)
		port map(
			clk  => clk,
			as_reset_n => as_reset_n,
			reset_error_flags_n => recover_fsm_n,
			uncorrectable_error => mem_uncorrectable_error,
			correctable_error => mem_correctable_error,
			we => mem_we,
			we_ack => mem_we_ack, 
			re => mem_re,
			re_ack => mem_re_ack, 
			write_address => mem_addr,
			read_address => mem_addr, 
			data_in => mem_data_out,
			data_out => mem_data_in,
			error_injection => mem_error_injection,
		 	force_scrubbing => mem_force_scrubbing,
		 	scrubber_invalid_state_error => mem_scrubber_invalid_state_error,
		 	scrubber_recover_fsm_n => mem_scrubber_recover_fsm_n,
			dbg_scrubber_invalid_state_error_injection => mem_dbg_scrubber_invalid_state_error_injection
		); 

end architecture tb;
