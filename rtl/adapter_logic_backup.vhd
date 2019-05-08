library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------------------------
entity acu_mmio_stack_adapter is
	generic (
		metastable_filter_bypass_reset_error_flags_n:	boolean;
		metastable_filter_bypass_acu:					boolean;
		data_width:										integer range 0 to 16;
		adress_pop:										integer range 0 to 16;
		adress_top:										integer range 0 to 16;
		adress_push:									integer range 0 to 16;
		stack_size_log2: 								integer range 0 to 16
	);
	
	port (
		clk:						in	std_logic;
		raw_reset_n:				in	std_logic;
		
		write_strobe_from_acu:		in	std_logic;
		read_strobe_from_acu:		in	std_logic;
		s_data_2_acu:				out	std_logic_vector (15 downto 0);
		data_from_acu:				in	std_logic_vector (15 downto 0);
		s_ready_2_acu:				out	std_logic;
		address_from_acu:			in	std_logic_vector (15 downto 0);
		
		recover_fsm_n:				in	std_logic;
		recover_fsm_n_ack:			out std_logic;
		user_fsm_invalid:			out std_logic
		
	);
end entity acu_mmio_stack_adapter;
---------------------------------------------------------------------------------------------------
architecture rtl of acu_mmio_stack_adapter is

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
	
	signal cs:								std_logic;
	
	signal adapt_push:					 std_logic;
	signal adapt_pop:					 std_logic;
	signal adapt_top:					 std_logic;
	signal adapt_re: 					 std_logic;
	signal adapt_we:					 std_logic;
	signal adapt_re_ack:                 std_logic;
	signal adapt_we_ack:                 std_logic;
	signal adapt_data_in:                std_logic_vector(data_width - 1 downto 0);
	signal adapt_data_out:               std_logic_vector(data_width - 1 downto 0);

	signal mem_data_in                  : std_logic_vector( data_width-1 downto 0);
	signal mem_data_out                 : std_logic_vector( data_width-1 downto 0);
	signal mem_re                       : std_logic;
	signal mem_we                       : std_logic;
	signal mem_re_ack                   : std_logic;
	signal mem_we_ack                   : std_logic;
	signal mem_addr                     : std_logic_vector( stack_size_log2-1 downto 0);
    
    signal mem_uncorrectable_error		: std_logic;
	signal mem_correctable_error		: std_logic;
	signal mem_scrubber_invalid_state_error: std_logic;

	signal mem_error_injection: std_logic_vector (1 downto 0) := (others => '0');
	signal mem_force_scrubbing:	std_logic := '0';
	signal mem_scrubber_recover_fsm_n: std_logic := '1';
	signal mem_dbg_scrubber_invalid_state_error_injection: std_logic := '0';
	

	type state_t is (
		idle,
		pop_1,pop_2,pop_3,pop_4,
		top_1,top_2,top_3,top_4,
		push_1,push_2,push_3,push_4,
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
		cs <= '1' when ( unsigned(address_from_acu) = address_push 
			or unsigned(address_from_acu) = address_top 
			or unsigned(address_from_acu) = address_pop )
			else '0';
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
								
				when pop_1	=>	adapt_pop <= '1';
								adapt_re <= '1';
								state <= pop_2;
								
				when pop_2 =>	if(adapt_re_ack = '1') then
									state <= pop_3;
								end if;
									
				when pop_3 =>	s_data_2_acu <= adapt_data_out;
								adapt_pop <= '0';
								adapt_re <= '0';
								state <= deassert_strobes;
				
				----------------------------------------------------------------------------------------------
								
				when top_1	=>	adapt_top <= '1';
								adapt_re <= '1';
								state <= top_2;
								
				when top_2 =>	if(adapt_re_ack = '1') then
									state <= top_3;
								end if;
									
				when top_3 =>	s_data_2_acu <= adapt_data_out;
								adapt_top <= '0';
								adapt_re <= '0';
								state <= deassert_strobes;
				
				----------------------------------------------------------------------------------------------
								
				when push_1	=>	adapt_data_in <= data_from_acu(data_width-1 downto 0);
								adapt_push <= '1';
								adapt_we <= '1';
								state <= push_2;
								
				when push_2 =>	if(adapt_we_ack = '1') then
									state <= push_3;
								end if;
								
				when push_3 =>	adapt_push <= '0';
								adapt_we <= '0';
								state <= deassert_strobes;
				
				----------------------------------------------------------------------------------------------
											
				when deassert_strobes	=>	if ( read_strobe_from_acu_internal = '0' 
                        		and write_strobe_from_acu_internal = '0') then
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
	
	
	L_USER_LOGIC:	entity work.edac_protected_stack(rtl)
		generic map (
			metastable_filter_bypass_recover_fsm_n => false,
			data_width 				=> data_width,
			stack_size_log2			=> stack_size_log2
		)								
		port map (
			adapt_push				=> adapt_push,
			adapt_pop				=> adapt_pop,
			adap_top				=> adapt_top,
			adapt_re 				=> adapt_re,
			adapt_we				=> adapt_we,
			adapt_re_ack            => adapt_re_ack,
			adapt_we_ack            => adapt_we_ack,
			adapt_data_in			=> adapt_data_in,
			adapt_data_out			=> adapt_data_out,
			clk						=> clk,
			raw_reset_n				=> raw_reset_n,
			recover_fsm_n			=> recover_fsm_n,
			recover_fsm_n_ack		=> recover_fsm_n_ack,
			user_fsm_invalid		=> user_fsm_invalid,

			mem_data_in             => mem_data_in,
			mem_data_out            => mem_data_out,
			mem_re                  => mem_re,
			mem_we                  => mem_we,
			mem_re_ack              => mem_re_ack,
			mem_we_ack              => mem_we_ack,
			mem_addr                => mem_addr
		);

	
		-- instantiate edac protected memory 
	MEM : entity work.edac_protected_ram( protected_bram )
		generic map(
			address_width						=> stack_size_log2,
			data_width							=> data_width,
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
									
	
end architecture rtl;
---------------------------------------------------------------------------------------------------
