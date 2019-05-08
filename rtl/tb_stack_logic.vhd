-- Testbench for ACU stack
library IEEE;
use IEEE.std_logic_1164.all;
use edac_protected_ram_pkg.all;

-- entity declaration for your testbench.
entity testbench is
	--Notice that the entity port list is empty here.
end testbench;

architecture tb of testbench is

	constant CLK_PERIOD : time := 10 us;
    constant DATA_WIDTH : integer := 16;
    constant ADDR_WIDTH : integer := 5;
    constant TEST_DATA_0 : std_logic_vector( DATA_WIDTH-1 downto 0) := "0000111101001010";
    constant TEST_DATA_1 : std_logic_vector( DATA_WIDTH-1 downto 0) := "1111000011010110";
    
	--declare inputs and outputs. Inputs initialized to zero.
	signal adapt_push                   : std_logic := '0';
	signal adapt_pop                    : std_logic := '0';
	signal adapt_top                    : std_logic := '0';
	signal adapt_re                     : std_logic := '0';
	signal adapt_we                     : std_logic := '0';
	signal adapt_re_ack                 : std_logic := '0';
	signal adapt_we_ack                 : std_logic;
	signal adapt_data_in                : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal adapt_data_out               : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal clk                          : std_logic := '0';
	signal raw_reset_n                  : std_logic := '1';
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
				raw_reset_n <= '0';
				wait for CLK_PERIOD/10;
				raw_reset_n <= '1';
				wait for CLK_PERIOD * 4;
			
			-- First PUSH operation
            	adapt_data_in <= TEST_DATA_0;
				wait for CLK_PERIOD/10;

				adapt_we <= '1';
				wait for CLK_PERIOD/10;
				adapt_push <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_we_ack = '0' 
                	report "adapt_we_ack is not pulled down"  
                    severity failure;
                
				adapt_we <= '0';
                wait until mem_we_ack = '1'; -- mem write completed
                wait for CLK_PERIOD/10*15;
                assert adapt_we_ack = '1' 
                	report "adapt_we_ack isn't swithed back to high"  
                    severity failure;                

				adapt_push <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Second PUSH operation
            	adapt_data_in <= TEST_DATA_1;
				adapt_we <= '1';
				wait for CLK_PERIOD/10;
				adapt_push <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_we_ack = '0' 
                	report "adapt_we_ack is not pulled down"  
                    severity failure;                                
				adapt_we <= '0';
                wait until mem_we_ack = '1'; -- mem write completed
                wait for CLK_PERIOD/10*15;
                assert adapt_we_ack = '1' 
                	report "adapt_we_ack isn't swithed back to high"  
                    severity failure;                

				adapt_push <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Single TOP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_top <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD*3;

				assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data_out = TEST_DATA_1 
                	report "First TOP failed wrong data returned." 
                    & " expected=" &  to_string(TEST_DATA_1)
                    & " actual=" &  to_string(adapt_data_out)
                    severity failure;

				wait for CLK_PERIOD * 2;
				adapt_top <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- First POP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_pop <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD*3;

				assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data_out = TEST_DATA_1 
                	report "First POP failed, wrong data returned." 
                    & " expected=" &  to_string(TEST_DATA_1)
                    & " actual=" &  to_string(adapt_data_out)
                    severity failure;

				wait for CLK_PERIOD * 2;
				adapt_pop <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Second POP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_pop <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD*3;

                assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data_out = TEST_DATA_0 
                	report "Second POP failed, wrong data returned." 
                    & " expected=" &  to_string(TEST_DATA_0)
                    & " actual=" &  to_string(adapt_data_out)
                    severity failure;

				wait for CLK_PERIOD * 2;
				adapt_pop <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Trailing edge
                report "*** TESTS COMPLETED SUCCESSFULLY ***";  
				wait for CLK_PERIOD*100;
                
			end process;

	-- instantiate the design under test (DUT)
	DUT : entity work.edac_protected_stack(rtl)
		generic map(
		metastable_filter_bypass_recover_fsm_n => true,
		data_width      => DATA_WIDTH, 
		stack_size_log2 => ADDR_WIDTH 
		)
		port map(
			adapt_push                   => adapt_push, 
			adapt_pop                    => adapt_pop, 
			adapt_top                    => adapt_top, 
			adapt_re                     => adapt_re, 
			adapt_we                     => adapt_we, 
			adapt_re_ack                 => adapt_re_ack, 
			adapt_we_ack                 => adapt_we_ack, 
			adapt_data_in                => adapt_data_in, 
			adapt_data_out               => adapt_data_out, 
			clk                          => clk, 
			raw_reset_n                  => raw_reset_n, 
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
	MEM : entity work.edac_protected_ram( protected_bram )
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
			as_reset_n => raw_reset_n,
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
-- Testbench for ACU stack
library IEEE;
use IEEE.std_logic_1164.all;
use edac_protected_ram_pkg.all;

-- entity declaration for your testbench.
entity testbench is
	--Notice that the entity port list is empty here.
end testbench;

architecture tb of testbench is

	constant CLK_PERIOD : time := 10 us;
    constant DATA_WIDTH : integer := 16;
    constant ADDR_WIDTH : integer := 5;
    constant TEST_DATA_0 : std_logic_vector( DATA_WIDTH-1 downto 0) := "0000111101001010";
    constant TEST_DATA_1 : std_logic_vector( DATA_WIDTH-1 downto 0) := "1111000011010110";
    
	--declare inputs and outputs. Inputs initialized to zero.
	signal adapt_push                   : std_logic := '0';
	signal adapt_pop                    : std_logic := '0';
	signal adapt_top                    : std_logic := '0';
	signal adapt_re                     : std_logic := '0';
	signal adapt_we                     : std_logic := '0';
	signal adapt_re_ack                 : std_logic := '0';
	signal adapt_we_ack                 : std_logic;
	signal adapt_data_in                : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal adapt_data_out               : std_logic_vector( DATA_WIDTH-1 downto 0);
	signal clk                          : std_logic := '0';
	signal raw_reset_n                  : std_logic := '1';
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
				raw_reset_n <= '0';
				wait for CLK_PERIOD/10;
				raw_reset_n <= '1';
				wait for CLK_PERIOD * 4;
			
			-- First PUSH operation
            	adapt_data_in <= TEST_DATA_0;
				wait for CLK_PERIOD/10;

				adapt_we <= '1';
				wait for CLK_PERIOD/10;
				adapt_push <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_we_ack = '0' 
                	report "adapt_we_ack is not pulled down"  
                    severity failure;
                
				adapt_we <= '0';
                wait until mem_we_ack = '1'; -- mem write completed
                wait for CLK_PERIOD/10*15;
                assert adapt_we_ack = '1' 
                	report "adapt_we_ack isn't swithed back to high"  
                    severity failure;                

				adapt_push <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Second PUSH operation
            	adapt_data_in <= TEST_DATA_1;
				adapt_we <= '1';
				wait for CLK_PERIOD/10;
				adapt_push <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_we_ack = '0' 
                	report "adapt_we_ack is not pulled down"  
                    severity failure;                                
				adapt_we <= '0';
                wait until mem_we_ack = '1'; -- mem write completed
                wait for CLK_PERIOD/10*15;
                assert adapt_we_ack = '1' 
                	report "adapt_we_ack isn't swithed back to high"  
                    severity failure;                

				adapt_push <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Single TOP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_top <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD*3;

				assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data_out = TEST_DATA_1 
                	report "First TOP failed wrong data returned." 
                    & " expected=" &  to_string(TEST_DATA_1)
                    & " actual=" &  to_string(adapt_data_out)
                    severity failure;

				wait for CLK_PERIOD * 2;
				adapt_top <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- First POP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_pop <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD*3;

				assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data_out = TEST_DATA_1 
                	report "First POP failed, wrong data returned." 
                    & " expected=" &  to_string(TEST_DATA_1)
                    & " actual=" &  to_string(adapt_data_out)
                    severity failure;

				wait for CLK_PERIOD * 2;
				adapt_pop <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Second POP operation
				adapt_re <= '1';
				wait for CLK_PERIOD/10;
				adapt_pop <= '1';
				wait for CLK_PERIOD/10*19;
                assert adapt_re_ack = '0' 
                	report "adapt_re_ack is not pulled down"  
                    severity failure;
				adapt_re <= '0';
                wait until mem_re_ack = '1'; -- mem read completed
                wait for CLK_PERIOD*3;

                assert adapt_re_ack = '1' 
                	report "adapt_re_ack isn't swithed back to high"  
                    severity failure;                
                assert adapt_data_out = TEST_DATA_0 
                	report "Second POP failed, wrong data returned." 
                    & " expected=" &  to_string(TEST_DATA_0)
                    & " actual=" &  to_string(adapt_data_out)
                    severity failure;

				wait for CLK_PERIOD * 2;
				adapt_pop <= '0'; 
				wait for CLK_PERIOD * 3;
                
			-- Trailing edge
                report "*** TESTS COMPLETED SUCCESSFULLY ***";  
				wait for CLK_PERIOD*100;
                
			end process;

	-- instantiate the design under test (DUT)
	DUT : entity work.edac_protected_stack(rtl)
		generic map(
		metastable_filter_bypass_recover_fsm_n => true,
		data_width      => DATA_WIDTH, 
		stack_size_log2 => ADDR_WIDTH 
		)
		port map(
			adapt_push                   => adapt_push, 
			adapt_pop                    => adapt_pop, 
			adapt_top                    => adapt_top, 
			adapt_re                     => adapt_re, 
			adapt_we                     => adapt_we, 
			adapt_re_ack                 => adapt_re_ack, 
			adapt_we_ack                 => adapt_we_ack, 
			adapt_data_in                => adapt_data_in, 
			adapt_data_out               => adapt_data_out, 
			clk                          => clk, 
			raw_reset_n                  => raw_reset_n, 
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
	MEM : entity work.edac_protected_ram( protected_bram )
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
			as_reset_n => raw_reset_n,
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
