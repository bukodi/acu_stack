library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------------------------
entity acu_mmio_stack_adapter is
	generic (
		metastable_filter_bypass_reset_error_flags_n:	boolean;
		metastable_filter_bypass_acu:					boolean
	);
	
	port (
		clk:						in	std_logic;
		raw_reset_n:				in	std_logic;
		write_strobe_from_acu:		in	std_logic;
		read_strobe_from_acu:		in	std_logic;
		s_data_2_acu:				out	std_logic_vector (15 downto 0);
		data_from_acu:				in	std_logic_vector (15 downto 0);
		s_ready_2_acu:				out	std_logic;
		cs:							in	std_logic;
		address_from_acu:			in	std_logic_vector (15 downto 0);
		recover_fsm_n:				in	std_logic;
		adapter_invalid:			out	std_logic
	);
end entity acu_mmio_stack_adapter;
---------------------------------------------------------------------------------------------------
architecture rtl of acu_mmio_edac_protected_stack is

	-- Reset synchronizer resources
	signal ff_reset_n:						std_logic;
	signal as_reset_n:						std_logic;
		
	-- Metastable filter resources
	signal ff_write_strobe_from_acu:		std_logic;
	signal write_strobe_from_acu_filtered:	std_logic;
	signal write_strobe_from_acu_internal:	std_logic;
	signal ff_read_strobe_from_acu:			std_logic;
	signal read_strobe_from_acu_filtered:	std_logic;
	signal read_strobe_from_acu_internal:	std_logic;
	signal ff_reset_error_flags_n:			std_logic;
	signal reset_error_flags_n_filtered:	std_logic;
	signal reset_error_flags_n_internal:	std_logic;
	

--???
	type state_t is (
		idle,
		pop,
		top,
		push,
		deassert_strobes,
		error
	);
	signal state: state_t;


begin

	L_RESET_CIRCUITRY:	process (clk, raw_reset_n)
	begin
		if ( raw_reset_n = '0' ) then
			ff_reset_n <= '0';
			as_reset_n <= '0';
		elsif ( rising_edge(clk) ) then
			ff_reset_n <= '1';
			as_reset_n <= ff_reset_n;
		end if;
	end process;
	
	L_METASTBLE_FILTER_BLOCK: process (clk, as_reset_n)
	begin
		if ( as_reset_n = '0' ) then
			ff_write_strobe_from_acu <= '0';
			write_strobe_from_acu_filtered <= '0';
			ff_read_strobe_from_acu <= '0';
			ff_read_strobe_from_acu <= '0';
			read_strobe_from_acu_filtered <= '0';
			ff_reset_error_flags_n <= '1';
			reset_error_flags_n_filtered <= '1';
		elsif ( rising_edge(clk) ) then
			ff_write_strobe_from_acu <= write_strobe_from_acu;
			write_strobe_from_acu_filtered <= ff_write_strobe_from_acu;
			ff_read_strobe_from_acu <= read_strobe_from_acu;
			read_strobe_from_acu_filtered <= ff_read_strobe_from_acu;
			ff_reset_error_flags_n <= reset_error_flags_n;
			reset_error_flags_n_filtered <= ff_reset_error_flags_n;
		end if;
	end process;
	
	L_METASTABLE_FILTER_BYPASS: block
	begin
		write_strobe_from_acu_internal <= write_strobe_from_acu when metastable_filter_bypass_acu = true else write_strobe_from_acu_filtered;
		read_strobe_from_acu_internal <= read_strobe_from_acu when metastable_filter_bypass_acu = true else read_strobe_from_acu_filtered;
		reset_error_flags_n_internal <= reset_error_flags_n when metastable_filter_bypass_reset_error_flags_n = true else reset_error_flags_n_filtered;
	end block;	
	
	L_LOCAL_ADDRESS_DECODER: block
	begin
		cs <= '1' when (unsigned(address_from_acu) = address_push or unsigned(address_from_acu) = address_top or unsigned(address_from_acu) = address_pop else '0';
		ready_2_acu <= s_ready_2_acu when cs = '1' else '0';
		data_2_acu(data_width-1 downto 0) <= s_data_2_acu when cs = '1' else (others => '0');
		data_2_acu(15 downto data_width) <= (others => '0');
	end block;
	
	L_ADAPTER_LOGIC: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			state <= idle;
			s_ready_2_acu <= '0';
			s_data_2_acu <= (others => '0');
			pop <= '0';
			top <= '0';
			push <= '0';
			data_2_stack <= (others => '0');
			invalid_state_error <= '0';
		elsif ( rising_edge(clk) ) then
			case state is
				when idle	=>	s_ready_2_acu <= '1';
								
								if ( write_strobe_from_acu_internal = '1' and cs = '1' ) then
									if ( unsigned(address_from_acu) = address_push ) then
										s_ready_2_acu <= '0';
										state <= push;
									else
										s_ready_2_acu <= '0';
										state <= deassert_strobes;
									end if;
								end if;
								
								if ( read_strobe_from_acu_internal = '1' and cs = '1' ) then
								
									s_ready_2_acu <= '0';
									if ( unsigned(address_from_acu) = address_top ) then
										state <= top;
									elsif ( unsigned(address_from_acu) = address_pop ) then
										state <= pop;
									else
										state <= wait_for_deassert_strobes;
									end if;	
								end if;
				
				----------------------------------------------------------------------------------------------
								
				when pop	=>	pop <= '1';
				
				----------------------------------------------------------------------------------------------
								
				when top_1	=>	top <= '1';
				
				----------------------------------------------------------------------------------------------
								
				when push_1	=>	data_2_stack <= data_from_acu(data_width-1 downto 0);
								push <= '1';
				
				----------------------------------------------------------------------------------------------
											
				when deassert_strobes	=>	if ( read_strobe_from_acu_internal = '0' and write_strobe_from_acu_internal = '0') then
												state <= idle;
											end if;
													
				----------------------------------------------------------------------------------------------
				
				when invalid	=>	return_state <= idle;
									s_ready_2_acu <= '0';
									s_data_2_acu <= (others => '0');
									pop <= '0';
									top <= '0';
									push <= '0';
									data_2_stack <= (others => '0');
								
				when others	=>	invalid_state_error <= '1';
								state <= invalid;
			end case;
		end if;
	end process;
	
	
	
end architecture rtl;
---------------------------------------------------------------------------------------------------
