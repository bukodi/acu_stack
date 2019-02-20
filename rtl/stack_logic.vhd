library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------------------------
entity edac_protected_stack is
	generic (
		metastable_filter_bypass_push:					boolean;
		metastable_filter_bypass_pop:					boolean;
		metastable_filter_bypass_top:					boolean;
		metastable_filter_bypass_reset_error_flags_n:	boolean;
		address_width:									integer range 2 to 8;
		data_width:										integer range 2 to 16;
		edac_latency:									integer range 1 to 10
	);
	
	port (
		clk:						in	std_logic;
		raw_reset_n:				in	std_logic;
		push:						in	std_logic;
		push_ack:					out	std_logic;
		write_performed:			out	std_logic;
		pop:						in	std_logic;
		pop_ack:					out	std_logic;
		top:						in	std_logic;
		top_ack:					out	std_logic;
		read_performed:				out	std_logic;
		full:						out	std_logic;
		half:						out	std_logic;
		data_in:					in	std_logic_vector (data_width-1 downto 0);
		data_out:					out	std_logic_vector (data_width-1 downto 0);
		reset_error_flags_n:		in	std_logic;
		reset_error_flags_n_ack:	out	std_logic;
		uncorrectable_error:		out	std_logic;
		stack_pointer: 				out std_logic_vector (address_width-1 downto 0)
	);
end entity edac_protected_stack;
---------------------------------------------------------------------------------------------------
architecture rtl of edac_protected_stack is

	-- Reset synchronizer resources
	signal ff_reset_n:						std_logic;
	signal as_reset_n:						std_logic;
			
	-- Metastable filter resources		
	signal ff_push:							std_logic;
	signal push_filtered:					std_logic;
	signal push_internal:					std_logic;
	signal ff_push_internal:				std_logic;
	signal push_internal_rising_edge:		std_logic;
	signal ff_pop:							std_logic;
	signal pop_filtered:					std_logic;
	signal pop_internal:					std_logic;
	signal ff_pop_internal:					std_logic;
	signal pop_internal_rising_edge:		std_logic;
	signal ff_top:							std_logic;
	signal top_filtered:					std_logic;
	signal top_internal:					std_logic;
	signal ff_top_internal:					std_logic;
	signal top_internal_rising_edge:		std_logic;
	signal ff_reset_error_flags_n:			std_logic;
	signal reset_error_flags_n_filtered:	std_logic;
	signal reset_error_flags_n_internal:	std_logic;
	
	-- STACK logic resources
	signal we_edacram:						std_logic;
	signal re_edacram:						std_logic;
	signal waddress_edacram:				std_logic_vector (address_width-1 downto 0);
	signal raddress_edacram:				std_logic_vector (address_width-1 downto 0);
	signal data_2_edacram:					std_logic_vector (data_width-1 downto 0);

