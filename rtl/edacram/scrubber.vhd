library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.edac_protected_ram_pkg.all;
---------------------------------------------------------------------------------------------------
entity scrubber is
	generic (
		address_width:							integer range 2 to 12;
		registered_input:						boolean;
		registered_output:						boolean;
		scrubber_present:						boolean;
		-- prescaler: 18, timer: 24, clk: 50 MHz -> cycle time: 24.43 hours
		prescaler_counter_width:				integer range 1 to 18;
		timer_counter_width:					integer range 1 to 24
	);
	
	port (		
		clk:								in	std_logic;
		as_reset_n:							in	std_logic;
		suspend:							in	std_logic;
		awake:								out	std_logic;
		read_strobe:						out	std_logic;
		address:							out	std_logic_vector (address_width-1 downto 0);
		write_strobe:						out	std_logic;
		correctable_error:					in	std_logic;
		force_scrubbing:					in	std_logic;
		invalid_state_error:				out	std_logic;
		recover_fsm_n:						in	std_logic;
		dbg_invalid_state_error_injection:	in	std_logic
	);
end entity scrubber;
---------------------------------------------------------------------------------------------------
architecture rtl of scrubber is	

	-- FSM resources
	type state_t is (
		idle,
		main,
		r_requested,
		w_requested,
		wait_for_dec,
		error,
		injected_invalid_state
	);
	signal state: state_t;
	attribute syn_preserve: boolean;
    attribute syn_preserve of state:signal is true;
	
	constant decoding_delay:		integer := get_decoding_delay(registered_input, registered_output);
	constant pointer_max:			std_logic_vector (address_width-1 downto 0) := (others => '1');
	constant prescaler_counter_max:	std_logic_vector (prescaler_counter_width-1 downto 0) := (others => '1');
	constant timer_counter_max:		std_logic_vector (timer_counter_width-1 downto 0) := (others => '1');
	
	signal active_state:			std_logic;
	
	signal pointer:					std_logic_vector (address_width-1 downto 0);
	signal decode_cntr:			std_logic_vector (1 downto 0);
	
	signal prescaler_counter:		std_logic_vector (prescaler_counter_width-1 downto 0);
	signal timer_counter:			std_logic_vector (timer_counter_width-1 downto 0);
	signal timeout:					std_logic;

begin
	
	L_SCRUBBER: if scrubber_present = true generate
	
		address <= pointer;
		
		active_state <= '1' when state = r_requested or state = w_requested else '0';
		
		L_SCRUBBER_FSM: process ( clk, as_reset_n )
		begin
			if ( as_reset_n = '0' ) then
				state <= idle;
				pointer <= (others => '0');
				decode_cntr <= (others => '0');
				awake <= '0';
				read_strobe <= '0';
				write_strobe <= '0';
				invalid_state_error <= '0';
			elsif ( rising_edge(clk) ) then
				
				if( suspend /= '1' or active_state /= '1' ) then
					
					case state is
						when idle			=>	if( timeout = '1' or force_scrubbing = '1' ) then
													awake <= '1';
													state <= main;
												end if;
						
						when main			=>	read_strobe <= '1';
												state <= r_requested;
						
						when r_requested	=>	decode_cntr <= std_logic_vector(to_unsigned(decoding_delay, 2));
												state <= wait_for_dec;
						
						when wait_for_dec	=>	if( to_integer(unsigned(decode_cntr)) = 0 ) then
													read_strobe <= '0';
													if( correctable_error = '1' ) then
														write_strobe <= '1';
														state <= w_requested;
													else
													
														if ( pointer < pointer_max ) then
															pointer <= std_logic_vector( unsigned(pointer) + 1 );
															state <= main;
														else
															pointer <= (others => '0');
															awake <= '0';
															state <= idle;
														end if;
														
													end if;
												end if;
												decode_cntr <= std_logic_vector( unsigned(decode_cntr) - 1 );
						
						when w_requested	=>	write_strobe <= '0';
												
												if ( pointer < pointer_max ) then
													pointer <= std_logic_vector( unsigned(pointer) + 1 );
													state <= main;
												else
													pointer <= (others => '0');
													awake <= '0';
													state <= idle;
												end if;
						
						when error			=>	pointer <= (others => '0');
												decode_cntr <= (others => '0');
												awake <= '0';
												read_strobe <= '0';
												write_strobe <= '0';
												
												if ( recover_fsm_n = '0' ) then
													invalid_state_error <= '0';
													state <= idle;
												end if;
						
						when others			=>	invalid_state_error <= '1';
												state <= error;
					end case;
					
				end if;
				
				-- Invalid state error injection
				if ( dbg_invalid_state_error_injection = '1' ) then state <= injected_invalid_state; end if;
				
			end if;
		end process;
		
		------------------------------------------------------------------
		
		L_SCRUBBING_TIMER: process ( clk, as_reset_n )
		begin
			if ( as_reset_n = '0' ) then
				prescaler_counter <= (others => '0');
				timer_counter <= (others => '0');
			elsif ( rising_edge(clk) ) then
				if( force_scrubbing = '1' ) then
					prescaler_counter <= (others => '0');
					timer_counter <= (others => '0');
				elsif( state = idle ) then
					if( prescaler_counter = prescaler_counter_max ) then
						timer_counter <= std_logic_vector( unsigned(timer_counter) + 1 );
					end if;
					prescaler_counter <= std_logic_vector( unsigned(prescaler_counter) + 1 );
				end if;
			end if;
		end process;
		
		timeout <= '1' when prescaler_counter = prescaler_counter_max and timer_counter = timer_counter_max else '0';
		
	end generate L_SCRUBBER;
	
	L_SCRUBBER_DUMMY: if scrubber_present = false generate
	
		awake <= '0';
		read_strobe <= '0';
		address <= (others => '0');
		write_strobe <= '0';
		invalid_state_error <= '0';
	
	end generate L_SCRUBBER_DUMMY;
	
end architecture rtl;
---------------------------------------------------------------------------------------------------