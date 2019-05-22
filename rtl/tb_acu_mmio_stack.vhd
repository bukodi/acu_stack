library ieee;
use ieee.std_logic_1164.all;
---------------------------------------------------------------------------------------------------
entity tb_acu_mmio_stack is
end entity tb_acu_mmio_stack;
---------------------------------------------------------------------------------------------------
architecture behavior of tb_acu_mmio_stack is

	signal clear_address:						std_logic	 					:= '0';
	signal generate_read_cycle:						std_logic	 					:= '0';
	signal generate_write_cycle:					std_logic						:= '0';
	signal address:									std_logic_vector (15 downto 0) 	:= (others => '0');
	signal data_2_write:							std_logic_vector (15 downto 0)	:= (others => '0');
	signal data_read:								std_logic_vector (15 downto 0);
	signal busy:									std_logic;
	signal interrupt_received_and_acknowledged:		std_logic;
	
	signal clk_bfm:									std_logic						:= '0';
	signal clk_stack:								std_logic						:= '1';
	signal raw_reset_n:								std_logic						:= '1';
	signal stack_intr_rqst:							std_logic;
	signal acu_intr_ack:							std_logic;
	signal acu_write_strobe:						std_logic;
	signal acu_read_strobe:							std_logic;
	signal stack_ready:								std_logic;
	signal acu_address:								std_logic_vector (15 downto 0);
	signal acu_data:								std_logic_vector (15 downto 0);
	signal stack_data:								std_logic_vector (15 downto 0);

	signal user_fsm:   std_logic;

	constant CLK_PERIOD : time := 1 us;
    constant DATA_WIDTH : integer := 16;
    constant ADDR_WIDTH : integer := 5;
    constant TEST_DATA_0 : std_logic_vector( DATA_WIDTH-1 downto 0) := "0000111101001010";
    constant TEST_DATA_1 : std_logic_vector( DATA_WIDTH-1 downto 0) := "1111000011010110";

begin

	L_CLOCK_BFM: process
	begin
		wait for 32 ns;
		loop
			wait for CLK_PERIOD/2;
			clk_bfm <= not clk_bfm;
		end loop;
	end process;

	L_CLOCK_STACK: process
	begin
		loop
			wait for CLK_PERIOD/2;
			clk_stack <= not clk_stack;
		end loop;
	end process;

	L_ACU_MMIO_BFM:	entity work.acu_mmio_bfm(behavior)
		port map (
        	clear_address 							=> clear_address,
			generate_read_cycle						=> generate_read_cycle,
			generate_write_cycle					=> generate_write_cycle,
			address									=> address,
			data_2_write							=> data_2_write,
			data_read								=> data_read,
			busy									=> busy,
			interrupt_received_and_acknowledged		=> interrupt_received_and_acknowledged,
			clk										=> clk_bfm,
			intr_rqst								=> stack_intr_rqst,
			intr_ack								=> acu_intr_ack,
			write_strobe							=> acu_write_strobe,
			read_strobe								=> acu_read_strobe,
			dmem_ready								=> stack_ready,
			address_2_dmem							=> acu_address,
			data_from_dmem							=> stack_data,
			data_2_dmem								=> acu_data
		);
	
	-- L_MMIO_STACK:	entity work.acu_stack(structure)
	L_MMIO_STACK:	entity work.acu_mmio_stack_adapter(rtl)
		generic map (
			metastable_filter_bypass_reset_error_flags_n => true, 
			metastable_filter_bypass_acu => true, 
			data_width => 16,
			address_pop => 2,
			address_top => 3,
			address_push => 1,
			stack_size_log2 => 5
		)
		
		port map (
			clk							=> clk_stack,
			raw_reset_n					=> raw_reset_n,

			write_strobe_from_acu		=> acu_write_strobe,
			read_strobe_from_acu		=> acu_read_strobe,
			s_data_2_acu				=> stack_data,
			data_from_acu				=> acu_data,
			s_ready_2_acu				=> stack_ready,
			address_from_acu			=> acu_address,

			recover_fsm_n				=> '1',
			recover_fsm_n_ack			=> open,
			user_fsm_invalid			=> open

		);
										
	L_TEST_SEQUENCE: process
	begin

	-- Initial RESET --
		wait for CLK_PERIOD*2;
		raw_reset_n <= '0';
		wait for CLK_PERIOD*2;
		raw_reset_n <= '1';
		wait for CLK_PERIOD*2;
	
	-- First PUSH operation
		address <= X"0001";		-- PUSH addr
		data_2_write <= TEST_DATA_0;
		generate_write_cycle <= '1';
		wait until falling_edge(busy);
		generate_write_cycle <= '0';

		report "*** First PUSH completed ***";
        
		wait for CLK_PERIOD * 3;
		clear_address <= '1';		-- Clear addr
		wait for CLK_PERIOD * 1;
		clear_address <= '0';		
		wait for CLK_PERIOD * 2;
		
	-- Second PUSH operation
		address <= X"0001";		-- PUSH addr
		data_2_write <= TEST_DATA_1;
		generate_write_cycle <= '1';
		wait until falling_edge(busy);
		generate_write_cycle <= '0';
        
        report "*** Second PUSH completed ***";
        
		wait for CLK_PERIOD * 3;
		clear_address <= '1';		-- Clear addr
		wait for CLK_PERIOD * 1;
		clear_address <= '0';		
		wait for CLK_PERIOD * 2;

	-- Single TOP operation
		address <= X"0003";		-- TOP addr
		generate_read_cycle <= '1';
		wait until falling_edge(busy);
		generate_read_cycle <= '0';

		assert stack_data = TEST_DATA_1 
			report "First TOP failed wrong data returned." 
			& " expected=" &  to_string(TEST_DATA_1)
			& " actual=" &  to_string(stack_data)
			severity failure;

		wait for CLK_PERIOD * 3;
		clear_address <= '1';		-- Clear addr
		wait for CLK_PERIOD * 1;
		clear_address <= '0';		
		wait for CLK_PERIOD * 2;
		
	-- First POP operation
		address <= X"0002";		-- POP addr
		generate_read_cycle <= '1';
		wait until falling_edge(busy);
		generate_read_cycle <= '0';

		assert stack_data = TEST_DATA_1 
			report "First POP failed wrong data returned." 
			& " expected=" &  to_string(TEST_DATA_1)
			& " actual=" &  to_string(stack_data)
			severity failure;

		wait for CLK_PERIOD * 3;
		clear_address <= '1';		-- Clear addr
		wait for CLK_PERIOD * 1;
		clear_address <= '0';		
		wait for CLK_PERIOD * 2;
		
	-- Second POP operation
		address <= X"0002";		-- POP addr
		generate_read_cycle <= '1';
		wait until falling_edge(busy);
		generate_read_cycle <= '0';

		assert stack_data = TEST_DATA_0 
			report "Second POP failed wrong data returned." 
			& " expected=" &  to_string(TEST_DATA_0)
			& " actual=" &  to_string(stack_data)
			severity failure;

		wait for CLK_PERIOD * 3;
		clear_address <= '1';		-- Clear addr
		wait for CLK_PERIOD * 1;
		clear_address <= '0';		
		wait for CLK_PERIOD * 2;
		
	-- Trailing edge
		report "*** TESTS COMPLETED SUCCESSFULLY ***";  
		wait;
	end process;

end architecture behavior;
---------------------------------------------------------------------------------------------------