begin

	-- Reset circuitry: Active-LOW asynchronous assert, synchronous deassert with meta-stable filter.
	L_RESET_CIRCUITRY:	process ( clk, raw_reset_n )
	begin
		if ( raw_reset_n = '0' ) then
			ff_reset_n <= '0';
			as_reset_n <= '0';
		elsif ( rising_edge(clk) ) then
			ff_reset_n <= '1';
			as_reset_n <= ff_reset_n;
		end if;

	end process;
	
	--------------------------------------------------------
	--------------------------------------------------------
	--------------------------------------------------------
	
	L_METASTABLE_FILTER_BLOCK: process ( clk, as_reset_n )
	begin
		if ( as_reset_n = '0' ) then
			ff_top <= '0';
			top_filtered <= '0';
			ff_push <= '0';
			push_filtered <= '0';
			ff_pop <= '0';
			pop_filtered <= '0';
			ff_reset_error_flags_n <= '0';
			reset_error_flags_n_filtered <= '0';
		elsif ( rising_edge(clk) ) then
			ff_top <= top;
			top_filtered <= ff_top;
			ff_push <= push;
			push_filtered <= ff_push;
			ff_pop <= pop;
			pop_filtered <= ff_pop;
			ff_reset_error_flags_n <= reset_error_flags_n;
			reset_error_flags_n_filtered <= ff_reset_error_flags_n;
		end if;
	end process;
	
	L_METASTABLE_FILTER_BYPASS: block
	begin
		top_internal <= top when metastable_filter_bypass_top = true else top_filtered;
		push_internal <= push when metastable_filter_bypass_push = true else push_filtered;
		pop_internal <= pop when metastable_filter_bypass_pop = true else pop_filtered;
		reset_error_flags_n_internal <= reset_error_flags_n when metastable_filter_bypass_reset_error_flags_n = true else reset_error_flags_n_filtered;
	end block;
	
	L_METASTABLE_FILTER_ACKNOWLEDGE: block
	begin
		push_ack <= push_internal;
		pop_ack <= pop_internal;
		top_ack <= top_internal;
		reset_error_flags_n_ack <= reset_error_flags_n_internal;
	end block;
	
	L_PUSHPOPTOP_EDGE_DETECTORS: block
	begin
		process ( clk, as_reset_n )
		begin
			if ( as_reset_n = '0' ) then
				ff_push_internal <= '0';
				ff_pop_internal <= '0';
				ff_top_internal <= '0';
			elsif ( rising_edge(clk) ) then
				ff_push_internal <= push_internal;
				ff_pop_internal <= pop_internal;
				ff_top_internal <= top_internal;
			end if;
		end process;
		push_internal_rising_edge <= not ff_push_internal and push_internal;
		pop_internal_rising_edge <= not ff_pop_internal and pop_internal;
		top_internal_rising_edge <= not ff_top_internal and top_internal;
	end block;
	
	--------------------------------------------------------
	--------------------------------------------------------
	--------------------------------------------------------
	
	L_STACK_2_EDACRAM_ADAPTER: process ( clk, as_reset_n )
		
		variable vstack_pointer:	std_logic_vector (address_width-1 downto 0);
		variable vfull:				std_logic;
		variable vhalf:				std_logic;
	
	begin
		if ( as_reset_n = '0' ) then
			vfull := '0'; vhalf := '0';
			vstack_pointer := ( others => '0' );
			stack_pointer <= (others => '0');
			full <= '0';
			half <= '0';
			waddress_edacram <= (others => '0');
			raddress_edacram <= (others => '0');
			data_2_edacram <= (others => '0');
			we_edacram <= '0';
			re_edacram <= '0';
		elsif ( rising_edge(clk) ) then
		
			we_edacram <= '0';
			re_edacram <= '0';
			
				if ( push_internal_rising_edge = '1' and vfull /= '1' ) then
					-- write data into the error STACK
					we_edacram <= '1';
					waddress_edacram <= std_logic_vector(unsigned(vstack_pointer) + 1);
					data_2_edacram <= data_in;
					vstack_pointer := std_logic_vector(unsigned(vstack_pointer) + 1);
					if ( unsigned(vstack_pointer) = 2**address_width - 1 ) then vfull := '1'; else vfull := '0'; end if;
					if ( unsigned(vstack_pointer) >= 2**address_width / 2 ) then vhalf := '1'; else vhalf := '0'; end if;
				end if;
				
				if ( pop_internal_rising_edge = '1' and unsigned(vstack_pointer) /= 0) then
					-- read data from the error STACK
					re_edacram <= '1';
					raddress_edacram <= vstack_pointer;
					vstack_pointer := std_logic_vector(unsigned(vstack_pointer) - 1);
					if ( unsigned(vstack_pointer) >= 2**address_width / 2 ) then vhalf := '1'; else vhalf := '0'; end if;
					vfull := '0';
				end if;

				if ( top_internal_rising_edge = '1' ) then
					-- read data from the error STACK
					re_edacram <= '1';
					raddress_edacram <= vstack_pointer;
				end if;
			
				full <= vfull;
				half <= vhalf;
				stack_pointer <= vstack_pointer;
			
			end if;
		end process;

	--------------------------------------------------------
    --------------------------------------------------------
    --------------------------------------------------------
	
	L_EDAC_MEMORY_WRAPPER:	entity work.edac_memory_wrapper(arch_empty)
								generic map (
									address_width 		=> address_width,
									data_width 			=> data_width,
									edac_latency 		=> edac_latency,
									initfile_path 		=> ""
								)
									
								port map (
									clk					=> clk,
									as_reset_n			=> as_reset_n,
									reset_error_flag_n	=> reset_error_flags_n_internal,
									uncorrectable_error	=> uncorrectable_error,
									we					=> we_edacram,
									we_ack				=> write_performed,
									re					=> re_edacram,
									re_ack				=> read_performed,
									write_address 		=> waddress_edacram,
									read_address		=> raddress_edacram,
									data_in				=> data_2_edacram,
									data_out			=> data_out
								);

end architecture rtl;
---------------------------------------------------------------------------------------------------
