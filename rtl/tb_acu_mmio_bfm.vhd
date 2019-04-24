library ieee;
use ieee.std_logic_1164.all;
---------------------------------------------------------------------------------------------------
entity tb_acu_mmio_bfm is
end entity tb_acu_mmio_bfm;
---------------------------------------------------------------------------------------------------
architecture behavior of tb_acu_mmio_bfm is

	signal generate_read_cycle:						std_logic	 					:= '0';
	signal generate_write_cycle:					std_logic						:= '0';
	signal address:									std_logic_vector (15 downto 0) 	:= (others => '0');
	signal data_2_write:							std_logic_vector (15 downto 0)	:= (others => '0');
	signal data_read:								std_logic_vector (15 downto 0);
	signal busy:									std_logic;
	signal interrupt_received_and_acknowledged:		std_logic;
	
	signal clk_bfm:									std_logic						:= '0';
	signal clk_uart:								std_logic						:= '1';
	signal raw_reset_n:								std_logic						:= '1';
	signal uart_intr_rqst:							std_logic;
	signal acu_intr_ack:							std_logic;
	signal acu_write_strobe:						std_logic;
	signal acu_read_strobe:							std_logic;
	signal uart_ready:								std_logic;
	signal acu_address:								std_logic_vector (15 downto 0);
	signal acu_data:								std_logic_vector (15 downto 0);
	signal uart_data:								std_logic_vector (15 downto 0);
	signal rx:										std_logic						:= '1';
	signal tx:										std_logic;

begin

	L_CLOCK_BFM: process
	begin
		wait for 32 ns;
		loop
			wait for 10 ns;
			clk_bfm <= not clk_bfm;
		end loop;
	end process;

	L_CLOCK_UART: process
	begin
		wait for 25 ns;
		clk_uart <= not clk_uart;
	end process;

	L_ACU_MMIO_BFM:	entity work.acu_mmio_bfm(behavior)
						port map (
							generate_read_cycle						=> generate_read_cycle,
							generate_write_cycle					=> generate_write_cycle,
							address									=> address,
							data_2_write							=> data_2_write,
							data_read								=> data_read,
							busy									=> busy,
							interrupt_received_and_acknowledged		=> interrupt_received_and_acknowledged,
							clk										=> clk_bfm,
							intr_rqst								=> uart_intr_rqst,
							intr_ack								=> acu_intr_ack,
							write_strobe							=> acu_write_strobe,
							read_strobe								=> acu_read_strobe,
							dmem_ready								=> uart_ready,
							address_2_dmem							=> acu_address,
							data_from_dmem							=> uart_data,
							data_2_dmem								=> acu_data
						);
	

						L_ACU_MMIO_UART_TRANSCEIVER:	entity work.acu_mmio_uart_transceiver(rtl)
										generic map (
											metastable_filter_bypass_reset_error_flags_n	=> true,
											metastable_filter_bypass_acu			=> true,
											data_width								=> 4
										)
										
										port map (
											clk							=> clk_uart,
											raw_reset_n					=> raw_reset_n,

											write_strobe_from_acu		=> acu_write_strobe,
											read_strobe_from_acu		=> acu_read_strobe,
											s_data_2_acu					=> uart_data,
											data_from_acu				=> acu_data,
											s_ready_2_acu					=> uart_ready,
											address_from_acu			=> acu_address,

											recover_fsm_n				=> '1',
											recover_fsm_n_ack			=> open
											user_fsm_invalid			=> open

										);
										
	L_TEST_SEQUENCE: process
	begin
	
		wait for 230 ns;
		raw_reset_n <= '0';
		wait for 450 ns;
		raw_reset_n <= '1';
		
		wait for 1 us;
		
		address <= X"0004";		-- ready to write
		generate_read_cycle <= '1';
		wait until falling_edge(busy);
		generate_read_cycle <= '0';
		
		wait for 1 us;
		
		address <= X"0005";		-- data
		data_2_write <= X"00AB";
		generate_write_cycle <= '1';
		wait until falling_edge(busy);
		generate_write_cycle <= '0';
	
		wait;
	end process;

end architecture behavior;
---------------------------------------------------------------------------------------------------