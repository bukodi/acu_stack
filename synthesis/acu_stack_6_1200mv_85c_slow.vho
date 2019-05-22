-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "05/15/2019 17:59:10"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	acu_stack IS
    PORT (
	clk : IN std_logic;
	raw_reset_n : IN std_logic;
	write_strobe_from_acu : IN std_logic;
	read_strobe_from_acu : IN std_logic;
	s_data_2_acu : OUT std_logic_vector(15 DOWNTO 0);
	data_from_acu : IN std_logic_vector(15 DOWNTO 0);
	s_ready_2_acu : OUT std_logic;
	address_from_acu : IN std_logic_vector(15 DOWNTO 0);
	recover_fsm_n : IN std_logic;
	recover_fsm_n_ack : OUT std_logic;
	user_fsm_invalid : OUT std_logic
	);
END acu_stack;

-- Design Ports Information
-- s_data_2_acu[0]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[1]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[2]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[3]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[4]	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[5]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[6]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[7]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[8]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[9]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[10]	=>  Location: PIN_U19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[11]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[12]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[13]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[14]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_data_2_acu[15]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_ready_2_acu	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recover_fsm_n_ack	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- user_fsm_invalid	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[2]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[4]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[5]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[6]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[7]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[8]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[9]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[10]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[11]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[12]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[13]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[14]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[15]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[1]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address_from_acu[0]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- raw_reset_n	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recover_fsm_n	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_strobe_from_acu	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_strobe_from_acu	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[0]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[10]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[6]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[9]	=>  Location: PIN_R20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[5]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[8]	=>  Location: PIN_R19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[4]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[7]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[1]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[15]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[3]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[14]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[2]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[13]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[11]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_from_acu[12]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF acu_stack IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_raw_reset_n : std_logic;
SIGNAL ww_write_strobe_from_acu : std_logic;
SIGNAL ww_read_strobe_from_acu : std_logic;
SIGNAL ww_s_data_2_acu : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_data_from_acu : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_s_ready_2_acu : std_logic;
SIGNAL ww_address_from_acu : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_recover_fsm_n : std_logic;
SIGNAL ww_recover_fsm_n_ack : std_logic;
SIGNAL ww_user_fsm_invalid : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \raw_reset_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \L_USER_LOGIC|Add1~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[7]~9_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector1~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector1~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.invalid~q\ : std_logic;
SIGNAL \MEM|we_d~q\ : std_logic;
SIGNAL \MEM|re_d~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~12_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector16~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[0]~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~9_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~10_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~13_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~14_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~15_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~12_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal8~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal17~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~34_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~51_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~44_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~32_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~49_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~47_q\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~6_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector0~4_combout\ : std_logic;
SIGNAL \address_from_acu[3]~input_o\ : std_logic;
SIGNAL \address_from_acu[6]~input_o\ : std_logic;
SIGNAL \address_from_acu[7]~input_o\ : std_logic;
SIGNAL \address_from_acu[8]~input_o\ : std_logic;
SIGNAL \address_from_acu[9]~input_o\ : std_logic;
SIGNAL \address_from_acu[12]~input_o\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[7]~feeder_combout\ : std_logic;
SIGNAL \MEM|we_d~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[1]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[17]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48feeder_combout\ : std_logic;
SIGNAL \s_data_2_acu[0]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[1]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[2]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[3]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[4]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[5]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[6]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[7]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[8]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[9]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[10]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[11]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[12]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[13]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[14]~output_o\ : std_logic;
SIGNAL \s_data_2_acu[15]~output_o\ : std_logic;
SIGNAL \s_ready_2_acu~output_o\ : std_logic;
SIGNAL \recover_fsm_n_ack~output_o\ : std_logic;
SIGNAL \user_fsm_invalid~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data_from_acu[2]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[2]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|ff_reset_n~feeder_combout\ : std_logic;
SIGNAL \raw_reset_n~input_o\ : std_logic;
SIGNAL \raw_reset_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \L_USER_LOGIC|ff_reset_n~q\ : std_logic;
SIGNAL \L_USER_LOGIC|as_reset_n~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|as_reset_n~q\ : std_logic;
SIGNAL \address_from_acu[13]~input_o\ : std_logic;
SIGNAL \address_from_acu[10]~input_o\ : std_logic;
SIGNAL \address_from_acu[11]~input_o\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \address_from_acu[2]~input_o\ : std_logic;
SIGNAL \address_from_acu[5]~input_o\ : std_logic;
SIGNAL \address_from_acu[4]~input_o\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \address_from_acu[14]~input_o\ : std_logic;
SIGNAL \address_from_acu[15]~input_o\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \address_from_acu[1]~input_o\ : std_logic;
SIGNAL \write_strobe_from_acu~input_o\ : std_logic;
SIGNAL \ff_write_strobe_from_acu~q\ : std_logic;
SIGNAL \write_strobe_from_acu_filtered~q\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[0]~9_combout\ : std_logic;
SIGNAL \address_from_acu[0]~input_o\ : std_logic;
SIGNAL \Equal1~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector16~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_is_empty~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_is_empty~q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \read_strobe_from_acu~input_o\ : std_logic;
SIGNAL \ff_read_strobe_from_acu~q\ : std_logic;
SIGNAL \read_strobe_from_acu_filtered~q\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_re_ack~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector7~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.pop_calc_addr~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector23~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector12~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.top_before_mem~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector23~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector23~2_combout\ : std_logic;
SIGNAL \cs~combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector5~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector4~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.push_before_mem~q\ : std_logic;
SIGNAL \MEM|we_hold_counter[1]~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector5~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_we~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_we~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_we~q\ : std_logic;
SIGNAL \MEM|we_rising_edge~combout\ : std_logic;
SIGNAL \MEM|we_hold_counter[0]~8_combout\ : std_logic;
SIGNAL \MEM|we_hold_counter[2]~6_combout\ : std_logic;
SIGNAL \MEM|Equal0~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector8~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.pop_before_mem~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector23~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector23~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector23~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_re~q\ : std_logic;
SIGNAL \MEM|re_hold_counter[1]~0_combout\ : std_logic;
SIGNAL \MEM|re_hold_counter[0]~1_combout\ : std_logic;
SIGNAL \MEM|re_hold_counter[1]~4_combout\ : std_logic;
SIGNAL \MEM|re_hold_counter[2]~2_combout\ : std_logic;
SIGNAL \MEM|re_hold_counter[2]~3_combout\ : std_logic;
SIGNAL \MEM|Equal2~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_re_ack~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector11~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.top_calc_addr~q\ : std_logic;
SIGNAL \L_USER_LOGIC|state.push_calc_addr~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~10_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~9_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector13~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.top_after_mem~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[15]~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~9_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|L_USER_LOGIC~10_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~16_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector5~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector5~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.push_after_mem~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector6~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector6~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.push_after_mem2~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~9_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~13_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~14_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~12_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~10_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector14~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.top_after_mem2~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~13_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~14_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~15_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector5~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~17_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector2~18_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.idle~q\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[15]~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[15]~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~14_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~9_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~10_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector9~13_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.pop_after_mem~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector10~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[1]~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~1\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[1]~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[1]~7_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~3\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~5\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~6_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[2]~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[2]~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Add0~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[3]~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[3]~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_we_ack~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~7\ : std_logic;
SIGNAL \L_USER_LOGIC|Add1~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[4]~10_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[4]~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_we_ack~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|stack_pointer[1]~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[2]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[8]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~10_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector15~12_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~11_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~5_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Add0~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~8_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~9_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~54_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~12_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~13_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36_q\ : std_logic;
SIGNAL \L_USER_LOGIC|state.idle~_wirecell_combout\ : std_logic;
SIGNAL \data_from_acu[0]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[0]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[1]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[1]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[1]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[4]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[4]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[4]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[11]~input_o\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[11]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[6]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[6]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[6]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~1_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_addr~7_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \data_from_acu[9]~input_o\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[9]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[5]~input_o\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[5]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\ : std_logic;
SIGNAL \data_from_acu[12]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[12]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[13]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[13]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[13]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~1_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~2_combout\ : std_logic;
SIGNAL \data_from_acu[7]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[7]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[7]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor3~combout\ : std_logic;
SIGNAL \data_from_acu[14]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[14]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[14]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[6]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[3]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[3]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[3]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[9]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[10]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[11]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[12]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[13]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[8]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[8]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[8]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[14]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[15]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[10]~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|mem_data_out[10]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[10]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[17]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[18]~feeder_combout\ : std_logic;
SIGNAL \data_from_acu[15]~input_o\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[15]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[8]~14_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[18]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~52_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[3]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~50_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a18\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[19]~2_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[29]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[9]~8_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[19]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[9]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~8_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~30_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[2]~15_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[12]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[6]~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[16]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[6]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a16\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[17]~3_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[27]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[17]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~33_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[5]~20_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[15]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a17\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[18]~11_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[28]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a20\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[21]~1_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[31]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[21]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]~10_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[13]~17_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[23]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[13]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[4]~19_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[14]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[10]~7_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[20]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[10]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~43_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[15]~12_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[25]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[15]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[11]~13_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[21]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[16]~4_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[26]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[16]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[14]~5_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[24]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[3]~18_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[13]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a19\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[20]~16_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[30]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~3_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[0]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[15]~5_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[1]~10_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[11]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~6_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~40_q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[12]~6_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[22]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~5_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[1]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[2]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[3]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[4]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal11~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[7]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[8]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[13]~feeder_combout\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal19~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[14]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_data_out[15]~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector10~1_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|state.pop_after_mem2~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector1~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector1~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector1~4_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_re_ack~q\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector0~2_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|Selector0~3_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|adapt_we_ack~q\ : std_logic;
SIGNAL \s_ready_2_acu~0_combout\ : std_logic;
SIGNAL \recover_fsm_n~input_o\ : std_logic;
SIGNAL \L_USER_LOGIC|ff_recover_fsm_n~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|ff_recover_fsm_n~q\ : std_logic;
SIGNAL \L_USER_LOGIC|recover_fsm_n_filtered~feeder_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|recover_fsm_n_filtered~q\ : std_logic;
SIGNAL \L_USER_LOGIC|user_fsm_invalid~0_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|user_fsm_invalid~q\ : std_logic;
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\ : std_logic_vector(0 TO 31);
SIGNAL \L_USER_LOGIC|stack_pointer\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \L_USER_LOGIC|mem_data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \L_USER_LOGIC|mem_addr\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \L_USER_LOGIC|adapt_data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \MEM|we_hold_counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \MEM|re_hold_counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\ : std_logic_vector(21 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\ : std_logic_vector(21 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\ : std_logic_vector(21 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \L_USER_LOGIC|ALT_INV_state.idle~_wirecell_combout\ : std_logic;
SIGNAL \L_USER_LOGIC|ALT_INV_state.idle~q\ : std_logic;
SIGNAL \L_USER_LOGIC|ALT_INV_recover_fsm_n_filtered~q\ : std_logic;
SIGNAL \ALT_INV_s_ready_2_acu~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_raw_reset_n <= raw_reset_n;
ww_write_strobe_from_acu <= write_strobe_from_acu;
ww_read_strobe_from_acu <= read_strobe_from_acu;
s_data_2_acu <= ww_s_data_2_acu;
ww_data_from_acu <= data_from_acu;
s_ready_2_acu <= ww_s_ready_2_acu;
ww_address_from_acu <= address_from_acu;
ww_recover_fsm_n <= recover_fsm_n;
recover_fsm_n_ack <= ww_recover_fsm_n_ack;
user_fsm_invalid <= ww_user_fsm_invalid;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(21) & 
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(20) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(19) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(18) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(17) & 
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(16) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(15) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(14) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(13) & 
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(12) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(11) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(10) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(9) & 
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(8) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(7) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(6) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(5) & 
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(4) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(3) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(2) & \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(1));

\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\L_USER_LOGIC|mem_addr\(4) & \L_USER_LOGIC|mem_addr\(3) & \L_USER_LOGIC|mem_addr\(2) & \L_USER_LOGIC|mem_addr\(1) & \L_USER_LOGIC|mem_addr\(0));

\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\L_USER_LOGIC|mem_addr~13_combout\ & \L_USER_LOGIC|mem_addr~11_combout\ & \L_USER_LOGIC|mem_addr~9_combout\ & \L_USER_LOGIC|mem_addr~7_combout\ & 
\L_USER_LOGIC|mem_addr~5_combout\);

\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a1\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a2\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a3\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a4\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a5\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a6\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a7\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a8\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a9\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a10\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a11\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a12\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a13\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a14\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a15\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a16\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(16);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a17\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(17);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a18\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(18);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a19\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(19);
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a20\ <= \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(20);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\raw_reset_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \raw_reset_n~input_o\);
\L_USER_LOGIC|ALT_INV_state.idle~_wirecell_combout\ <= NOT \L_USER_LOGIC|state.idle~_wirecell_combout\;
\L_USER_LOGIC|ALT_INV_state.idle~q\ <= NOT \L_USER_LOGIC|state.idle~q\;
\L_USER_LOGIC|ALT_INV_recover_fsm_n_filtered~q\ <= NOT \L_USER_LOGIC|recover_fsm_n_filtered~q\;
\ALT_INV_s_ready_2_acu~0_combout\ <= NOT \s_ready_2_acu~0_combout\;

-- Location: LCCOMB_X30_Y6_N16
\L_USER_LOGIC|Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add1~0_combout\ = \L_USER_LOGIC|stack_pointer\(0) $ (VCC)
-- \L_USER_LOGIC|Add1~1\ = CARRY(\L_USER_LOGIC|stack_pointer\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(0),
	datad => VCC,
	combout => \L_USER_LOGIC|Add1~0_combout\,
	cout => \L_USER_LOGIC|Add1~1\);

-- Location: FF_X24_Y9_N13
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[7]~9_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(17),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(7));

-- Location: LCCOMB_X24_Y9_N12
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[7]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[7]~9_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a6\)) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a6\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[7]~9_combout\);

-- Location: M9K_X25_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "edac_protected_ram:MEM|edac_memory_core:L_EDAC_PROTECTED_MEMORY|altsyncram:memory_content_rtl_0|altsyncram_8ai1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 21,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 21,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \MEM|Equal0~0_combout\,
	portbre => VCC,
	portbaddrstall => \L_USER_LOGIC|ALT_INV_state.idle~_wirecell_combout\,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X22_Y1_N14
\Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!\address_from_acu[7]~input_o\ & (!\address_from_acu[6]~input_o\ & (!\address_from_acu[9]~input_o\ & !\address_from_acu[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[7]~input_o\,
	datab => \address_from_acu[6]~input_o\,
	datac => \address_from_acu[9]~input_o\,
	datad => \address_from_acu[8]~input_o\,
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X28_Y8_N30
\L_USER_LOGIC|Selector1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector1~1_combout\ = (!\L_USER_LOGIC|state.top_after_mem2~q\ & !\L_USER_LOGIC|state.pop_after_mem2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L_USER_LOGIC|state.top_after_mem2~q\,
	datad => \L_USER_LOGIC|state.pop_after_mem2~q\,
	combout => \L_USER_LOGIC|Selector1~1_combout\);

-- Location: LCCOMB_X24_Y7_N6
\L_USER_LOGIC|Selector1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector1~2_combout\ = (\L_USER_LOGIC|state.idle~q\ & (((!\L_USER_LOGIC|adapt_re_ack~q\)))) # (!\L_USER_LOGIC|state.idle~q\ & (((!\L_USER_LOGIC|Selector1~1_combout\ & !\L_USER_LOGIC|adapt_re_ack~q\)) # (!\L_USER_LOGIC|stack_is_empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector1~1_combout\,
	datab => \L_USER_LOGIC|adapt_re_ack~q\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|state.idle~q\,
	combout => \L_USER_LOGIC|Selector1~2_combout\);

-- Location: LCCOMB_X29_Y8_N24
\L_USER_LOGIC|mem_addr~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~0_combout\ = (!\Equal1~4_combout\) # (!\address_from_acu[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \address_from_acu[1]~input_o\,
	datad => \Equal1~4_combout\,
	combout => \L_USER_LOGIC|mem_addr~0_combout\);

-- Location: FF_X24_Y7_N19
\L_USER_LOGIC|state.invalid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector15~15_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.invalid~q\);

-- Location: FF_X26_Y8_N7
\MEM|we_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|we_d~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|we_d~q\);

-- Location: FF_X26_Y8_N11
\MEM|re_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_re~q\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|re_d~q\);

-- Location: LCCOMB_X29_Y8_N20
\L_USER_LOGIC|Selector2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~2_combout\ = (\L_USER_LOGIC|Selector5~0_combout\ & ((\MEM|Equal0~0_combout\ & (!\L_USER_LOGIC|state.push_before_mem~q\)) # (!\MEM|Equal0~0_combout\ & ((!\L_USER_LOGIC|state.push_after_mem~q\))))) # 
-- (!\L_USER_LOGIC|Selector5~0_combout\ & (((!\L_USER_LOGIC|state.push_before_mem~q\ & !\L_USER_LOGIC|state.push_after_mem~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|Equal0~0_combout\,
	datab => \L_USER_LOGIC|state.push_before_mem~q\,
	datac => \L_USER_LOGIC|Selector5~0_combout\,
	datad => \L_USER_LOGIC|state.push_after_mem~q\,
	combout => \L_USER_LOGIC|Selector2~2_combout\);

-- Location: LCCOMB_X28_Y8_N6
\L_USER_LOGIC|Selector2~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~12_combout\ = (\L_USER_LOGIC|state.push_after_mem2~q\ & ((\Equal0~0_combout\) # (!\L_USER_LOGIC|Selector5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_after_mem2~q\,
	datab => \Equal0~0_combout\,
	datad => \L_USER_LOGIC|Selector5~0_combout\,
	combout => \L_USER_LOGIC|Selector2~12_combout\);

-- Location: LCCOMB_X27_Y8_N2
\L_USER_LOGIC|Selector14~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~4_combout\ = (\L_USER_LOGIC|state.top_after_mem~q\ & ((\Equal2~0_combout\) # ((!\L_USER_LOGIC|L_USER_LOGIC~4_combout\) # (!\MEM|Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.top_after_mem~q\,
	datab => \Equal2~0_combout\,
	datac => \MEM|Equal2~0_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	combout => \L_USER_LOGIC|Selector14~4_combout\);

-- Location: LCCOMB_X29_Y8_N22
\L_USER_LOGIC|Selector14~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~5_combout\ = (!\L_USER_LOGIC|state.push_after_mem2~q\ & (!\L_USER_LOGIC|state.push_before_mem~q\ & !\L_USER_LOGIC|state.push_after_mem~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_after_mem2~q\,
	datab => \L_USER_LOGIC|state.push_before_mem~q\,
	datad => \L_USER_LOGIC|state.push_after_mem~q\,
	combout => \L_USER_LOGIC|Selector14~5_combout\);

-- Location: LCCOMB_X31_Y7_N6
\L_USER_LOGIC|Selector16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector16~0_combout\ = (!\L_USER_LOGIC|stack_pointer\(2) & (!\L_USER_LOGIC|stack_pointer\(4) & (!\L_USER_LOGIC|stack_pointer\(3) & !\L_USER_LOGIC|stack_pointer\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(2),
	datab => \L_USER_LOGIC|stack_pointer\(4),
	datac => \L_USER_LOGIC|stack_pointer\(3),
	datad => \L_USER_LOGIC|stack_pointer\(1),
	combout => \L_USER_LOGIC|Selector16~0_combout\);

-- Location: LCCOMB_X30_Y7_N26
\L_USER_LOGIC|stack_pointer[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[0]~8_combout\ = (\L_USER_LOGIC|state.pop_after_mem~q\ & (((\L_USER_LOGIC|Add1~0_combout\)))) # (!\L_USER_LOGIC|state.pop_after_mem~q\ & (!\L_USER_LOGIC|stack_pointer\(0) & (\L_USER_LOGIC|stack_is_empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem~q\,
	datab => \L_USER_LOGIC|stack_pointer\(0),
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|Add1~0_combout\,
	combout => \L_USER_LOGIC|stack_pointer[0]~8_combout\);

-- Location: LCCOMB_X24_Y7_N4
\L_USER_LOGIC|Selector15~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~0_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (((\L_USER_LOGIC|adapt_we_ack~1_combout\)))) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & (!\L_USER_LOGIC|stack_is_empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~5_combout\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|adapt_we_ack~1_combout\,
	combout => \L_USER_LOGIC|Selector15~0_combout\);

-- Location: LCCOMB_X27_Y8_N24
\L_USER_LOGIC|Selector15~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~1_combout\ = ((\Equal2~0_combout\) # ((!\L_USER_LOGIC|state.top_after_mem2~q\ & !\L_USER_LOGIC|state.top_after_mem~q\))) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.top_after_mem2~q\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	datac => \Equal2~0_combout\,
	datad => \L_USER_LOGIC|state.top_after_mem~q\,
	combout => \L_USER_LOGIC|Selector15~1_combout\);

-- Location: LCCOMB_X28_Y7_N14
\L_USER_LOGIC|Selector15~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~2_combout\ = (\Equal1~5_combout\) # (((!\L_USER_LOGIC|state.pop_after_mem2~q\ & !\L_USER_LOGIC|state.pop_before_mem~q\)) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem2~q\,
	datab => \Equal1~5_combout\,
	datac => \L_USER_LOGIC|state.pop_before_mem~q\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	combout => \L_USER_LOGIC|Selector15~2_combout\);

-- Location: LCCOMB_X29_Y8_N26
\L_USER_LOGIC|Selector15~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~5_combout\ = ((!\L_USER_LOGIC|state.push_after_mem2~q\ & (!\L_USER_LOGIC|state.push_before_mem~q\ & !\L_USER_LOGIC|state.push_after_mem~q\))) # (!\L_USER_LOGIC|Selector5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_after_mem2~q\,
	datab => \L_USER_LOGIC|state.push_before_mem~q\,
	datac => \L_USER_LOGIC|Selector5~0_combout\,
	datad => \L_USER_LOGIC|state.push_after_mem~q\,
	combout => \L_USER_LOGIC|Selector15~5_combout\);

-- Location: LCCOMB_X28_Y7_N8
\L_USER_LOGIC|Selector15~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~6_combout\ = (\L_USER_LOGIC|Selector15~4_combout\ & (\L_USER_LOGIC|Selector15~5_combout\ & ((\L_USER_LOGIC|L_USER_LOGIC~9_combout\) # (!\L_USER_LOGIC|state.top_before_mem~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~9_combout\,
	datab => \L_USER_LOGIC|state.top_before_mem~q\,
	datac => \L_USER_LOGIC|Selector15~4_combout\,
	datad => \L_USER_LOGIC|Selector15~5_combout\,
	combout => \L_USER_LOGIC|Selector15~6_combout\);

-- Location: LCCOMB_X27_Y7_N12
\L_USER_LOGIC|Selector15~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~9_combout\ = (\L_USER_LOGIC|Selector15~7_combout\ & (\L_USER_LOGIC|Selector15~8_combout\ & ((\L_USER_LOGIC|L_USER_LOGIC~10_combout\) # (!\L_USER_LOGIC|state.pop_after_mem~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem~q\,
	datab => \L_USER_LOGIC|Selector15~7_combout\,
	datac => \L_USER_LOGIC|Selector15~8_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	combout => \L_USER_LOGIC|Selector15~9_combout\);

-- Location: LCCOMB_X24_Y7_N10
\L_USER_LOGIC|Selector15~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~10_combout\ = (\L_USER_LOGIC|Selector15~2_combout\ & (\L_USER_LOGIC|Selector15~1_combout\ & (\L_USER_LOGIC|Selector15~9_combout\ & \L_USER_LOGIC|Selector15~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector15~2_combout\,
	datab => \L_USER_LOGIC|Selector15~1_combout\,
	datac => \L_USER_LOGIC|Selector15~9_combout\,
	datad => \L_USER_LOGIC|Selector15~6_combout\,
	combout => \L_USER_LOGIC|Selector15~10_combout\);

-- Location: LCCOMB_X24_Y7_N0
\L_USER_LOGIC|Selector15~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~13_combout\ = (\L_USER_LOGIC|adapt_re_ack~0_combout\ & (((\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & !\L_USER_LOGIC|L_USER_LOGIC~7_combout\)) # (!\L_USER_LOGIC|Selector15~12_combout\))) # (!\L_USER_LOGIC|adapt_re_ack~0_combout\ & 
-- (\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & (!\L_USER_LOGIC|L_USER_LOGIC~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|adapt_re_ack~0_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~5_combout\,
	datac => \L_USER_LOGIC|L_USER_LOGIC~7_combout\,
	datad => \L_USER_LOGIC|Selector15~12_combout\,
	combout => \L_USER_LOGIC|Selector15~13_combout\);

-- Location: LCCOMB_X24_Y7_N30
\L_USER_LOGIC|Selector15~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~14_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & ((\MEM|Equal0~0_combout\) # ((!\L_USER_LOGIC|Selector5~0_combout\)))) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (((\L_USER_LOGIC|Selector15~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datab => \MEM|Equal0~0_combout\,
	datac => \L_USER_LOGIC|Selector5~0_combout\,
	datad => \L_USER_LOGIC|Selector15~13_combout\,
	combout => \L_USER_LOGIC|Selector15~14_combout\);

-- Location: LCCOMB_X24_Y7_N18
\L_USER_LOGIC|Selector15~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~15_combout\ = (\L_USER_LOGIC|Selector15~10_combout\ & ((\L_USER_LOGIC|Selector15~0_combout\) # ((\L_USER_LOGIC|state.idle~q\) # (\L_USER_LOGIC|Selector15~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector15~0_combout\,
	datab => \L_USER_LOGIC|state.idle~q\,
	datac => \L_USER_LOGIC|Selector15~14_combout\,
	datad => \L_USER_LOGIC|Selector15~10_combout\,
	combout => \L_USER_LOGIC|Selector15~15_combout\);

-- Location: FF_X33_Y8_N31
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[7]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7));

-- Location: LCCOMB_X28_Y7_N10
\L_USER_LOGIC|Selector9~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~6_combout\ = (\L_USER_LOGIC|state.top_before_mem~q\ & ((\Equal2~0_combout\) # ((\MEM|Equal2~0_combout\) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \L_USER_LOGIC|state.top_before_mem~q\,
	datac => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	datad => \MEM|Equal2~0_combout\,
	combout => \L_USER_LOGIC|Selector9~6_combout\);

-- Location: LCCOMB_X29_Y7_N22
\L_USER_LOGIC|Selector9~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~12_combout\ = (!\L_USER_LOGIC|L_USER_LOGIC~10_combout\ & (\L_USER_LOGIC|state.pop_before_mem~q\ & (\MEM|Equal2~0_combout\ & !\L_USER_LOGIC|Selector9~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	datab => \L_USER_LOGIC|state.pop_before_mem~q\,
	datac => \MEM|Equal2~0_combout\,
	datad => \L_USER_LOGIC|Selector9~6_combout\,
	combout => \L_USER_LOGIC|Selector9~12_combout\);

-- Location: LCCOMB_X33_Y7_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal8~0_combout\ = (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5) & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal8~0_combout\);

-- Location: LCCOMB_X33_Y8_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal17~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal17~0_combout\ = (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal17~0_combout\);

-- Location: FF_X27_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(6),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~34_q\);

-- Location: FF_X24_Y7_N13
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(1));

-- Location: FF_X26_Y7_N3
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(5));

-- Location: FF_X26_Y7_N17
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(7));

-- Location: FF_X26_Y7_N31
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr~11_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(8));

-- Location: FF_X26_Y7_N1
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_addr~9_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(6));

-- Location: LCCOMB_X26_Y7_N30
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~51_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(7) & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(8) & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(5) $ 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(6))))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(7) & (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(8) & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(5) $ (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(7),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(5),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(8),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~51_combout\);

-- Location: FF_X26_Y7_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_addr~13_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(10));

-- Location: FF_X28_Y9_N13
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(16),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~44_q\);

-- Location: FF_X27_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41_q\);

-- Location: FF_X27_Y9_N21
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(4),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~32_q\);

-- Location: FF_X27_Y9_N19
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35_q\);

-- Location: FF_X24_Y9_N5
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[17]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(17));

-- Location: FF_X27_Y9_N5
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(21),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~49_q\);

-- Location: FF_X28_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37_q\);

-- Location: FF_X32_Y9_N5
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48_q\);

-- Location: FF_X32_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(19),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~47_q\);

-- Location: LCCOMB_X26_Y7_N6
\L_USER_LOGIC|mem_addr~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~2_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & ((\L_USER_LOGIC|adapt_we_ack~1_combout\) # ((\MEM|Equal0~0_combout\) # (!\L_USER_LOGIC|Selector5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|adapt_we_ack~1_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datac => \MEM|Equal0~0_combout\,
	datad => \L_USER_LOGIC|Selector5~0_combout\,
	combout => \L_USER_LOGIC|mem_addr~2_combout\);

-- Location: LCCOMB_X27_Y7_N6
\L_USER_LOGIC|mem_addr~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~6_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (\L_USER_LOGIC|stack_is_empty~q\ & (\L_USER_LOGIC|stack_pointer\(0) $ (\L_USER_LOGIC|stack_pointer\(1))))) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & 
-- (((\L_USER_LOGIC|stack_pointer\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(0),
	datab => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|stack_pointer\(1),
	combout => \L_USER_LOGIC|mem_addr~6_combout\);

-- Location: LCCOMB_X30_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(15) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(15),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(10),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\);

-- Location: LCCOMB_X28_Y7_N6
\L_USER_LOGIC|L_USER_LOGIC~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~11_combout\ = (\Equal1~4_combout\ & (\address_from_acu[1]~input_o\ $ (\address_from_acu[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[1]~input_o\,
	datab => \address_from_acu[0]~input_o\,
	datad => \Equal1~4_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~11_combout\);

-- Location: LCCOMB_X30_Y8_N30
\L_USER_LOGIC|Selector0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector0~4_combout\ = (\L_USER_LOGIC|Selector5~0_combout\ & (!\MEM|Equal0~0_combout\ & (!\L_USER_LOGIC|state.idle~q\ & \L_USER_LOGIC|L_USER_LOGIC~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector5~0_combout\,
	datab => \MEM|Equal0~0_combout\,
	datac => \L_USER_LOGIC|state.idle~q\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	combout => \L_USER_LOGIC|Selector0~4_combout\);

-- Location: IOIBUF_X21_Y0_N1
\address_from_acu[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(3),
	o => \address_from_acu[3]~input_o\);

-- Location: IOIBUF_X26_Y0_N15
\address_from_acu[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(6),
	o => \address_from_acu[6]~input_o\);

-- Location: IOIBUF_X21_Y0_N29
\address_from_acu[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(7),
	o => \address_from_acu[7]~input_o\);

-- Location: IOIBUF_X26_Y0_N22
\address_from_acu[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(8),
	o => \address_from_acu[8]~input_o\);

-- Location: IOIBUF_X19_Y0_N8
\address_from_acu[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(9),
	o => \address_from_acu[9]~input_o\);

-- Location: IOIBUF_X23_Y0_N22
\address_from_acu[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(12),
	o => \address_from_acu[12]~input_o\);

-- Location: LCCOMB_X33_Y8_N30
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[7]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(7),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[7]~feeder_combout\);

-- Location: LCCOMB_X26_Y8_N6
\MEM|we_d~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|we_d~feeder_combout\ = \L_USER_LOGIC|mem_we~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_we~q\,
	combout => \MEM|we_d~feeder_combout\);

-- Location: LCCOMB_X24_Y7_N12
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[1]~feeder_combout\ = \L_USER_LOGIC|mem_addr\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L_USER_LOGIC|mem_addr\(0),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[1]~feeder_combout\);

-- Location: LCCOMB_X27_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(13),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41feeder_combout\);

-- Location: LCCOMB_X27_Y9_N18
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(7),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~35feeder_combout\);

-- Location: LCCOMB_X24_Y9_N4
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[17]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[17]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(7),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[17]~feeder_combout\);

-- Location: LCCOMB_X28_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37feeder_combout\);

-- Location: LCCOMB_X32_Y9_N4
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(20),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48feeder_combout\);

-- Location: IOOBUF_X35_Y0_N9
\s_data_2_acu[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(0),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[0]~output_o\);

-- Location: IOOBUF_X41_Y7_N2
\s_data_2_acu[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(1),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[1]~output_o\);

-- Location: IOOBUF_X41_Y5_N16
\s_data_2_acu[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(2),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[2]~output_o\);

-- Location: IOOBUF_X35_Y0_N30
\s_data_2_acu[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(3),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[3]~output_o\);

-- Location: IOOBUF_X41_Y7_N23
\s_data_2_acu[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(4),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[4]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\s_data_2_acu[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(5),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[5]~output_o\);

-- Location: IOOBUF_X32_Y0_N30
\s_data_2_acu[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(6),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[6]~output_o\);

-- Location: IOOBUF_X32_Y0_N23
\s_data_2_acu[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(7),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[7]~output_o\);

-- Location: IOOBUF_X28_Y0_N9
\s_data_2_acu[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(8),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[8]~output_o\);

-- Location: IOOBUF_X35_Y0_N2
\s_data_2_acu[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(9),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[9]~output_o\);

-- Location: IOOBUF_X41_Y5_N23
\s_data_2_acu[10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(10),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[10]~output_o\);

-- Location: IOOBUF_X28_Y0_N30
\s_data_2_acu[11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(11),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[11]~output_o\);

-- Location: IOOBUF_X37_Y0_N23
\s_data_2_acu[12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(12),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[12]~output_o\);

-- Location: IOOBUF_X41_Y7_N16
\s_data_2_acu[13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(13),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[13]~output_o\);

-- Location: IOOBUF_X41_Y5_N2
\s_data_2_acu[14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(14),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[14]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\s_data_2_acu[15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|adapt_data_out\(15),
	oe => \cs~combout\,
	devoe => ww_devoe,
	o => \s_data_2_acu[15]~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\s_ready_2_acu~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_s_ready_2_acu~0_combout\,
	devoe => ww_devoe,
	o => \s_ready_2_acu~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\recover_fsm_n_ack~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|ALT_INV_recover_fsm_n_filtered~q\,
	devoe => ww_devoe,
	o => \recover_fsm_n_ack~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\user_fsm_invalid~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \L_USER_LOGIC|user_fsm_invalid~q\,
	devoe => ww_devoe,
	o => \user_fsm_invalid~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X30_Y0_N8
\data_from_acu[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(2),
	o => \data_from_acu[2]~input_o\);

-- Location: LCCOMB_X30_Y8_N10
\L_USER_LOGIC|mem_data_out[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[2]~feeder_combout\ = \data_from_acu[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[2]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[2]~feeder_combout\);

-- Location: LCCOMB_X30_Y7_N2
\L_USER_LOGIC|ff_reset_n~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|ff_reset_n~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \L_USER_LOGIC|ff_reset_n~feeder_combout\);

-- Location: IOIBUF_X0_Y14_N8
\raw_reset_n~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_raw_reset_n,
	o => \raw_reset_n~input_o\);

-- Location: CLKCTRL_G2
\raw_reset_n~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \raw_reset_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \raw_reset_n~inputclkctrl_outclk\);

-- Location: FF_X30_Y7_N3
\L_USER_LOGIC|ff_reset_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|ff_reset_n~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|ff_reset_n~q\);

-- Location: LCCOMB_X30_Y7_N0
\L_USER_LOGIC|as_reset_n~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|as_reset_n~feeder_combout\ = \L_USER_LOGIC|ff_reset_n~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|ff_reset_n~q\,
	combout => \L_USER_LOGIC|as_reset_n~feeder_combout\);

-- Location: FF_X30_Y7_N1
\L_USER_LOGIC|as_reset_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|as_reset_n~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|as_reset_n~q\);

-- Location: IOIBUF_X23_Y0_N15
\address_from_acu[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(13),
	o => \address_from_acu[13]~input_o\);

-- Location: IOIBUF_X23_Y0_N8
\address_from_acu[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(10),
	o => \address_from_acu[10]~input_o\);

-- Location: IOIBUF_X23_Y0_N29
\address_from_acu[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(11),
	o => \address_from_acu[11]~input_o\);

-- Location: LCCOMB_X23_Y1_N0
\Equal1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!\address_from_acu[12]~input_o\ & (!\address_from_acu[13]~input_o\ & (!\address_from_acu[10]~input_o\ & !\address_from_acu[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[12]~input_o\,
	datab => \address_from_acu[13]~input_o\,
	datac => \address_from_acu[10]~input_o\,
	datad => \address_from_acu[11]~input_o\,
	combout => \Equal1~2_combout\);

-- Location: IOIBUF_X21_Y0_N8
\address_from_acu[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(2),
	o => \address_from_acu[2]~input_o\);

-- Location: IOIBUF_X19_Y0_N29
\address_from_acu[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(5),
	o => \address_from_acu[5]~input_o\);

-- Location: IOIBUF_X23_Y0_N1
\address_from_acu[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(4),
	o => \address_from_acu[4]~input_o\);

-- Location: LCCOMB_X22_Y1_N16
\Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!\address_from_acu[3]~input_o\ & (!\address_from_acu[2]~input_o\ & (!\address_from_acu[5]~input_o\ & !\address_from_acu[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[3]~input_o\,
	datab => \address_from_acu[2]~input_o\,
	datac => \address_from_acu[5]~input_o\,
	datad => \address_from_acu[4]~input_o\,
	combout => \Equal1~0_combout\);

-- Location: IOIBUF_X32_Y0_N15
\address_from_acu[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(14),
	o => \address_from_acu[14]~input_o\);

-- Location: IOIBUF_X35_Y0_N15
\address_from_acu[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(15),
	o => \address_from_acu[15]~input_o\);

-- Location: LCCOMB_X32_Y1_N12
\Equal1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = (!\address_from_acu[14]~input_o\ & !\address_from_acu[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \address_from_acu[14]~input_o\,
	datad => \address_from_acu[15]~input_o\,
	combout => \Equal1~3_combout\);

-- Location: LCCOMB_X23_Y1_N18
\Equal1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = (\Equal1~1_combout\ & (\Equal1~2_combout\ & (\Equal1~0_combout\ & \Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Equal1~2_combout\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~3_combout\,
	combout => \Equal1~4_combout\);

-- Location: IOIBUF_X32_Y0_N8
\address_from_acu[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(1),
	o => \address_from_acu[1]~input_o\);

-- Location: IOIBUF_X41_Y5_N8
\write_strobe_from_acu~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_strobe_from_acu,
	o => \write_strobe_from_acu~input_o\);

-- Location: FF_X35_Y7_N17
ff_write_strobe_from_acu : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \write_strobe_from_acu~input_o\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_write_strobe_from_acu~q\);

-- Location: FF_X27_Y7_N3
write_strobe_from_acu_filtered : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ff_write_strobe_from_acu~q\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_strobe_from_acu_filtered~q\);

-- Location: LCCOMB_X27_Y7_N0
\L_USER_LOGIC|L_USER_LOGIC~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~8_combout\ = (\address_from_acu[0]~input_o\ & (\Equal1~4_combout\ & (!\address_from_acu[1]~input_o\ & \write_strobe_from_acu_filtered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[0]~input_o\,
	datab => \Equal1~4_combout\,
	datac => \address_from_acu[1]~input_o\,
	datad => \write_strobe_from_acu_filtered~q\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~8_combout\);

-- Location: LCCOMB_X30_Y8_N28
\L_USER_LOGIC|Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~0_combout\ = (!\L_USER_LOGIC|state.idle~q\ & \L_USER_LOGIC|L_USER_LOGIC~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	combout => \L_USER_LOGIC|Selector2~0_combout\);

-- Location: LCCOMB_X30_Y7_N18
\L_USER_LOGIC|stack_pointer[0]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[0]~9_combout\ = (\L_USER_LOGIC|stack_pointer[1]~2_combout\ & ((\L_USER_LOGIC|stack_pointer\(0)))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (\L_USER_LOGIC|stack_pointer[0]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer[0]~8_combout\,
	datac => \L_USER_LOGIC|stack_pointer\(0),
	datad => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	combout => \L_USER_LOGIC|stack_pointer[0]~9_combout\);

-- Location: FF_X30_Y7_N19
\L_USER_LOGIC|stack_pointer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|stack_pointer[0]~9_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|stack_pointer\(0));

-- Location: IOIBUF_X41_Y6_N22
\address_from_acu[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address_from_acu(0),
	o => \address_from_acu[0]~input_o\);

-- Location: LCCOMB_X28_Y7_N2
\Equal1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~5_combout\ = (\address_from_acu[1]~input_o\ & (\address_from_acu[0]~input_o\ & \Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[1]~input_o\,
	datab => \address_from_acu[0]~input_o\,
	datad => \Equal1~4_combout\,
	combout => \Equal1~5_combout\);

-- Location: LCCOMB_X30_Y7_N8
\L_USER_LOGIC|Selector16~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector16~1_combout\ = (\L_USER_LOGIC|Selector16~0_combout\ & (\L_USER_LOGIC|state.idle~q\ & (\L_USER_LOGIC|Selector10~0_combout\ & !\L_USER_LOGIC|stack_pointer\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector16~0_combout\,
	datab => \L_USER_LOGIC|state.idle~q\,
	datac => \L_USER_LOGIC|Selector10~0_combout\,
	datad => \L_USER_LOGIC|stack_pointer\(0),
	combout => \L_USER_LOGIC|Selector16~1_combout\);

-- Location: LCCOMB_X30_Y7_N14
\L_USER_LOGIC|stack_is_empty~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_is_empty~0_combout\ = (\L_USER_LOGIC|Selector0~4_combout\ & (!\L_USER_LOGIC|state.idle~q\)) # (!\L_USER_LOGIC|Selector0~4_combout\ & ((\L_USER_LOGIC|Selector16~1_combout\ & (!\L_USER_LOGIC|state.idle~q\)) # 
-- (!\L_USER_LOGIC|Selector16~1_combout\ & ((\L_USER_LOGIC|stack_is_empty~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector0~4_combout\,
	datab => \L_USER_LOGIC|state.idle~q\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|Selector16~1_combout\,
	combout => \L_USER_LOGIC|stack_is_empty~0_combout\);

-- Location: FF_X30_Y7_N15
\L_USER_LOGIC|stack_is_empty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|stack_is_empty~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|stack_is_empty~q\);

-- Location: LCCOMB_X27_Y7_N2
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ((\address_from_acu[1]~input_o\) # (!\address_from_acu[0]~input_o\)) # (!\Equal1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => \address_from_acu[1]~input_o\,
	datad => \address_from_acu[0]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: IOIBUF_X26_Y0_N29
\read_strobe_from_acu~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_read_strobe_from_acu,
	o => \read_strobe_from_acu~input_o\);

-- Location: FF_X27_Y7_N5
ff_read_strobe_from_acu : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \read_strobe_from_acu~input_o\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_read_strobe_from_acu~q\);

-- Location: FF_X27_Y7_N23
read_strobe_from_acu_filtered : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ff_read_strobe_from_acu~q\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \read_strobe_from_acu_filtered~q\);

-- Location: LCCOMB_X27_Y7_N22
\L_USER_LOGIC|adapt_re_ack~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_re_ack~0_combout\ = (\Equal1~4_combout\ & (\address_from_acu[1]~input_o\ & (\read_strobe_from_acu_filtered~q\ & \address_from_acu[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => \address_from_acu[1]~input_o\,
	datac => \read_strobe_from_acu_filtered~q\,
	datad => \address_from_acu[0]~input_o\,
	combout => \L_USER_LOGIC|adapt_re_ack~0_combout\);

-- Location: LCCOMB_X27_Y7_N20
\L_USER_LOGIC|L_USER_LOGIC~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~5_combout\ = (!\address_from_acu[0]~input_o\ & (\address_from_acu[1]~input_o\ & (\read_strobe_from_acu_filtered~q\ & \Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[0]~input_o\,
	datab => \address_from_acu[1]~input_o\,
	datac => \read_strobe_from_acu_filtered~q\,
	datad => \Equal1~4_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~5_combout\);

-- Location: LCCOMB_X26_Y7_N2
\L_USER_LOGIC|L_USER_LOGIC~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~7_combout\ = (\Equal0~0_combout\ & (!\Equal1~5_combout\ & \L_USER_LOGIC|L_USER_LOGIC~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal1~5_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~6_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~7_combout\);

-- Location: LCCOMB_X28_Y7_N30
\L_USER_LOGIC|Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector7~0_combout\ = (!\L_USER_LOGIC|state.idle~q\ & (\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & (\L_USER_LOGIC|L_USER_LOGIC~7_combout\ & \L_USER_LOGIC|stack_is_empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~5_combout\,
	datac => \L_USER_LOGIC|L_USER_LOGIC~7_combout\,
	datad => \L_USER_LOGIC|stack_is_empty~q\,
	combout => \L_USER_LOGIC|Selector7~0_combout\);

-- Location: FF_X28_Y7_N31
\L_USER_LOGIC|state.pop_calc_addr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector7~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.pop_calc_addr~q\);

-- Location: LCCOMB_X28_Y7_N18
\L_USER_LOGIC|Selector23~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector23~4_combout\ = (\Equal2~0_combout\ & ((\L_USER_LOGIC|state.pop_calc_addr~q\) # ((\Equal1~5_combout\ & \L_USER_LOGIC|state.top_calc_addr~q\)))) # (!\Equal2~0_combout\ & (\Equal1~5_combout\ & (\L_USER_LOGIC|state.top_calc_addr~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Equal1~5_combout\,
	datac => \L_USER_LOGIC|state.top_calc_addr~q\,
	datad => \L_USER_LOGIC|state.pop_calc_addr~q\,
	combout => \L_USER_LOGIC|Selector23~4_combout\);

-- Location: LCCOMB_X27_Y7_N24
\L_USER_LOGIC|Selector15~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~7_combout\ = ((!\L_USER_LOGIC|L_USER_LOGIC~6_combout\) # (!\Equal1~5_combout\)) # (!\L_USER_LOGIC|state.top_calc_addr~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.top_calc_addr~q\,
	datac => \Equal1~5_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~6_combout\,
	combout => \L_USER_LOGIC|Selector15~7_combout\);

-- Location: LCCOMB_X28_Y7_N24
\L_USER_LOGIC|Selector12~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector12~0_combout\ = ((!\L_USER_LOGIC|L_USER_LOGIC~9_combout\ & (\L_USER_LOGIC|state.top_before_mem~q\ & !\MEM|Equal2~0_combout\))) # (!\L_USER_LOGIC|Selector15~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~9_combout\,
	datab => \L_USER_LOGIC|Selector15~7_combout\,
	datac => \L_USER_LOGIC|state.top_before_mem~q\,
	datad => \MEM|Equal2~0_combout\,
	combout => \L_USER_LOGIC|Selector12~0_combout\);

-- Location: FF_X28_Y7_N25
\L_USER_LOGIC|state.top_before_mem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector12~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.top_before_mem~q\);

-- Location: LCCOMB_X28_Y7_N0
\L_USER_LOGIC|Selector23~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector23~0_combout\ = (!\L_USER_LOGIC|state.pop_before_mem~q\ & !\L_USER_LOGIC|state.top_before_mem~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_before_mem~q\,
	datad => \L_USER_LOGIC|state.top_before_mem~q\,
	combout => \L_USER_LOGIC|Selector23~0_combout\);

-- Location: LCCOMB_X28_Y7_N26
\L_USER_LOGIC|Selector23~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector23~2_combout\ = (\L_USER_LOGIC|state.pop_calc_addr~q\) # ((\L_USER_LOGIC|Selector23~0_combout\) # ((\L_USER_LOGIC|state.top_calc_addr~q\) # (!\MEM|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_calc_addr~q\,
	datab => \L_USER_LOGIC|Selector23~0_combout\,
	datac => \L_USER_LOGIC|state.top_calc_addr~q\,
	datad => \MEM|Equal2~0_combout\,
	combout => \L_USER_LOGIC|Selector23~2_combout\);

-- Location: LCCOMB_X28_Y7_N12
cs : cycloneiii_lcell_comb
-- Equation(s):
-- \cs~combout\ = (\Equal1~4_combout\ & ((\address_from_acu[1]~input_o\) # (\address_from_acu[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[1]~input_o\,
	datab => \address_from_acu[0]~input_o\,
	datad => \Equal1~4_combout\,
	combout => \cs~combout\);

-- Location: LCCOMB_X26_Y8_N24
\L_USER_LOGIC|Selector5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector5~0_combout\ = (\L_USER_LOGIC|mem_addr~0_combout\ & (!\MEM|Equal2~0_combout\ & ((!\read_strobe_from_acu_filtered~q\) # (!\cs~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr~0_combout\,
	datab => \cs~combout\,
	datac => \read_strobe_from_acu_filtered~q\,
	datad => \MEM|Equal2~0_combout\,
	combout => \L_USER_LOGIC|Selector5~0_combout\);

-- Location: LCCOMB_X27_Y8_N10
\L_USER_LOGIC|Selector15~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~3_combout\ = (!\MEM|Equal2~0_combout\ & ((!\read_strobe_from_acu_filtered~q\) # (!\cs~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~combout\,
	datab => \read_strobe_from_acu_filtered~q\,
	datad => \MEM|Equal2~0_combout\,
	combout => \L_USER_LOGIC|Selector15~3_combout\);

-- Location: LCCOMB_X27_Y8_N16
\L_USER_LOGIC|Selector15~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~4_combout\ = ((\MEM|Equal0~0_combout\) # ((\Equal0~0_combout\) # (!\L_USER_LOGIC|Selector15~3_combout\))) # (!\L_USER_LOGIC|state.push_calc_addr~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_calc_addr~q\,
	datab => \MEM|Equal0~0_combout\,
	datac => \Equal0~0_combout\,
	datad => \L_USER_LOGIC|Selector15~3_combout\,
	combout => \L_USER_LOGIC|Selector15~4_combout\);

-- Location: LCCOMB_X29_Y8_N18
\L_USER_LOGIC|Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector4~0_combout\ = ((!\MEM|Equal0~0_combout\ & (\L_USER_LOGIC|Selector5~0_combout\ & \L_USER_LOGIC|state.push_before_mem~q\))) # (!\L_USER_LOGIC|Selector15~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|Equal0~0_combout\,
	datab => \L_USER_LOGIC|Selector5~0_combout\,
	datac => \L_USER_LOGIC|state.push_before_mem~q\,
	datad => \L_USER_LOGIC|Selector15~4_combout\,
	combout => \L_USER_LOGIC|Selector4~0_combout\);

-- Location: FF_X29_Y8_N19
\L_USER_LOGIC|state.push_before_mem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector4~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.push_before_mem~q\);

-- Location: LCCOMB_X26_Y8_N22
\MEM|we_hold_counter[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|we_hold_counter[1]~7_combout\ = (!\MEM|we_rising_edge~combout\ & ((\MEM|we_hold_counter\(0) & ((\MEM|we_hold_counter\(1)))) # (!\MEM|we_hold_counter\(0) & (\MEM|we_hold_counter\(2) & !\MEM|we_hold_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|we_hold_counter\(2),
	datab => \MEM|we_hold_counter\(0),
	datac => \MEM|we_hold_counter\(1),
	datad => \MEM|we_rising_edge~combout\,
	combout => \MEM|we_hold_counter[1]~7_combout\);

-- Location: FF_X26_Y8_N23
\MEM|we_hold_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|we_hold_counter[1]~7_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|we_hold_counter\(1));

-- Location: LCCOMB_X27_Y8_N12
\L_USER_LOGIC|Selector5~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector5~2_combout\ = (\L_USER_LOGIC|state.push_before_mem~q\ & ((\MEM|we_hold_counter\(0)) # ((\MEM|we_hold_counter\(2)) # (\MEM|we_hold_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_before_mem~q\,
	datab => \MEM|we_hold_counter\(0),
	datac => \MEM|we_hold_counter\(2),
	datad => \MEM|we_hold_counter\(1),
	combout => \L_USER_LOGIC|Selector5~2_combout\);

-- Location: LCCOMB_X29_Y8_N4
\L_USER_LOGIC|mem_we~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_we~0_combout\ = (\L_USER_LOGIC|mem_we~q\ & ((!\L_USER_LOGIC|Selector5~2_combout\) # (!\L_USER_LOGIC|Selector5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector5~0_combout\,
	datac => \L_USER_LOGIC|mem_we~q\,
	datad => \L_USER_LOGIC|Selector5~2_combout\,
	combout => \L_USER_LOGIC|mem_we~0_combout\);

-- Location: LCCOMB_X29_Y8_N8
\L_USER_LOGIC|mem_we~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_we~1_combout\ = (\L_USER_LOGIC|mem_we~0_combout\) # ((!\L_USER_LOGIC|state.push_before_mem~q\ & !\L_USER_LOGIC|Selector15~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|state.push_before_mem~q\,
	datac => \L_USER_LOGIC|mem_we~0_combout\,
	datad => \L_USER_LOGIC|Selector15~4_combout\,
	combout => \L_USER_LOGIC|mem_we~1_combout\);

-- Location: FF_X29_Y8_N9
\L_USER_LOGIC|mem_we\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_we~1_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_we~q\);

-- Location: LCCOMB_X26_Y8_N8
\MEM|we_rising_edge\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|we_rising_edge~combout\ = (!\MEM|we_d~q\ & \L_USER_LOGIC|mem_we~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|we_d~q\,
	datad => \L_USER_LOGIC|mem_we~q\,
	combout => \MEM|we_rising_edge~combout\);

-- Location: LCCOMB_X26_Y8_N28
\MEM|we_hold_counter[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|we_hold_counter[0]~8_combout\ = (!\MEM|we_hold_counter\(0) & (!\MEM|we_rising_edge~combout\ & ((\MEM|we_hold_counter\(1)) # (\MEM|we_hold_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|we_hold_counter\(1),
	datab => \MEM|we_hold_counter\(2),
	datac => \MEM|we_hold_counter\(0),
	datad => \MEM|we_rising_edge~combout\,
	combout => \MEM|we_hold_counter[0]~8_combout\);

-- Location: FF_X26_Y8_N29
\MEM|we_hold_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|we_hold_counter[0]~8_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|we_hold_counter\(0));

-- Location: LCCOMB_X26_Y8_N4
\MEM|we_hold_counter[2]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|we_hold_counter[2]~6_combout\ = (\MEM|we_rising_edge~combout\) # ((\MEM|we_hold_counter\(2) & ((\MEM|we_hold_counter\(1)) # (\MEM|we_hold_counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|we_hold_counter\(1),
	datab => \MEM|we_hold_counter\(0),
	datac => \MEM|we_hold_counter\(2),
	datad => \MEM|we_rising_edge~combout\,
	combout => \MEM|we_hold_counter[2]~6_combout\);

-- Location: FF_X26_Y8_N5
\MEM|we_hold_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|we_hold_counter[2]~6_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|we_hold_counter\(2));

-- Location: LCCOMB_X26_Y8_N30
\MEM|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|Equal0~0_combout\ = (\MEM|we_hold_counter\(1)) # ((\MEM|we_hold_counter\(2)) # (\MEM|we_hold_counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|we_hold_counter\(1),
	datac => \MEM|we_hold_counter\(2),
	datad => \MEM|we_hold_counter\(0),
	combout => \MEM|Equal0~0_combout\);

-- Location: LCCOMB_X27_Y8_N28
\L_USER_LOGIC|L_USER_LOGIC~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~4_combout\ = (\Equal0~0_combout\ & (!\MEM|Equal0~0_combout\ & ((!\write_strobe_from_acu_filtered~q\) # (!\cs~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~combout\,
	datab => \Equal0~0_combout\,
	datac => \write_strobe_from_acu_filtered~q\,
	datad => \MEM|Equal0~0_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~4_combout\);

-- Location: LCCOMB_X27_Y7_N4
\L_USER_LOGIC|Selector15~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~8_combout\ = ((!\L_USER_LOGIC|L_USER_LOGIC~6_combout\) # (!\L_USER_LOGIC|state.pop_calc_addr~q\)) # (!\Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \L_USER_LOGIC|state.pop_calc_addr~q\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~6_combout\,
	combout => \L_USER_LOGIC|Selector15~8_combout\);

-- Location: LCCOMB_X28_Y7_N22
\L_USER_LOGIC|Selector8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector8~0_combout\ = ((!\L_USER_LOGIC|L_USER_LOGIC~10_combout\ & (\L_USER_LOGIC|state.pop_before_mem~q\ & !\MEM|Equal2~0_combout\))) # (!\L_USER_LOGIC|Selector15~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	datab => \L_USER_LOGIC|Selector15~8_combout\,
	datac => \L_USER_LOGIC|state.pop_before_mem~q\,
	datad => \MEM|Equal2~0_combout\,
	combout => \L_USER_LOGIC|Selector8~0_combout\);

-- Location: FF_X28_Y7_N23
\L_USER_LOGIC|state.pop_before_mem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector8~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.pop_before_mem~q\);

-- Location: LCCOMB_X28_Y7_N28
\L_USER_LOGIC|Selector23~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector23~1_combout\ = (\L_USER_LOGIC|state.pop_before_mem~q\ & ((\Equal1~5_combout\) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	datac => \L_USER_LOGIC|state.pop_before_mem~q\,
	datad => \Equal1~5_combout\,
	combout => \L_USER_LOGIC|Selector23~1_combout\);

-- Location: LCCOMB_X28_Y7_N20
\L_USER_LOGIC|Selector23~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector23~3_combout\ = (\L_USER_LOGIC|Selector23~2_combout\) # ((\L_USER_LOGIC|Selector23~1_combout\) # ((\L_USER_LOGIC|L_USER_LOGIC~9_combout\ & \L_USER_LOGIC|state.top_before_mem~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~9_combout\,
	datab => \L_USER_LOGIC|state.top_before_mem~q\,
	datac => \L_USER_LOGIC|Selector23~2_combout\,
	datad => \L_USER_LOGIC|Selector23~1_combout\,
	combout => \L_USER_LOGIC|Selector23~3_combout\);

-- Location: LCCOMB_X28_Y7_N16
\L_USER_LOGIC|Selector23~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector23~5_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~6_combout\ & ((\L_USER_LOGIC|Selector23~4_combout\) # ((\L_USER_LOGIC|mem_re~q\ & \L_USER_LOGIC|Selector23~3_combout\)))) # (!\L_USER_LOGIC|L_USER_LOGIC~6_combout\ & 
-- (((\L_USER_LOGIC|mem_re~q\ & \L_USER_LOGIC|Selector23~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~6_combout\,
	datab => \L_USER_LOGIC|Selector23~4_combout\,
	datac => \L_USER_LOGIC|mem_re~q\,
	datad => \L_USER_LOGIC|Selector23~3_combout\,
	combout => \L_USER_LOGIC|Selector23~5_combout\);

-- Location: FF_X28_Y7_N17
\L_USER_LOGIC|mem_re\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector23~5_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_re~q\);

-- Location: LCCOMB_X26_Y8_N14
\MEM|re_hold_counter[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|re_hold_counter[1]~0_combout\ = (!\MEM|Equal0~0_combout\ & ((\MEM|we_d~q\) # (!\L_USER_LOGIC|mem_we~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|we_d~q\,
	datac => \MEM|Equal0~0_combout\,
	datad => \L_USER_LOGIC|mem_we~q\,
	combout => \MEM|re_hold_counter[1]~0_combout\);

-- Location: LCCOMB_X26_Y8_N12
\MEM|re_hold_counter[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|re_hold_counter[0]~1_combout\ = (!\MEM|re_hold_counter\(0) & (\MEM|re_hold_counter[1]~0_combout\ & ((\MEM|re_hold_counter\(1)) # (\MEM|re_hold_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|re_hold_counter\(1),
	datab => \MEM|re_hold_counter\(2),
	datac => \MEM|re_hold_counter\(0),
	datad => \MEM|re_hold_counter[1]~0_combout\,
	combout => \MEM|re_hold_counter[0]~1_combout\);

-- Location: FF_X26_Y8_N13
\MEM|re_hold_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|re_hold_counter[0]~1_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|re_hold_counter\(0));

-- Location: LCCOMB_X26_Y8_N16
\MEM|re_hold_counter[1]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|re_hold_counter[1]~4_combout\ = (\MEM|re_hold_counter[1]~0_combout\ & ((\MEM|re_hold_counter\(0) & ((\MEM|re_hold_counter\(1)))) # (!\MEM|re_hold_counter\(0) & (\MEM|re_hold_counter\(2) & !\MEM|re_hold_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|re_hold_counter\(2),
	datab => \MEM|re_hold_counter\(0),
	datac => \MEM|re_hold_counter\(1),
	datad => \MEM|re_hold_counter[1]~0_combout\,
	combout => \MEM|re_hold_counter[1]~4_combout\);

-- Location: FF_X26_Y8_N17
\MEM|re_hold_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|re_hold_counter[1]~4_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|re_hold_counter\(1));

-- Location: LCCOMB_X26_Y8_N20
\MEM|re_hold_counter[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|re_hold_counter[2]~2_combout\ = (\MEM|re_hold_counter\(2) $ (((!\MEM|re_hold_counter\(0) & !\MEM|re_hold_counter\(1))))) # (!\MEM|re_hold_counter[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|re_hold_counter\(2),
	datab => \MEM|re_hold_counter[1]~0_combout\,
	datac => \MEM|re_hold_counter\(0),
	datad => \MEM|re_hold_counter\(1),
	combout => \MEM|re_hold_counter[2]~2_combout\);

-- Location: LCCOMB_X26_Y8_N2
\MEM|re_hold_counter[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|re_hold_counter[2]~3_combout\ = (\MEM|re_hold_counter[2]~2_combout\ & ((\MEM|Equal2~0_combout\) # ((!\MEM|re_d~q\ & \L_USER_LOGIC|mem_re~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|re_d~q\,
	datab => \MEM|Equal2~0_combout\,
	datac => \L_USER_LOGIC|mem_re~q\,
	datad => \MEM|re_hold_counter[2]~2_combout\,
	combout => \MEM|re_hold_counter[2]~3_combout\);

-- Location: FF_X26_Y8_N3
\MEM|re_hold_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|re_hold_counter[2]~3_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|re_hold_counter\(2));

-- Location: LCCOMB_X26_Y8_N10
\MEM|Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|Equal2~0_combout\ = (\MEM|re_hold_counter\(0)) # ((\MEM|re_hold_counter\(2)) # (\MEM|re_hold_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|re_hold_counter\(0),
	datab => \MEM|re_hold_counter\(2),
	datad => \MEM|re_hold_counter\(1),
	combout => \MEM|Equal2~0_combout\);

-- Location: LCCOMB_X27_Y7_N28
\L_USER_LOGIC|L_USER_LOGIC~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~6_combout\ = (!\MEM|Equal2~0_combout\ & (!\MEM|Equal0~0_combout\ & ((!\write_strobe_from_acu_filtered~q\) # (!\cs~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~combout\,
	datab => \write_strobe_from_acu_filtered~q\,
	datac => \MEM|Equal2~0_combout\,
	datad => \MEM|Equal0~0_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~6_combout\);

-- Location: LCCOMB_X27_Y7_N8
\L_USER_LOGIC|adapt_re_ack~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_re_ack~1_combout\ = (!\Equal2~0_combout\ & (\Equal0~0_combout\ & (\L_USER_LOGIC|adapt_re_ack~0_combout\ & \L_USER_LOGIC|L_USER_LOGIC~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Equal0~0_combout\,
	datac => \L_USER_LOGIC|adapt_re_ack~0_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~6_combout\,
	combout => \L_USER_LOGIC|adapt_re_ack~1_combout\);

-- Location: LCCOMB_X28_Y7_N4
\L_USER_LOGIC|Selector11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector11~0_combout\ = (!\L_USER_LOGIC|state.idle~q\ & (\L_USER_LOGIC|stack_is_empty~q\ & \L_USER_LOGIC|adapt_re_ack~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|adapt_re_ack~1_combout\,
	combout => \L_USER_LOGIC|Selector11~0_combout\);

-- Location: FF_X28_Y7_N5
\L_USER_LOGIC|state.top_calc_addr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector11~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.top_calc_addr~q\);

-- Location: FF_X30_Y8_N27
\L_USER_LOGIC|state.push_calc_addr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.push_calc_addr~q\);

-- Location: LCCOMB_X27_Y8_N4
\L_USER_LOGIC|Selector2~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~10_combout\ = (!\L_USER_LOGIC|state.top_calc_addr~q\ & (!\L_USER_LOGIC|state.push_calc_addr~q\ & !\L_USER_LOGIC|state.pop_calc_addr~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|state.top_calc_addr~q\,
	datac => \L_USER_LOGIC|state.push_calc_addr~q\,
	datad => \L_USER_LOGIC|state.pop_calc_addr~q\,
	combout => \L_USER_LOGIC|Selector2~10_combout\);

-- Location: LCCOMB_X30_Y6_N12
\Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (\Equal1~4_combout\ & (!\address_from_acu[0]~input_o\ & \address_from_acu[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal1~4_combout\,
	datac => \address_from_acu[0]~input_o\,
	datad => \address_from_acu[1]~input_o\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X27_Y8_N14
\L_USER_LOGIC|L_USER_LOGIC~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~9_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~11_combout\) # ((\MEM|Equal0~0_combout\) # ((\cs~combout\ & \write_strobe_from_acu_filtered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~11_combout\,
	datab => \cs~combout\,
	datac => \write_strobe_from_acu_filtered~q\,
	datad => \MEM|Equal0~0_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~9_combout\);

-- Location: LCCOMB_X29_Y8_N28
\L_USER_LOGIC|Selector9~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~2_combout\ = (!\L_USER_LOGIC|state.push_before_mem~q\ & \L_USER_LOGIC|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|state.push_before_mem~q\,
	datad => \L_USER_LOGIC|state.idle~q\,
	combout => \L_USER_LOGIC|Selector9~2_combout\);

-- Location: LCCOMB_X29_Y7_N18
\L_USER_LOGIC|Selector13~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector13~0_combout\ = (\L_USER_LOGIC|Selector9~6_combout\ & (((\L_USER_LOGIC|state.top_after_mem~q\ & !\L_USER_LOGIC|Selector9~11_combout\)) # (!\L_USER_LOGIC|L_USER_LOGIC~9_combout\))) # (!\L_USER_LOGIC|Selector9~6_combout\ & 
-- (((\L_USER_LOGIC|state.top_after_mem~q\ & !\L_USER_LOGIC|Selector9~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector9~6_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~9_combout\,
	datac => \L_USER_LOGIC|state.top_after_mem~q\,
	datad => \L_USER_LOGIC|Selector9~11_combout\,
	combout => \L_USER_LOGIC|Selector13~0_combout\);

-- Location: FF_X29_Y7_N19
\L_USER_LOGIC|state.top_after_mem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector13~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.top_after_mem~q\);

-- Location: LCCOMB_X28_Y8_N4
\L_USER_LOGIC|Selector2~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~8_combout\ = (\L_USER_LOGIC|state.pop_after_mem~q\ & (((\L_USER_LOGIC|state.top_before_mem~q\ & !\L_USER_LOGIC|state.pop_before_mem~q\)))) # (!\L_USER_LOGIC|state.pop_after_mem~q\ & ((\L_USER_LOGIC|state.top_after_mem~q\) # 
-- ((\L_USER_LOGIC|state.top_before_mem~q\ & !\L_USER_LOGIC|state.pop_before_mem~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem~q\,
	datab => \L_USER_LOGIC|state.top_after_mem~q\,
	datac => \L_USER_LOGIC|state.top_before_mem~q\,
	datad => \L_USER_LOGIC|state.pop_before_mem~q\,
	combout => \L_USER_LOGIC|Selector2~8_combout\);

-- Location: LCCOMB_X28_Y8_N24
\L_USER_LOGIC|adapt_data_out[15]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[15]~4_combout\ = (!\L_USER_LOGIC|state.top_after_mem~q\ & !\L_USER_LOGIC|state.pop_after_mem~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|state.top_after_mem~q\,
	datac => \L_USER_LOGIC|state.pop_after_mem~q\,
	combout => \L_USER_LOGIC|adapt_data_out[15]~4_combout\);

-- Location: LCCOMB_X27_Y7_N30
\L_USER_LOGIC|Selector2~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~6_combout\ = ((!\read_strobe_from_acu_filtered~q\) # (!\address_from_acu[1]~input_o\)) # (!\Equal1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => \address_from_acu[1]~input_o\,
	datac => \read_strobe_from_acu_filtered~q\,
	combout => \L_USER_LOGIC|Selector2~6_combout\);

-- Location: LCCOMB_X28_Y8_N10
\L_USER_LOGIC|Selector2~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~7_combout\ = (!\L_USER_LOGIC|Selector2~6_combout\ & (((!\L_USER_LOGIC|Selector23~0_combout\) # (!\L_USER_LOGIC|adapt_data_out[15]~4_combout\)) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datab => \L_USER_LOGIC|adapt_data_out[15]~4_combout\,
	datac => \L_USER_LOGIC|Selector2~6_combout\,
	datad => \L_USER_LOGIC|Selector23~0_combout\,
	combout => \L_USER_LOGIC|Selector2~7_combout\);

-- Location: LCCOMB_X28_Y8_N26
\L_USER_LOGIC|Selector2~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~9_combout\ = (\L_USER_LOGIC|state.idle~q\ & (((!\L_USER_LOGIC|Selector2~8_combout\)) # (!\L_USER_LOGIC|L_USER_LOGIC~9_combout\))) # (!\L_USER_LOGIC|state.idle~q\ & (((!\L_USER_LOGIC|Selector2~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~9_combout\,
	datac => \L_USER_LOGIC|Selector2~8_combout\,
	datad => \L_USER_LOGIC|Selector2~7_combout\,
	combout => \L_USER_LOGIC|Selector2~9_combout\);

-- Location: LCCOMB_X29_Y8_N6
\L_USER_LOGIC|Selector2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~4_combout\ = (\L_USER_LOGIC|state.idle~q\ & ((\L_USER_LOGIC|state.pop_before_mem~q\) # (\L_USER_LOGIC|state.pop_after_mem~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_before_mem~q\,
	datac => \L_USER_LOGIC|state.pop_after_mem~q\,
	datad => \L_USER_LOGIC|state.idle~q\,
	combout => \L_USER_LOGIC|Selector2~4_combout\);

-- Location: LCCOMB_X28_Y8_N14
\L_USER_LOGIC|Selector2~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~3_combout\ = ((\MEM|Equal2~0_combout\ & (\L_USER_LOGIC|Selector23~0_combout\)) # (!\MEM|Equal2~0_combout\ & ((\L_USER_LOGIC|adapt_data_out[15]~4_combout\)))) # (!\L_USER_LOGIC|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datab => \L_USER_LOGIC|Selector23~0_combout\,
	datac => \MEM|Equal2~0_combout\,
	datad => \L_USER_LOGIC|adapt_data_out[15]~4_combout\,
	combout => \L_USER_LOGIC|Selector2~3_combout\);

-- Location: LCCOMB_X27_Y7_N16
\L_USER_LOGIC|L_USER_LOGIC~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|L_USER_LOGIC~10_combout\ = ((\address_from_acu[0]~input_o\ & (\Equal1~4_combout\ & \address_from_acu[1]~input_o\))) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address_from_acu[0]~input_o\,
	datab => \Equal1~4_combout\,
	datac => \address_from_acu[1]~input_o\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	combout => \L_USER_LOGIC|L_USER_LOGIC~10_combout\);

-- Location: LCCOMB_X28_Y8_N12
\L_USER_LOGIC|Selector2~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~5_combout\ = (\L_USER_LOGIC|Selector2~2_combout\ & (\L_USER_LOGIC|Selector2~3_combout\ & ((!\L_USER_LOGIC|L_USER_LOGIC~10_combout\) # (!\L_USER_LOGIC|Selector2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector2~2_combout\,
	datab => \L_USER_LOGIC|Selector2~4_combout\,
	datac => \L_USER_LOGIC|Selector2~3_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	combout => \L_USER_LOGIC|Selector2~5_combout\);

-- Location: LCCOMB_X28_Y8_N8
\L_USER_LOGIC|Selector2~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~16_combout\ = (\L_USER_LOGIC|Selector2~12_combout\) # ((!\L_USER_LOGIC|Selector2~15_combout\ & (\L_USER_LOGIC|Selector2~9_combout\ & \L_USER_LOGIC|Selector2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector2~12_combout\,
	datab => \L_USER_LOGIC|Selector2~15_combout\,
	datac => \L_USER_LOGIC|Selector2~9_combout\,
	datad => \L_USER_LOGIC|Selector2~5_combout\,
	combout => \L_USER_LOGIC|Selector2~16_combout\);

-- Location: LCCOMB_X29_Y8_N16
\L_USER_LOGIC|Selector5~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector5~3_combout\ = (\L_USER_LOGIC|Selector5~0_combout\ & !\L_USER_LOGIC|Selector2~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L_USER_LOGIC|Selector5~0_combout\,
	datad => \L_USER_LOGIC|Selector2~16_combout\,
	combout => \L_USER_LOGIC|Selector5~3_combout\);

-- Location: LCCOMB_X29_Y8_N2
\L_USER_LOGIC|Selector5~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector5~4_combout\ = (\L_USER_LOGIC|Selector5~1_combout\ & ((\L_USER_LOGIC|state.push_after_mem~q\) # ((\L_USER_LOGIC|Selector5~2_combout\ & \L_USER_LOGIC|Selector5~3_combout\)))) # (!\L_USER_LOGIC|Selector5~1_combout\ & 
-- (\L_USER_LOGIC|Selector5~2_combout\ & ((\L_USER_LOGIC|Selector5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector5~1_combout\,
	datab => \L_USER_LOGIC|Selector5~2_combout\,
	datac => \L_USER_LOGIC|state.push_after_mem~q\,
	datad => \L_USER_LOGIC|Selector5~3_combout\,
	combout => \L_USER_LOGIC|Selector5~4_combout\);

-- Location: FF_X29_Y8_N3
\L_USER_LOGIC|state.push_after_mem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector5~4_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.push_after_mem~q\);

-- Location: LCCOMB_X29_Y8_N10
\L_USER_LOGIC|Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector6~0_combout\ = (\L_USER_LOGIC|state.push_after_mem~q\ & (!\MEM|Equal0~0_combout\ & \L_USER_LOGIC|Selector5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|state.push_after_mem~q\,
	datac => \MEM|Equal0~0_combout\,
	datad => \L_USER_LOGIC|Selector5~0_combout\,
	combout => \L_USER_LOGIC|Selector6~0_combout\);

-- Location: LCCOMB_X29_Y8_N12
\L_USER_LOGIC|Selector6~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector6~1_combout\ = (\L_USER_LOGIC|Selector2~16_combout\ & (((\L_USER_LOGIC|state.push_after_mem2~q\ & \L_USER_LOGIC|Selector5~1_combout\)))) # (!\L_USER_LOGIC|Selector2~16_combout\ & ((\L_USER_LOGIC|Selector6~0_combout\) # 
-- ((\L_USER_LOGIC|state.push_after_mem2~q\ & \L_USER_LOGIC|Selector5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector2~16_combout\,
	datab => \L_USER_LOGIC|Selector6~0_combout\,
	datac => \L_USER_LOGIC|state.push_after_mem2~q\,
	datad => \L_USER_LOGIC|Selector5~1_combout\,
	combout => \L_USER_LOGIC|Selector6~1_combout\);

-- Location: FF_X29_Y8_N13
\L_USER_LOGIC|state.push_after_mem2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector6~1_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.push_after_mem2~q\);

-- Location: LCCOMB_X30_Y7_N10
\L_USER_LOGIC|Selector14~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~9_combout\ = (\L_USER_LOGIC|state.top_before_mem~q\ & (!\L_USER_LOGIC|state.push_after_mem2~q\ & ((\Equal2~0_combout\) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.top_before_mem~q\,
	datab => \Equal2~0_combout\,
	datac => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	datad => \L_USER_LOGIC|state.push_after_mem2~q\,
	combout => \L_USER_LOGIC|Selector14~9_combout\);

-- Location: LCCOMB_X27_Y7_N18
\L_USER_LOGIC|Selector14~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~13_combout\ = (\L_USER_LOGIC|state.top_before_mem~q\ & (((\MEM|Equal2~0_combout\)))) # (!\L_USER_LOGIC|state.top_before_mem~q\ & (\L_USER_LOGIC|state.pop_before_mem~q\ & ((\MEM|Equal2~0_combout\) # 
-- (\L_USER_LOGIC|L_USER_LOGIC~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.top_before_mem~q\,
	datab => \L_USER_LOGIC|state.pop_before_mem~q\,
	datac => \MEM|Equal2~0_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	combout => \L_USER_LOGIC|Selector14~13_combout\);

-- Location: LCCOMB_X29_Y7_N26
\L_USER_LOGIC|Selector14~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~14_combout\ = (\L_USER_LOGIC|Selector9~5_combout\) # ((\L_USER_LOGIC|Selector14~9_combout\) # ((!\L_USER_LOGIC|state.push_after_mem2~q\ & \L_USER_LOGIC|Selector14~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector9~5_combout\,
	datab => \L_USER_LOGIC|state.push_after_mem2~q\,
	datac => \L_USER_LOGIC|Selector14~9_combout\,
	datad => \L_USER_LOGIC|Selector14~13_combout\,
	combout => \L_USER_LOGIC|Selector14~14_combout\);

-- Location: LCCOMB_X29_Y7_N8
\L_USER_LOGIC|Selector14~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~6_combout\ = (!\L_USER_LOGIC|Selector14~5_combout\ & (\L_USER_LOGIC|state.idle~q\ & !\L_USER_LOGIC|Selector5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector14~5_combout\,
	datab => \L_USER_LOGIC|state.idle~q\,
	datad => \L_USER_LOGIC|Selector5~0_combout\,
	combout => \L_USER_LOGIC|Selector14~6_combout\);

-- Location: LCCOMB_X27_Y8_N22
\L_USER_LOGIC|Selector9~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~3_combout\ = (\L_USER_LOGIC|state.idle~q\ & (((!\L_USER_LOGIC|Selector5~2_combout\)))) # (!\L_USER_LOGIC|state.idle~q\ & (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (\L_USER_LOGIC|Selector2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datac => \L_USER_LOGIC|Selector2~6_combout\,
	datad => \L_USER_LOGIC|Selector5~2_combout\,
	combout => \L_USER_LOGIC|Selector9~3_combout\);

-- Location: LCCOMB_X27_Y8_N8
\L_USER_LOGIC|Selector9~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~4_combout\ = (\L_USER_LOGIC|Selector2~10_combout\ & (\L_USER_LOGIC|Selector9~3_combout\ & ((\L_USER_LOGIC|Selector1~1_combout\) # (!\L_USER_LOGIC|Selector2~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector1~1_combout\,
	datab => \L_USER_LOGIC|Selector2~10_combout\,
	datac => \L_USER_LOGIC|Selector9~3_combout\,
	datad => \L_USER_LOGIC|Selector2~14_combout\,
	combout => \L_USER_LOGIC|Selector9~4_combout\);

-- Location: LCCOMB_X29_Y8_N0
\L_USER_LOGIC|Selector14~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~12_combout\ = (!\L_USER_LOGIC|state.push_before_mem~q\ & (\L_USER_LOGIC|state.push_after_mem~q\ & (!\MEM|Equal0~0_combout\ & \L_USER_LOGIC|state.idle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_before_mem~q\,
	datab => \L_USER_LOGIC|state.push_after_mem~q\,
	datac => \MEM|Equal0~0_combout\,
	datad => \L_USER_LOGIC|state.idle~q\,
	combout => \L_USER_LOGIC|Selector14~12_combout\);

-- Location: LCCOMB_X29_Y7_N6
\L_USER_LOGIC|Selector14~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~7_combout\ = (\L_USER_LOGIC|Selector14~12_combout\) # ((\L_USER_LOGIC|state.pop_after_mem~q\ & ((\L_USER_LOGIC|L_USER_LOGIC~10_combout\) # (!\MEM|Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem~q\,
	datab => \MEM|Equal2~0_combout\,
	datac => \L_USER_LOGIC|Selector14~12_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	combout => \L_USER_LOGIC|Selector14~7_combout\);

-- Location: LCCOMB_X29_Y7_N20
\L_USER_LOGIC|Selector14~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~8_combout\ = (\L_USER_LOGIC|Selector14~4_combout\) # ((\L_USER_LOGIC|Selector14~6_combout\) # ((\L_USER_LOGIC|Selector14~7_combout\) # (!\L_USER_LOGIC|Selector9~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector14~4_combout\,
	datab => \L_USER_LOGIC|Selector14~6_combout\,
	datac => \L_USER_LOGIC|Selector9~4_combout\,
	datad => \L_USER_LOGIC|Selector14~7_combout\,
	combout => \L_USER_LOGIC|Selector14~8_combout\);

-- Location: LCCOMB_X29_Y7_N2
\L_USER_LOGIC|Selector14~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~10_combout\ = (\L_USER_LOGIC|Selector14~8_combout\) # ((!\L_USER_LOGIC|state.push_after_mem~q\ & (\L_USER_LOGIC|Selector9~2_combout\ & \L_USER_LOGIC|Selector14~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_after_mem~q\,
	datab => \L_USER_LOGIC|Selector9~2_combout\,
	datac => \L_USER_LOGIC|Selector14~14_combout\,
	datad => \L_USER_LOGIC|Selector14~8_combout\,
	combout => \L_USER_LOGIC|Selector14~10_combout\);

-- Location: LCCOMB_X29_Y7_N14
\L_USER_LOGIC|Selector14~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector14~11_combout\ = (\L_USER_LOGIC|Selector14~4_combout\ & (((\L_USER_LOGIC|state.top_after_mem2~q\ & !\L_USER_LOGIC|Selector14~10_combout\)) # (!\L_USER_LOGIC|L_USER_LOGIC~9_combout\))) # (!\L_USER_LOGIC|Selector14~4_combout\ & 
-- (((\L_USER_LOGIC|state.top_after_mem2~q\ & !\L_USER_LOGIC|Selector14~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector14~4_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~9_combout\,
	datac => \L_USER_LOGIC|state.top_after_mem2~q\,
	datad => \L_USER_LOGIC|Selector14~10_combout\,
	combout => \L_USER_LOGIC|Selector14~11_combout\);

-- Location: FF_X29_Y7_N15
\L_USER_LOGIC|state.top_after_mem2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector14~11_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.top_after_mem2~q\);

-- Location: LCCOMB_X27_Y8_N18
\L_USER_LOGIC|Selector2~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~13_combout\ = ((\Equal1~5_combout\ & ((\Equal2~0_combout\) # (!\L_USER_LOGIC|state.top_after_mem2~q\))) # (!\Equal1~5_combout\ & ((\L_USER_LOGIC|state.top_after_mem2~q\) # (!\Equal2~0_combout\)))) # (!\Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~5_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal2~0_combout\,
	datad => \L_USER_LOGIC|state.top_after_mem2~q\,
	combout => \L_USER_LOGIC|Selector2~13_combout\);

-- Location: LCCOMB_X27_Y8_N0
\L_USER_LOGIC|Selector2~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~14_combout\ = (\MEM|Equal0~0_combout\) # ((\L_USER_LOGIC|Selector2~13_combout\) # ((\cs~combout\ & \write_strobe_from_acu_filtered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~combout\,
	datab => \MEM|Equal0~0_combout\,
	datac => \write_strobe_from_acu_filtered~q\,
	datad => \L_USER_LOGIC|Selector2~13_combout\,
	combout => \L_USER_LOGIC|Selector2~14_combout\);

-- Location: LCCOMB_X28_Y8_N0
\L_USER_LOGIC|Selector2~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~15_combout\ = ((\L_USER_LOGIC|Selector2~0_combout\) # ((!\L_USER_LOGIC|Selector1~1_combout\ & \L_USER_LOGIC|Selector2~14_combout\))) # (!\L_USER_LOGIC|Selector2~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector1~1_combout\,
	datab => \L_USER_LOGIC|Selector2~10_combout\,
	datac => \L_USER_LOGIC|Selector2~14_combout\,
	datad => \L_USER_LOGIC|Selector2~0_combout\,
	combout => \L_USER_LOGIC|Selector2~15_combout\);

-- Location: LCCOMB_X28_Y8_N2
\L_USER_LOGIC|Selector5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector5~1_combout\ = (!\L_USER_LOGIC|Selector2~12_combout\ & (!\L_USER_LOGIC|Selector2~15_combout\ & (\L_USER_LOGIC|Selector2~9_combout\ & \L_USER_LOGIC|Selector2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector2~12_combout\,
	datab => \L_USER_LOGIC|Selector2~15_combout\,
	datac => \L_USER_LOGIC|Selector2~9_combout\,
	datad => \L_USER_LOGIC|Selector2~5_combout\,
	combout => \L_USER_LOGIC|Selector5~1_combout\);

-- Location: LCCOMB_X27_Y8_N20
\L_USER_LOGIC|Selector2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~1_combout\ = ((\L_USER_LOGIC|state.top_after_mem2~q\ & ((\Equal2~0_combout\))) # (!\L_USER_LOGIC|state.top_after_mem2~q\ & (\Equal1~5_combout\))) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~5_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	datac => \Equal2~0_combout\,
	datad => \L_USER_LOGIC|state.top_after_mem2~q\,
	combout => \L_USER_LOGIC|Selector2~1_combout\);

-- Location: LCCOMB_X28_Y8_N28
\L_USER_LOGIC|Selector2~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~11_combout\ = ((\L_USER_LOGIC|Selector2~1_combout\) # ((!\L_USER_LOGIC|Selector2~5_combout\) # (!\L_USER_LOGIC|Selector2~9_combout\))) # (!\L_USER_LOGIC|Selector2~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector2~10_combout\,
	datab => \L_USER_LOGIC|Selector2~1_combout\,
	datac => \L_USER_LOGIC|Selector2~9_combout\,
	datad => \L_USER_LOGIC|Selector2~5_combout\,
	combout => \L_USER_LOGIC|Selector2~11_combout\);

-- Location: LCCOMB_X28_Y8_N18
\L_USER_LOGIC|Selector2~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~17_combout\ = (\L_USER_LOGIC|Selector2~16_combout\ & (!\L_USER_LOGIC|Selector5~0_combout\ & ((!\L_USER_LOGIC|Selector5~1_combout\)))) # (!\L_USER_LOGIC|Selector2~16_combout\ & (((\L_USER_LOGIC|Selector2~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector5~0_combout\,
	datab => \L_USER_LOGIC|Selector2~11_combout\,
	datac => \L_USER_LOGIC|Selector2~16_combout\,
	datad => \L_USER_LOGIC|Selector5~1_combout\,
	combout => \L_USER_LOGIC|Selector2~17_combout\);

-- Location: LCCOMB_X28_Y8_N20
\L_USER_LOGIC|Selector2~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector2~18_combout\ = (\L_USER_LOGIC|Selector2~17_combout\) # ((\L_USER_LOGIC|Selector5~1_combout\ & \L_USER_LOGIC|state.idle~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|Selector5~1_combout\,
	datac => \L_USER_LOGIC|state.idle~q\,
	datad => \L_USER_LOGIC|Selector2~17_combout\,
	combout => \L_USER_LOGIC|Selector2~18_combout\);

-- Location: FF_X28_Y8_N21
\L_USER_LOGIC|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector2~18_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.idle~q\);

-- Location: LCCOMB_X28_Y8_N22
\L_USER_LOGIC|adapt_data_out[15]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[15]~2_combout\ = ((\L_USER_LOGIC|state.top_after_mem~q\ & (\Equal2~0_combout\)) # (!\L_USER_LOGIC|state.top_after_mem~q\ & ((\Equal1~5_combout\)))) # (!\Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal2~0_combout\,
	datac => \L_USER_LOGIC|state.top_after_mem~q\,
	datad => \Equal1~5_combout\,
	combout => \L_USER_LOGIC|adapt_data_out[15]~2_combout\);

-- Location: LCCOMB_X27_Y8_N30
\L_USER_LOGIC|adapt_data_out[15]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[15]~3_combout\ = (\MEM|Equal0~0_combout\) # ((\L_USER_LOGIC|adapt_data_out[15]~2_combout\) # ((\cs~combout\ & \write_strobe_from_acu_filtered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~combout\,
	datab => \MEM|Equal0~0_combout\,
	datac => \write_strobe_from_acu_filtered~q\,
	datad => \L_USER_LOGIC|adapt_data_out[15]~2_combout\,
	combout => \L_USER_LOGIC|adapt_data_out[15]~3_combout\);

-- Location: LCCOMB_X29_Y7_N28
\L_USER_LOGIC|Selector9~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~7_combout\ = (\L_USER_LOGIC|Selector14~5_combout\ & (((\L_USER_LOGIC|adapt_data_out[15]~3_combout\)) # (!\MEM|Equal2~0_combout\))) # (!\L_USER_LOGIC|Selector14~5_combout\ & (((!\L_USER_LOGIC|Selector5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector14~5_combout\,
	datab => \MEM|Equal2~0_combout\,
	datac => \L_USER_LOGIC|adapt_data_out[15]~3_combout\,
	datad => \L_USER_LOGIC|Selector5~0_combout\,
	combout => \L_USER_LOGIC|Selector9~7_combout\);

-- Location: LCCOMB_X29_Y7_N4
\L_USER_LOGIC|Selector9~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~14_combout\ = (\L_USER_LOGIC|state.idle~q\ & (\L_USER_LOGIC|Selector9~7_combout\ & ((\L_USER_LOGIC|state.pop_after_mem~q\) # (\L_USER_LOGIC|state.top_after_mem~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem~q\,
	datab => \L_USER_LOGIC|state.idle~q\,
	datac => \L_USER_LOGIC|state.top_after_mem~q\,
	datad => \L_USER_LOGIC|Selector9~7_combout\,
	combout => \L_USER_LOGIC|Selector9~14_combout\);

-- Location: LCCOMB_X29_Y8_N30
\L_USER_LOGIC|Selector9~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~5_combout\ = (\L_USER_LOGIC|state.push_after_mem2~q\ & (((\address_from_acu[1]~input_o\) # (!\address_from_acu[0]~input_o\)) # (!\Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => \address_from_acu[1]~input_o\,
	datac => \address_from_acu[0]~input_o\,
	datad => \L_USER_LOGIC|state.push_after_mem2~q\,
	combout => \L_USER_LOGIC|Selector9~5_combout\);

-- Location: LCCOMB_X29_Y7_N30
\L_USER_LOGIC|Selector9~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~8_combout\ = (\L_USER_LOGIC|Selector9~2_combout\ & ((\L_USER_LOGIC|state.push_after_mem~q\ & ((!\MEM|Equal0~0_combout\))) # (!\L_USER_LOGIC|state.push_after_mem~q\ & (\L_USER_LOGIC|Selector9~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.push_after_mem~q\,
	datab => \L_USER_LOGIC|Selector9~2_combout\,
	datac => \L_USER_LOGIC|Selector9~5_combout\,
	datad => \MEM|Equal0~0_combout\,
	combout => \L_USER_LOGIC|Selector9~8_combout\);

-- Location: LCCOMB_X29_Y7_N16
\L_USER_LOGIC|Selector9~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~9_combout\ = (\L_USER_LOGIC|Selector9~8_combout\) # ((!\L_USER_LOGIC|Selector14~5_combout\ & (\L_USER_LOGIC|state.idle~q\ & !\L_USER_LOGIC|Selector5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector14~5_combout\,
	datab => \L_USER_LOGIC|state.idle~q\,
	datac => \L_USER_LOGIC|Selector9~8_combout\,
	datad => \L_USER_LOGIC|Selector5~0_combout\,
	combout => \L_USER_LOGIC|Selector9~9_combout\);

-- Location: LCCOMB_X29_Y7_N10
\L_USER_LOGIC|Selector9~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~10_combout\ = (\L_USER_LOGIC|Selector9~9_combout\) # ((\L_USER_LOGIC|state.pop_before_mem~q\ & ((\L_USER_LOGIC|L_USER_LOGIC~10_combout\) # (\MEM|Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|L_USER_LOGIC~10_combout\,
	datab => \L_USER_LOGIC|state.pop_before_mem~q\,
	datac => \MEM|Equal2~0_combout\,
	datad => \L_USER_LOGIC|Selector9~9_combout\,
	combout => \L_USER_LOGIC|Selector9~10_combout\);

-- Location: LCCOMB_X29_Y7_N24
\L_USER_LOGIC|Selector9~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~11_combout\ = (\L_USER_LOGIC|Selector9~6_combout\) # ((\L_USER_LOGIC|Selector9~14_combout\) # ((\L_USER_LOGIC|Selector9~10_combout\) # (!\L_USER_LOGIC|Selector9~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector9~6_combout\,
	datab => \L_USER_LOGIC|Selector9~14_combout\,
	datac => \L_USER_LOGIC|Selector9~4_combout\,
	datad => \L_USER_LOGIC|Selector9~10_combout\,
	combout => \L_USER_LOGIC|Selector9~11_combout\);

-- Location: LCCOMB_X29_Y7_N12
\L_USER_LOGIC|Selector9~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector9~13_combout\ = (\L_USER_LOGIC|Selector9~12_combout\) # ((\L_USER_LOGIC|state.pop_after_mem~q\ & !\L_USER_LOGIC|Selector9~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector9~12_combout\,
	datac => \L_USER_LOGIC|state.pop_after_mem~q\,
	datad => \L_USER_LOGIC|Selector9~11_combout\,
	combout => \L_USER_LOGIC|Selector9~13_combout\);

-- Location: FF_X29_Y7_N13
\L_USER_LOGIC|state.pop_after_mem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector9~13_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.pop_after_mem~q\);

-- Location: LCCOMB_X27_Y8_N26
\L_USER_LOGIC|Selector10~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector10~0_combout\ = (!\MEM|Equal2~0_combout\ & (!\Equal1~5_combout\ & (\L_USER_LOGIC|state.pop_after_mem~q\ & \L_USER_LOGIC|L_USER_LOGIC~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|Equal2~0_combout\,
	datab => \Equal1~5_combout\,
	datac => \L_USER_LOGIC|state.pop_after_mem~q\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	combout => \L_USER_LOGIC|Selector10~0_combout\);

-- Location: LCCOMB_X30_Y7_N12
\L_USER_LOGIC|stack_pointer[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[1]~2_combout\ = (!\L_USER_LOGIC|stack_pointer[1]~0_combout\ & (((\L_USER_LOGIC|Selector16~0_combout\ & !\L_USER_LOGIC|stack_pointer\(0))) # (!\L_USER_LOGIC|Selector10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector16~0_combout\,
	datab => \L_USER_LOGIC|stack_pointer\(0),
	datac => \L_USER_LOGIC|Selector10~0_combout\,
	datad => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	combout => \L_USER_LOGIC|stack_pointer[1]~2_combout\);

-- Location: LCCOMB_X30_Y6_N18
\L_USER_LOGIC|Add1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add1~2_combout\ = (\L_USER_LOGIC|stack_pointer\(1) & (\L_USER_LOGIC|Add1~1\ & VCC)) # (!\L_USER_LOGIC|stack_pointer\(1) & (!\L_USER_LOGIC|Add1~1\))
-- \L_USER_LOGIC|Add1~3\ = CARRY((!\L_USER_LOGIC|stack_pointer\(1) & !\L_USER_LOGIC|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|stack_pointer\(1),
	datad => VCC,
	cin => \L_USER_LOGIC|Add1~1\,
	combout => \L_USER_LOGIC|Add1~2_combout\,
	cout => \L_USER_LOGIC|Add1~3\);

-- Location: LCCOMB_X31_Y7_N10
\L_USER_LOGIC|stack_pointer[1]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[1]~6_combout\ = (\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (((\L_USER_LOGIC|stack_pointer\(1))))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (\L_USER_LOGIC|stack_is_empty~q\ & (\L_USER_LOGIC|stack_pointer\(0) $ 
-- (\L_USER_LOGIC|stack_pointer\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_is_empty~q\,
	datab => \L_USER_LOGIC|stack_pointer\(0),
	datac => \L_USER_LOGIC|stack_pointer\(1),
	datad => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	combout => \L_USER_LOGIC|stack_pointer[1]~6_combout\);

-- Location: LCCOMB_X31_Y7_N20
\L_USER_LOGIC|stack_pointer[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[1]~7_combout\ = (\L_USER_LOGIC|state.pop_after_mem~q\ & ((\L_USER_LOGIC|stack_pointer[1]~2_combout\ & ((\L_USER_LOGIC|stack_pointer[1]~6_combout\))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & 
-- (\L_USER_LOGIC|Add1~2_combout\)))) # (!\L_USER_LOGIC|state.pop_after_mem~q\ & (((\L_USER_LOGIC|stack_pointer[1]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.pop_after_mem~q\,
	datab => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	datac => \L_USER_LOGIC|Add1~2_combout\,
	datad => \L_USER_LOGIC|stack_pointer[1]~6_combout\,
	combout => \L_USER_LOGIC|stack_pointer[1]~7_combout\);

-- Location: FF_X31_Y7_N21
\L_USER_LOGIC|stack_pointer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|stack_pointer[1]~7_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|stack_pointer\(1));

-- Location: LCCOMB_X30_Y6_N20
\L_USER_LOGIC|Add1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add1~4_combout\ = (\L_USER_LOGIC|stack_pointer\(2) & ((GND) # (!\L_USER_LOGIC|Add1~3\))) # (!\L_USER_LOGIC|stack_pointer\(2) & (\L_USER_LOGIC|Add1~3\ $ (GND)))
-- \L_USER_LOGIC|Add1~5\ = CARRY((\L_USER_LOGIC|stack_pointer\(2)) # (!\L_USER_LOGIC|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(2),
	datad => VCC,
	cin => \L_USER_LOGIC|Add1~3\,
	combout => \L_USER_LOGIC|Add1~4_combout\,
	cout => \L_USER_LOGIC|Add1~5\);

-- Location: LCCOMB_X30_Y6_N22
\L_USER_LOGIC|Add1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add1~6_combout\ = (\L_USER_LOGIC|stack_pointer\(3) & (\L_USER_LOGIC|Add1~5\ & VCC)) # (!\L_USER_LOGIC|stack_pointer\(3) & (!\L_USER_LOGIC|Add1~5\))
-- \L_USER_LOGIC|Add1~7\ = CARRY((!\L_USER_LOGIC|stack_pointer\(3) & !\L_USER_LOGIC|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|stack_pointer\(3),
	datad => VCC,
	cin => \L_USER_LOGIC|Add1~5\,
	combout => \L_USER_LOGIC|Add1~6_combout\,
	cout => \L_USER_LOGIC|Add1~7\);

-- Location: LCCOMB_X30_Y6_N2
\L_USER_LOGIC|stack_pointer[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[2]~4_combout\ = (\L_USER_LOGIC|state.pop_after_mem~q\ & (((\L_USER_LOGIC|Add1~4_combout\)))) # (!\L_USER_LOGIC|state.pop_after_mem~q\ & (\L_USER_LOGIC|Add0~1_combout\ & (\L_USER_LOGIC|stack_is_empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Add0~1_combout\,
	datab => \L_USER_LOGIC|state.pop_after_mem~q\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|Add1~4_combout\,
	combout => \L_USER_LOGIC|stack_pointer[2]~4_combout\);

-- Location: LCCOMB_X30_Y7_N16
\L_USER_LOGIC|stack_pointer[2]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[2]~5_combout\ = (\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (\L_USER_LOGIC|stack_pointer\(2))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & ((\L_USER_LOGIC|stack_pointer[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	datac => \L_USER_LOGIC|stack_pointer\(2),
	datad => \L_USER_LOGIC|stack_pointer[2]~4_combout\,
	combout => \L_USER_LOGIC|stack_pointer[2]~5_combout\);

-- Location: FF_X30_Y7_N17
\L_USER_LOGIC|stack_pointer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|stack_pointer[2]~5_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|stack_pointer\(2));

-- Location: LCCOMB_X30_Y6_N30
\L_USER_LOGIC|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add0~0_combout\ = \L_USER_LOGIC|stack_pointer\(3) $ (((\L_USER_LOGIC|stack_pointer\(0) & (\L_USER_LOGIC|stack_pointer\(1) & \L_USER_LOGIC|stack_pointer\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(0),
	datab => \L_USER_LOGIC|stack_pointer\(1),
	datac => \L_USER_LOGIC|stack_pointer\(3),
	datad => \L_USER_LOGIC|stack_pointer\(2),
	combout => \L_USER_LOGIC|Add0~0_combout\);

-- Location: LCCOMB_X30_Y6_N0
\L_USER_LOGIC|stack_pointer[3]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[3]~1_combout\ = (\L_USER_LOGIC|state.pop_after_mem~q\ & (((\L_USER_LOGIC|Add1~6_combout\)))) # (!\L_USER_LOGIC|state.pop_after_mem~q\ & (\L_USER_LOGIC|stack_is_empty~q\ & ((\L_USER_LOGIC|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_is_empty~q\,
	datab => \L_USER_LOGIC|state.pop_after_mem~q\,
	datac => \L_USER_LOGIC|Add1~6_combout\,
	datad => \L_USER_LOGIC|Add0~0_combout\,
	combout => \L_USER_LOGIC|stack_pointer[3]~1_combout\);

-- Location: LCCOMB_X30_Y7_N6
\L_USER_LOGIC|stack_pointer[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[3]~3_combout\ = (\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (\L_USER_LOGIC|stack_pointer\(3))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & ((\L_USER_LOGIC|stack_pointer[3]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	datac => \L_USER_LOGIC|stack_pointer\(3),
	datad => \L_USER_LOGIC|stack_pointer[3]~1_combout\,
	combout => \L_USER_LOGIC|stack_pointer[3]~3_combout\);

-- Location: FF_X30_Y7_N7
\L_USER_LOGIC|stack_pointer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|stack_pointer[3]~3_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|stack_pointer\(3));

-- Location: LCCOMB_X31_Y7_N14
\L_USER_LOGIC|adapt_we_ack~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_we_ack~0_combout\ = (\L_USER_LOGIC|stack_pointer\(2) & (\L_USER_LOGIC|stack_pointer\(1) & (\L_USER_LOGIC|stack_pointer\(3) & \L_USER_LOGIC|stack_pointer\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(2),
	datab => \L_USER_LOGIC|stack_pointer\(1),
	datac => \L_USER_LOGIC|stack_pointer\(3),
	datad => \L_USER_LOGIC|stack_pointer\(0),
	combout => \L_USER_LOGIC|adapt_we_ack~0_combout\);

-- Location: LCCOMB_X30_Y6_N24
\L_USER_LOGIC|Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add1~8_combout\ = \L_USER_LOGIC|stack_pointer\(4) $ (\L_USER_LOGIC|Add1~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|stack_pointer\(4),
	cin => \L_USER_LOGIC|Add1~7\,
	combout => \L_USER_LOGIC|Add1~8_combout\);

-- Location: LCCOMB_X30_Y7_N24
\L_USER_LOGIC|stack_pointer[4]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[4]~10_combout\ = (\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (((\L_USER_LOGIC|stack_pointer\(4))))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (\L_USER_LOGIC|stack_is_empty~q\ & (\L_USER_LOGIC|adapt_we_ack~0_combout\ $ 
-- (\L_USER_LOGIC|stack_pointer\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|adapt_we_ack~0_combout\,
	datab => \L_USER_LOGIC|stack_pointer\(4),
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	combout => \L_USER_LOGIC|stack_pointer[4]~10_combout\);

-- Location: LCCOMB_X30_Y7_N28
\L_USER_LOGIC|stack_pointer[4]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[4]~11_combout\ = (\L_USER_LOGIC|stack_pointer[1]~2_combout\ & (((\L_USER_LOGIC|stack_pointer[4]~10_combout\)))) # (!\L_USER_LOGIC|stack_pointer[1]~2_combout\ & ((\L_USER_LOGIC|state.pop_after_mem~q\ & 
-- (\L_USER_LOGIC|Add1~8_combout\)) # (!\L_USER_LOGIC|state.pop_after_mem~q\ & ((\L_USER_LOGIC|stack_pointer[4]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer[1]~2_combout\,
	datab => \L_USER_LOGIC|state.pop_after_mem~q\,
	datac => \L_USER_LOGIC|Add1~8_combout\,
	datad => \L_USER_LOGIC|stack_pointer[4]~10_combout\,
	combout => \L_USER_LOGIC|stack_pointer[4]~11_combout\);

-- Location: FF_X30_Y7_N29
\L_USER_LOGIC|stack_pointer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|stack_pointer[4]~11_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|stack_pointer\(4));

-- Location: LCCOMB_X31_Y7_N8
\L_USER_LOGIC|adapt_we_ack~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_we_ack~1_combout\ = (\L_USER_LOGIC|stack_is_empty~q\ & (\L_USER_LOGIC|adapt_we_ack~0_combout\ & \L_USER_LOGIC|stack_pointer\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_is_empty~q\,
	datac => \L_USER_LOGIC|adapt_we_ack~0_combout\,
	datad => \L_USER_LOGIC|stack_pointer\(4),
	combout => \L_USER_LOGIC|adapt_we_ack~1_combout\);

-- Location: LCCOMB_X30_Y8_N4
\L_USER_LOGIC|stack_pointer[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|stack_pointer[1]~0_combout\ = (\L_USER_LOGIC|Selector5~0_combout\ & (\L_USER_LOGIC|Selector2~0_combout\ & (!\L_USER_LOGIC|adapt_we_ack~1_combout\ & !\MEM|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector5~0_combout\,
	datab => \L_USER_LOGIC|Selector2~0_combout\,
	datac => \L_USER_LOGIC|adapt_we_ack~1_combout\,
	datad => \MEM|Equal0~0_combout\,
	combout => \L_USER_LOGIC|stack_pointer[1]~0_combout\);

-- Location: FF_X30_Y8_N11
\L_USER_LOGIC|mem_data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[2]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(2));

-- Location: LCCOMB_X29_Y9_N12
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[2]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(2),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[2]~feeder_combout\);

-- Location: FF_X29_Y9_N13
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[2]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2));

-- Location: LCCOMB_X29_Y9_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[8]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[8]~feeder_combout\);

-- Location: FF_X29_Y9_N25
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[8]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(8));

-- Location: LCCOMB_X26_Y8_N18
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(8),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36feeder_combout\);

-- Location: LCCOMB_X26_Y7_N28
\L_USER_LOGIC|mem_addr~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~10_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (\L_USER_LOGIC|stack_is_empty~q\ & (\L_USER_LOGIC|Add0~0_combout\))) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (((\L_USER_LOGIC|stack_pointer\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_is_empty~q\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datac => \L_USER_LOGIC|Add0~0_combout\,
	datad => \L_USER_LOGIC|stack_pointer\(3),
	combout => \L_USER_LOGIC|mem_addr~10_combout\);

-- Location: LCCOMB_X26_Y7_N8
\L_USER_LOGIC|mem_addr~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~3_combout\ = (\L_USER_LOGIC|mem_addr~0_combout\) # (((\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & !\L_USER_LOGIC|L_USER_LOGIC~7_combout\)) # (!\read_strobe_from_acu_filtered~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr~0_combout\,
	datab => \read_strobe_from_acu_filtered~q\,
	datac => \L_USER_LOGIC|L_USER_LOGIC~5_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~7_combout\,
	combout => \L_USER_LOGIC|mem_addr~3_combout\);

-- Location: LCCOMB_X26_Y7_N12
\L_USER_LOGIC|Selector15~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~11_combout\ = (\Equal2~0_combout\ & (((!\read_strobe_from_acu_filtered~q\)))) # (!\Equal2~0_combout\ & (((!\L_USER_LOGIC|L_USER_LOGIC~6_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \read_strobe_from_acu_filtered~q\,
	datac => \Equal2~0_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~6_combout\,
	combout => \L_USER_LOGIC|Selector15~11_combout\);

-- Location: LCCOMB_X26_Y7_N16
\L_USER_LOGIC|Selector15~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector15~12_combout\ = (\L_USER_LOGIC|stack_is_empty~q\ & !\L_USER_LOGIC|Selector15~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|Selector15~11_combout\,
	combout => \L_USER_LOGIC|Selector15~12_combout\);

-- Location: LCCOMB_X26_Y7_N18
\L_USER_LOGIC|mem_addr~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~4_combout\ = (\L_USER_LOGIC|mem_addr~2_combout\) # ((!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & ((\L_USER_LOGIC|mem_addr~3_combout\) # (!\L_USER_LOGIC|Selector15~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr~2_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datac => \L_USER_LOGIC|mem_addr~3_combout\,
	datad => \L_USER_LOGIC|Selector15~12_combout\,
	combout => \L_USER_LOGIC|mem_addr~4_combout\);

-- Location: LCCOMB_X26_Y7_N14
\L_USER_LOGIC|mem_addr~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~11_combout\ = (\L_USER_LOGIC|mem_addr~4_combout\ & ((\L_USER_LOGIC|mem_addr\(3)))) # (!\L_USER_LOGIC|mem_addr~4_combout\ & (\L_USER_LOGIC|mem_addr~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|mem_addr~10_combout\,
	datac => \L_USER_LOGIC|mem_addr\(3),
	datad => \L_USER_LOGIC|mem_addr~4_combout\,
	combout => \L_USER_LOGIC|mem_addr~11_combout\);

-- Location: FF_X26_Y7_N15
\L_USER_LOGIC|mem_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_addr~11_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_addr\(3));

-- Location: LCCOMB_X27_Y7_N10
\L_USER_LOGIC|mem_addr~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~1_combout\ = (\L_USER_LOGIC|stack_pointer\(0) & ((!\L_USER_LOGIC|L_USER_LOGIC~8_combout\))) # (!\L_USER_LOGIC|stack_pointer\(0) & (\L_USER_LOGIC|stack_is_empty~q\ & \L_USER_LOGIC|L_USER_LOGIC~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(0),
	datab => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	combout => \L_USER_LOGIC|mem_addr~1_combout\);

-- Location: LCCOMB_X26_Y7_N4
\L_USER_LOGIC|mem_addr~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~5_combout\ = (\L_USER_LOGIC|mem_addr~4_combout\ & (\L_USER_LOGIC|mem_addr\(0))) # (!\L_USER_LOGIC|mem_addr~4_combout\ & ((\L_USER_LOGIC|mem_addr~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr\(0),
	datab => \L_USER_LOGIC|mem_addr~1_combout\,
	datad => \L_USER_LOGIC|mem_addr~4_combout\,
	combout => \L_USER_LOGIC|mem_addr~5_combout\);

-- Location: FF_X26_Y7_N21
\L_USER_LOGIC|mem_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr~5_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_addr\(0));

-- Location: LCCOMB_X31_Y7_N24
\L_USER_LOGIC|Add0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Add0~1_combout\ = \L_USER_LOGIC|stack_pointer\(2) $ (((\L_USER_LOGIC|stack_pointer\(1) & \L_USER_LOGIC|stack_pointer\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(2),
	datac => \L_USER_LOGIC|stack_pointer\(1),
	datad => \L_USER_LOGIC|stack_pointer\(0),
	combout => \L_USER_LOGIC|Add0~1_combout\);

-- Location: LCCOMB_X27_Y7_N14
\L_USER_LOGIC|mem_addr~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~8_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (((\L_USER_LOGIC|stack_is_empty~q\ & \L_USER_LOGIC|Add0~1_combout\)))) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (\L_USER_LOGIC|stack_pointer\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_pointer\(2),
	datab => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	datac => \L_USER_LOGIC|stack_is_empty~q\,
	datad => \L_USER_LOGIC|Add0~1_combout\,
	combout => \L_USER_LOGIC|mem_addr~8_combout\);

-- Location: LCCOMB_X26_Y7_N0
\L_USER_LOGIC|mem_addr~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~9_combout\ = (\L_USER_LOGIC|mem_addr~4_combout\ & (\L_USER_LOGIC|mem_addr\(2))) # (!\L_USER_LOGIC|mem_addr~4_combout\ & ((\L_USER_LOGIC|mem_addr~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr\(2),
	datac => \L_USER_LOGIC|mem_addr~8_combout\,
	datad => \L_USER_LOGIC|mem_addr~4_combout\,
	combout => \L_USER_LOGIC|mem_addr~9_combout\);

-- Location: FF_X26_Y7_N5
\L_USER_LOGIC|mem_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr~9_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_addr\(2));

-- Location: LCCOMB_X26_Y7_N20
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~54_combout\ = (!\L_USER_LOGIC|mem_addr\(1) & (!\L_USER_LOGIC|mem_addr\(3) & (!\L_USER_LOGIC|mem_addr\(0) & !\L_USER_LOGIC|mem_addr\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr\(1),
	datab => \L_USER_LOGIC|mem_addr\(3),
	datac => \L_USER_LOGIC|mem_addr\(0),
	datad => \L_USER_LOGIC|mem_addr\(2),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~54_combout\);

-- Location: LCCOMB_X31_Y7_N26
\L_USER_LOGIC|mem_addr~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~12_combout\ = (\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & (\L_USER_LOGIC|stack_is_empty~q\ & (\L_USER_LOGIC|stack_pointer\(4) $ (\L_USER_LOGIC|adapt_we_ack~0_combout\)))) # (!\L_USER_LOGIC|L_USER_LOGIC~8_combout\ & 
-- (((\L_USER_LOGIC|stack_pointer\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|stack_is_empty~q\,
	datab => \L_USER_LOGIC|stack_pointer\(4),
	datac => \L_USER_LOGIC|adapt_we_ack~0_combout\,
	datad => \L_USER_LOGIC|L_USER_LOGIC~8_combout\,
	combout => \L_USER_LOGIC|mem_addr~12_combout\);

-- Location: LCCOMB_X26_Y7_N26
\L_USER_LOGIC|mem_addr~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~13_combout\ = (\L_USER_LOGIC|mem_addr~4_combout\ & (\L_USER_LOGIC|mem_addr\(4))) # (!\L_USER_LOGIC|mem_addr~4_combout\ & ((\L_USER_LOGIC|mem_addr~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr\(4),
	datab => \L_USER_LOGIC|mem_addr~12_combout\,
	datad => \L_USER_LOGIC|mem_addr~4_combout\,
	combout => \L_USER_LOGIC|mem_addr~13_combout\);

-- Location: FF_X26_Y7_N11
\L_USER_LOGIC|mem_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr~13_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_addr\(4));

-- Location: LCCOMB_X26_Y7_N24
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\ = (\MEM|Equal0~0_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~54_combout\ & !\L_USER_LOGIC|mem_addr\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|Equal0~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~54_combout\,
	datad => \L_USER_LOGIC|mem_addr\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\);

-- Location: FF_X26_Y8_N19
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36_q\);

-- Location: LCCOMB_X26_Y8_N0
\L_USER_LOGIC|state.idle~_wirecell\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|state.idle~_wirecell_combout\ = !\L_USER_LOGIC|state.idle~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|state.idle~q\,
	combout => \L_USER_LOGIC|state.idle~_wirecell_combout\);

-- Location: IOIBUF_X30_Y0_N15
\data_from_acu[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(0),
	o => \data_from_acu[0]~input_o\);

-- Location: LCCOMB_X30_Y8_N22
\L_USER_LOGIC|mem_data_out[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[0]~feeder_combout\ = \data_from_acu[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[0]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[0]~feeder_combout\);

-- Location: FF_X30_Y8_N23
\L_USER_LOGIC|mem_data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[0]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(0));

-- Location: FF_X30_Y8_N9
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_data_out\(0),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0));

-- Location: IOIBUF_X41_Y7_N8
\data_from_acu[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(1),
	o => \data_from_acu[1]~input_o\);

-- Location: LCCOMB_X30_Y7_N4
\L_USER_LOGIC|mem_data_out[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[1]~feeder_combout\ = \data_from_acu[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[1]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[1]~feeder_combout\);

-- Location: FF_X30_Y7_N5
\L_USER_LOGIC|mem_data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[1]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(1));

-- Location: LCCOMB_X30_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[1]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(1),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[1]~feeder_combout\);

-- Location: FF_X30_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[1]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(1));

-- Location: IOIBUF_X41_Y6_N15
\data_from_acu[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(4),
	o => \data_from_acu[4]~input_o\);

-- Location: LCCOMB_X31_Y9_N20
\L_USER_LOGIC|mem_data_out[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[4]~feeder_combout\ = \data_from_acu[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[4]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[4]~feeder_combout\);

-- Location: FF_X31_Y9_N21
\L_USER_LOGIC|mem_data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[4]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(4));

-- Location: LCCOMB_X31_Y9_N18
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[4]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[4]~feeder_combout\);

-- Location: FF_X31_Y9_N19
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[4]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4));

-- Location: IOIBUF_X37_Y0_N1
\data_from_acu[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(11),
	o => \data_from_acu[11]~input_o\);

-- Location: FF_X30_Y7_N31
\L_USER_LOGIC|mem_data_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_from_acu[11]~input_o\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(11));

-- Location: LCCOMB_X29_Y9_N2
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[11]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[11]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(11),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[11]~feeder_combout\);

-- Location: FF_X29_Y9_N3
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[11]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11));

-- Location: IOIBUF_X41_Y8_N22
\data_from_acu[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(6),
	o => \data_from_acu[6]~input_o\);

-- Location: LCCOMB_X30_Y8_N14
\L_USER_LOGIC|mem_data_out[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[6]~feeder_combout\ = \data_from_acu[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[6]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[6]~feeder_combout\);

-- Location: FF_X30_Y8_N15
\L_USER_LOGIC|mem_data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[6]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(6));

-- Location: LCCOMB_X31_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[6]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[6]~feeder_combout\);

-- Location: FF_X31_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[6]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6));

-- Location: LCCOMB_X31_Y9_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~1_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~1_combout\);

-- Location: LCCOMB_X27_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~2_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(1) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(1),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~1_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~2_combout\);

-- Location: FF_X27_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~2_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(1));

-- Location: LCCOMB_X26_Y7_N22
\L_USER_LOGIC|mem_addr~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_addr~7_combout\ = (\L_USER_LOGIC|mem_addr~4_combout\ & ((\L_USER_LOGIC|mem_addr\(1)))) # (!\L_USER_LOGIC|mem_addr~4_combout\ & (\L_USER_LOGIC|mem_addr~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|mem_addr~6_combout\,
	datac => \L_USER_LOGIC|mem_addr\(1),
	datad => \L_USER_LOGIC|mem_addr~4_combout\,
	combout => \L_USER_LOGIC|mem_addr~7_combout\);

-- Location: FF_X26_Y7_N23
\L_USER_LOGIC|mem_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_addr~7_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_addr\(1));

-- Location: LCCOMB_X23_Y9_N24
\~QUARTUS_CREATED_GND~I\ : cycloneiii_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOIBUF_X41_Y8_N15
\data_from_acu[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(9),
	o => \data_from_acu[9]~input_o\);

-- Location: FF_X30_Y8_N29
\L_USER_LOGIC|mem_data_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_from_acu[9]~input_o\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(9));

-- Location: LCCOMB_X29_Y9_N18
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[9]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[9]~feeder_combout\);

-- Location: FF_X29_Y9_N19
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[9]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9));

-- Location: IOIBUF_X30_Y0_N1
\data_from_acu[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(5),
	o => \data_from_acu[5]~input_o\);

-- Location: FF_X30_Y8_N21
\L_USER_LOGIC|mem_data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_from_acu[5]~input_o\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(5));

-- Location: LCCOMB_X29_Y9_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[5]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(5),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[5]~feeder_combout\);

-- Location: FF_X29_Y9_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[5]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(5));

-- Location: LCCOMB_X28_Y9_N20
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(10) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(5) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(10),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(5),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\);

-- Location: IOIBUF_X41_Y6_N1
\data_from_acu[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(12),
	o => \data_from_acu[12]~input_o\);

-- Location: LCCOMB_X30_Y8_N24
\L_USER_LOGIC|mem_data_out[12]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[12]~feeder_combout\ = \data_from_acu[12]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[12]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[12]~feeder_combout\);

-- Location: FF_X30_Y8_N25
\L_USER_LOGIC|mem_data_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[12]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(12));

-- Location: FF_X30_Y9_N21
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_data_out\(12),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12));

-- Location: IOIBUF_X41_Y10_N8
\data_from_acu[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(13),
	o => \data_from_acu[13]~input_o\);

-- Location: LCCOMB_X31_Y9_N12
\L_USER_LOGIC|mem_data_out[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[13]~feeder_combout\ = \data_from_acu[13]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[13]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[13]~feeder_combout\);

-- Location: FF_X31_Y9_N13
\L_USER_LOGIC|mem_data_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[13]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(13));

-- Location: LCCOMB_X31_Y9_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[13]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(13),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[13]~feeder_combout\);

-- Location: FF_X31_Y9_N7
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[13]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13));

-- Location: LCCOMB_X31_Y9_N2
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~1_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~1_combout\);

-- Location: LCCOMB_X27_Y9_N30
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~2_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~1_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~2_combout\);

-- Location: FF_X27_Y9_N31
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~2_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(2));

-- Location: IOIBUF_X28_Y0_N1
\data_from_acu[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(7),
	o => \data_from_acu[7]~input_o\);

-- Location: LCCOMB_X30_Y7_N22
\L_USER_LOGIC|mem_data_out[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[7]~feeder_combout\ = \data_from_acu[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[7]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[7]~feeder_combout\);

-- Location: FF_X30_Y7_N23
\L_USER_LOGIC|mem_data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[7]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(7));

-- Location: LCCOMB_X29_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[7]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L_USER_LOGIC|mem_data_out\(7),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[7]~feeder_combout\);

-- Location: FF_X29_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[7]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7));

-- Location: LCCOMB_X28_Y9_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~0_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(14) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(14),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(2),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~0_combout\);

-- Location: LCCOMB_X27_Y9_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(1) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor0~0_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(1),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~combout\);

-- Location: FF_X27_Y9_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor2~combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(3));

-- Location: LCCOMB_X28_Y9_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor3~combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\ $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor1~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor3~combout\);

-- Location: FF_X28_Y9_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor3~combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(4));

-- Location: IOIBUF_X41_Y9_N22
\data_from_acu[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(14),
	o => \data_from_acu[14]~input_o\);

-- Location: LCCOMB_X31_Y9_N10
\L_USER_LOGIC|mem_data_out[14]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[14]~feeder_combout\ = \data_from_acu[14]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[14]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[14]~feeder_combout\);

-- Location: FF_X31_Y9_N11
\L_USER_LOGIC|mem_data_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[14]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(14));

-- Location: LCCOMB_X31_Y9_N16
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[14]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[14]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(14),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[14]~feeder_combout\);

-- Location: FF_X31_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[14]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(14));

-- Location: LCCOMB_X31_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~0_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(15) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(14) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(15),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(14),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~0_combout\);

-- Location: LCCOMB_X31_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~combout\);

-- Location: FF_X31_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|WideXor4~combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(5));

-- Location: LCCOMB_X27_Y9_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[6]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(0),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[6]~feeder_combout\);

-- Location: FF_X27_Y9_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[6]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(6));

-- Location: FF_X27_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(1),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(7));

-- Location: IOIBUF_X41_Y8_N1
\data_from_acu[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(3),
	o => \data_from_acu[3]~input_o\);

-- Location: LCCOMB_X30_Y8_N16
\L_USER_LOGIC|mem_data_out[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[3]~feeder_combout\ = \data_from_acu[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[3]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[3]~feeder_combout\);

-- Location: FF_X30_Y8_N17
\L_USER_LOGIC|mem_data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[3]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(3));

-- Location: LCCOMB_X30_Y9_N16
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[3]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(3),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[3]~feeder_combout\);

-- Location: FF_X30_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[3]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3));

-- Location: LCCOMB_X30_Y9_N12
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[9]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(3),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[9]~feeder_combout\);

-- Location: FF_X30_Y9_N13
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[9]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(9));

-- Location: LCCOMB_X31_Y9_N8
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[10]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[10]~feeder_combout\);

-- Location: FF_X31_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[10]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(10));

-- Location: LCCOMB_X29_Y9_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[11]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[11]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(5),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[11]~feeder_combout\);

-- Location: FF_X29_Y9_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[11]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(11));

-- Location: LCCOMB_X28_Y9_N16
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[12]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[12]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[12]~feeder_combout\);

-- Location: FF_X28_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[12]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(12));

-- Location: LCCOMB_X28_Y9_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[13]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(7),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[13]~feeder_combout\);

-- Location: FF_X28_Y9_N25
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[13]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(13));

-- Location: IOIBUF_X41_Y9_N15
\data_from_acu[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(8),
	o => \data_from_acu[8]~input_o\);

-- Location: LCCOMB_X31_Y9_N26
\L_USER_LOGIC|mem_data_out[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[8]~feeder_combout\ = \data_from_acu[8]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[8]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[8]~feeder_combout\);

-- Location: FF_X31_Y9_N27
\L_USER_LOGIC|mem_data_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[8]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(8));

-- Location: LCCOMB_X30_Y9_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[8]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(8),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[8]~feeder_combout\);

-- Location: FF_X30_Y9_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[8]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8));

-- Location: LCCOMB_X29_Y9_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[14]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[14]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(8),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[14]~feeder_combout\);

-- Location: FF_X29_Y9_N7
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[14]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(14));

-- Location: LCCOMB_X28_Y9_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[15]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[15]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[15]~feeder_combout\);

-- Location: FF_X28_Y9_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[15]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(15));

-- Location: IOIBUF_X41_Y8_N8
\data_from_acu[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(10),
	o => \data_from_acu[10]~input_o\);

-- Location: LCCOMB_X30_Y8_N0
\L_USER_LOGIC|mem_data_out[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|mem_data_out[10]~feeder_combout\ = \data_from_acu[10]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_from_acu[10]~input_o\,
	combout => \L_USER_LOGIC|mem_data_out[10]~feeder_combout\);

-- Location: FF_X30_Y8_N1
\L_USER_LOGIC|mem_data_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|mem_data_out[10]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(10));

-- Location: LCCOMB_X30_Y9_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[10]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(10),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[10]~feeder_combout\);

-- Location: FF_X30_Y9_N25
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[10]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(10));

-- Location: FF_X28_Y9_N31
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(10),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(16));

-- Location: LCCOMB_X29_Y9_N4
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[17]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[17]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(11),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[17]~feeder_combout\);

-- Location: FF_X29_Y9_N5
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[17]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(17));

-- Location: LCCOMB_X30_Y9_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[18]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[18]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(12),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[18]~feeder_combout\);

-- Location: FF_X30_Y9_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[18]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(18));

-- Location: FF_X32_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(13),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(19));

-- Location: FF_X32_Y9_N21
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(14),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(20));

-- Location: IOIBUF_X30_Y0_N29
\data_from_acu[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_from_acu(15),
	o => \data_from_acu[15]~input_o\);

-- Location: FF_X30_Y8_N3
\L_USER_LOGIC|mem_data_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_from_acu[15]~input_o\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|mem_data_out\(15));

-- Location: LCCOMB_X30_Y9_N26
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[15]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[15]~feeder_combout\ = \L_USER_LOGIC|mem_data_out\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|mem_data_out\(15),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[15]~feeder_combout\);

-- Location: FF_X30_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d[15]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(15));

-- Location: FF_X30_Y9_N7
\MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|data_in_d\(15),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(21));

-- Location: LCCOMB_X26_Y9_N10
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[8]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[8]~14_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a7\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~36_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a7\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[8]~14_combout\);

-- Location: LCCOMB_X29_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[18]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[18]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(8),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[18]~feeder_combout\);

-- Location: FF_X29_Y9_N1
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[18]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(18));

-- Location: FF_X27_Y7_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr\(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(9));

-- Location: FF_X27_Y7_N11
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|Equal0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(0));

-- Location: LCCOMB_X27_Y7_N26
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~52_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(0) & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(10) $ (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(10),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(9),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(0),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~52_combout\);

-- Location: LCCOMB_X24_Y7_N14
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[3]~feeder_combout\ = \L_USER_LOGIC|mem_addr\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \L_USER_LOGIC|mem_addr\(1),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[3]~feeder_combout\);

-- Location: FF_X24_Y7_N15
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(3));

-- Location: FF_X24_Y7_N21
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr~7_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(4));

-- Location: FF_X26_Y7_N25
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \L_USER_LOGIC|mem_addr~5_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(2));

-- Location: LCCOMB_X24_Y7_N20
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~50_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(1) & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(2) & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(3) $ 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(4))))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(1) & (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(2) & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(3) $ (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(1),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(3),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(4),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(2),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~50_combout\);

-- Location: LCCOMB_X26_Y7_N10
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~51_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~52_combout\ & \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~51_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~52_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~50_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\);

-- Location: FF_X26_Y9_N11
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[8]~14_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(18),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(8));

-- Location: FF_X32_Y8_N7
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(8),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8));

-- Location: LCCOMB_X31_Y7_N12
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28feeder_combout\);

-- Location: FF_X31_Y7_N13
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\);

-- Location: LCCOMB_X24_Y9_N20
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[19]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[19]~2_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a18\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~47_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~47_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a18\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[19]~2_combout\);

-- Location: LCCOMB_X24_Y9_N2
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[29]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[29]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(19)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(19),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[29]~feeder_combout\);

-- Location: FF_X24_Y9_N3
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[29]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(29));

-- Location: FF_X24_Y9_N21
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[19]~2_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(29),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(19));

-- Location: FF_X32_Y8_N29
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(19),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19));

-- Location: LCCOMB_X24_Y9_N18
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[9]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[9]~8_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a8\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~37_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a8\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[9]~8_combout\);

-- Location: LCCOMB_X28_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[19]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[19]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[19]~feeder_combout\);

-- Location: FF_X28_Y9_N1
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[19]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(19));

-- Location: FF_X24_Y9_N19
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[9]~8_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(19),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(9));

-- Location: LCCOMB_X32_Y8_N2
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[9]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[9]~feeder_combout\);

-- Location: FF_X32_Y8_N3
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[9]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9));

-- Location: LCCOMB_X32_Y8_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~8_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~8_combout\);

-- Location: FF_X27_Y9_N7
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(2),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~30_q\);

-- Location: LCCOMB_X26_Y9_N6
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[2]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[2]~15_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a1\)) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~30_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a1\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~30_q\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[2]~15_combout\);

-- Location: LCCOMB_X26_Y9_N16
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[12]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[12]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(2),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[12]~feeder_combout\);

-- Location: FF_X26_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(12));

-- Location: FF_X26_Y9_N7
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[2]~15_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(12),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(2));

-- Location: FF_X33_Y8_N15
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(2),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(2));

-- Location: LCCOMB_X24_Y9_N10
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[6]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[6]~0_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a5\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~34_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~34_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a5\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[6]~0_combout\);

-- Location: LCCOMB_X24_Y9_N22
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[16]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[16]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[16]~feeder_combout\);

-- Location: FF_X24_Y9_N23
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(16));

-- Location: FF_X24_Y9_N11
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[6]~0_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(16),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(6));

-- Location: LCCOMB_X30_Y8_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[6]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[6]~feeder_combout\);

-- Location: FF_X30_Y8_N7
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[6]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6));

-- Location: LCCOMB_X33_Y8_N14
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~8_combout\ $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(2) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~8_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(2),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\);

-- Location: LCCOMB_X28_Y9_N26
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(17),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45feeder_combout\);

-- Location: FF_X28_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45_q\);

-- Location: LCCOMB_X29_Y9_N16
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[17]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[17]~3_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a16\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~45_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a16\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[17]~3_combout\);

-- Location: LCCOMB_X29_Y9_N26
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[27]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[27]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(17),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[27]~feeder_combout\);

-- Location: FF_X29_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[27]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(27));

-- Location: FF_X29_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[17]~3_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(27),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(17));

-- Location: LCCOMB_X32_Y8_N14
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[17]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[17]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(17),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[17]~feeder_combout\);

-- Location: FF_X32_Y8_N15
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[17]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17));

-- Location: FF_X27_Y9_N25
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(5),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~33_q\);

-- Location: LCCOMB_X26_Y9_N20
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[5]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[5]~20_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a4\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~33_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~33_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a4\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[5]~20_combout\);

-- Location: LCCOMB_X28_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[15]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[15]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(5),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[15]~feeder_combout\);

-- Location: FF_X28_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(15));

-- Location: FF_X26_Y9_N21
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[5]~20_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(15),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(5));

-- Location: FF_X32_Y8_N19
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(5),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(5));

-- Location: LCCOMB_X30_Y9_N8
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(18),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46feeder_combout\);

-- Location: FF_X30_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46_q\);

-- Location: LCCOMB_X26_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[18]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[18]~11_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a17\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~46_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a17\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[18]~11_combout\);

-- Location: LCCOMB_X26_Y9_N26
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[28]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[28]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(18),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[28]~feeder_combout\);

-- Location: FF_X26_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[28]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(28));

-- Location: FF_X26_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[18]~11_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(28),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(18));

-- Location: FF_X32_Y8_N25
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(18),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18));

-- Location: LCCOMB_X24_Y9_N24
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[21]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[21]~1_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a20\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~49_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~49_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a20\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[21]~1_combout\);

-- Location: LCCOMB_X24_Y9_N30
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[31]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[31]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(21),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[31]~feeder_combout\);

-- Location: FF_X24_Y9_N31
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[31]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(31));

-- Location: FF_X24_Y9_N25
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[21]~1_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(31),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(21));

-- Location: LCCOMB_X31_Y8_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[21]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[21]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(21),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[21]~feeder_combout\);

-- Location: FF_X31_Y8_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[21]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21));

-- Location: LCCOMB_X32_Y8_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]~10_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]~10_combout\);

-- Location: LCCOMB_X32_Y8_N18
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(5) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(5),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[5]~10_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5));

-- Location: LCCOMB_X32_Y8_N6
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & 
-- !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\);

-- Location: LCCOMB_X24_Y9_N16
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[13]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[13]~17_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a12\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~41_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a12\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[13]~17_combout\);

-- Location: LCCOMB_X24_Y9_N26
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[23]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[23]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(13),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[23]~feeder_combout\);

-- Location: FF_X24_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(23));

-- Location: FF_X24_Y9_N17
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[13]~17_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(23),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(13));

-- Location: LCCOMB_X31_Y8_N8
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[13]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(13),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[13]~feeder_combout\);

-- Location: FF_X31_Y8_N9
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[13]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13));

-- Location: LCCOMB_X24_Y9_N28
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[4]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[4]~19_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a3\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~32_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~32_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a3\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[4]~19_combout\);

-- Location: LCCOMB_X28_Y9_N8
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[14]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[14]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[14]~feeder_combout\);

-- Location: FF_X28_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[14]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(14));

-- Location: FF_X24_Y9_N29
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[4]~19_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(14),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(4));

-- Location: FF_X33_Y8_N27
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(4),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(4));

-- Location: LCCOMB_X27_Y9_N12
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(10),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38feeder_combout\);

-- Location: FF_X27_Y9_N13
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38_q\);

-- Location: LCCOMB_X26_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[10]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[10]~7_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a9\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~38_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a9\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[10]~7_combout\);

-- Location: LCCOMB_X26_Y9_N30
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[20]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[20]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(10),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[20]~feeder_combout\);

-- Location: FF_X26_Y9_N31
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[20]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(20));

-- Location: FF_X26_Y9_N1
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[10]~7_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(20),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(10));

-- Location: LCCOMB_X33_Y8_N20
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[10]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(10),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[10]~feeder_combout\);

-- Location: FF_X33_Y8_N21
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[10]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10));

-- Location: LCCOMB_X33_Y8_N26
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(4) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(4),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\);

-- Location: FF_X28_Y9_N19
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(15),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~43_q\);

-- Location: LCCOMB_X26_Y9_N24
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[15]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[15]~12_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a14\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~43_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~43_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a14\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[15]~12_combout\);

-- Location: LCCOMB_X26_Y9_N8
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[25]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[25]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(15),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[25]~feeder_combout\);

-- Location: FF_X26_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[25]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(25));

-- Location: FF_X26_Y9_N25
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[15]~12_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(25),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(15));

-- Location: LCCOMB_X33_Y8_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[15]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[15]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(15),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[15]~feeder_combout\);

-- Location: FF_X33_Y8_N29
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[15]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15));

-- Location: LCCOMB_X28_Y9_N4
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(11),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39feeder_combout\);

-- Location: FF_X28_Y9_N5
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39_q\);

-- Location: LCCOMB_X29_Y9_N20
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[11]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[11]~13_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a10\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~39_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a10\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[11]~13_combout\);

-- Location: LCCOMB_X29_Y9_N8
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[21]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[21]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(11),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[21]~feeder_combout\);

-- Location: FF_X29_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[21]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(21));

-- Location: FF_X29_Y9_N21
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[11]~13_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(21),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(11));

-- Location: FF_X33_Y8_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(11),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(11));

-- Location: LCCOMB_X24_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[16]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[16]~4_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a15\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~44_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~44_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a15\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[16]~4_combout\);

-- Location: LCCOMB_X24_Y9_N8
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[26]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[26]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(16),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[26]~feeder_combout\);

-- Location: FF_X24_Y9_N9
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[26]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(26));

-- Location: FF_X24_Y9_N1
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[16]~4_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(26),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(16));

-- Location: LCCOMB_X32_Y8_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[16]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[16]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(16),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[16]~feeder_combout\);

-- Location: FF_X32_Y8_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[16]~feeder_combout\,
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16));

-- Location: LCCOMB_X33_Y8_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(11) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(11),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\);

-- Location: LCCOMB_X33_Y8_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4));

-- Location: LCCOMB_X28_Y9_N2
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(14),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42feeder_combout\);

-- Location: FF_X28_Y9_N3
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42_q\);

-- Location: LCCOMB_X29_Y9_N30
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[14]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[14]~5_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a13\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~42_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a13\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[14]~5_combout\);

-- Location: LCCOMB_X29_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[24]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[24]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(14),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[24]~feeder_combout\);

-- Location: FF_X29_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[24]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(24));

-- Location: FF_X29_Y9_N31
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[14]~5_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(24),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(14));

-- Location: FF_X32_Y8_N17
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(14),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14));

-- Location: LCCOMB_X32_Y8_N16
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\);

-- Location: LCCOMB_X27_Y9_N26
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(3),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31feeder_combout\);

-- Location: FF_X27_Y9_N27
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31_q\);

-- Location: LCCOMB_X26_Y9_N2
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[3]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[3]~18_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a2\)) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a2\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~31_q\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[3]~18_combout\);

-- Location: LCCOMB_X26_Y9_N4
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[13]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(3),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[13]~feeder_combout\);

-- Location: FF_X26_Y9_N5
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(13));

-- Location: FF_X26_Y9_N3
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[3]~18_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(13),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(3));

-- Location: FF_X33_Y8_N17
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(3),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(3));

-- Location: LCCOMB_X24_Y9_N6
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[20]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[20]~16_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a19\))) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~48_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a19\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[20]~16_combout\);

-- Location: LCCOMB_X24_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[30]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[30]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(20),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[30]~feeder_combout\);

-- Location: FF_X24_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[30]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(30));

-- Location: FF_X24_Y9_N7
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[20]~16_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(30),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(20));

-- Location: FF_X32_Y8_N13
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(20),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20));

-- Location: LCCOMB_X32_Y8_N12
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~3_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~3_combout\);

-- Location: LCCOMB_X33_Y8_N16
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(3) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(3),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~3_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\);

-- Location: LCCOMB_X33_Y8_N0
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[0]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(0) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\ & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & 
-- !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(0));

-- Location: FF_X33_Y8_N1
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(0),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(0));

-- Location: LCCOMB_X32_Y7_N8
\L_USER_LOGIC|adapt_data_out[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[0]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(0),
	combout => \L_USER_LOGIC|adapt_data_out[0]~feeder_combout\);

-- Location: LCCOMB_X27_Y8_N6
\L_USER_LOGIC|adapt_data_out[15]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[15]~5_combout\ = (!\MEM|Equal2~0_combout\ & (!\L_USER_LOGIC|adapt_data_out[15]~3_combout\ & ((\L_USER_LOGIC|state.pop_after_mem~q\) # (\L_USER_LOGIC|state.top_after_mem~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|Equal2~0_combout\,
	datab => \L_USER_LOGIC|state.pop_after_mem~q\,
	datac => \L_USER_LOGIC|adapt_data_out[15]~3_combout\,
	datad => \L_USER_LOGIC|state.top_after_mem~q\,
	combout => \L_USER_LOGIC|adapt_data_out[15]~5_combout\);

-- Location: FF_X32_Y7_N9
\L_USER_LOGIC|adapt_data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[0]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(0));

-- Location: LCCOMB_X27_Y9_N0
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(1),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29feeder_combout\);

-- Location: FF_X27_Y9_N1
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29feeder_combout\,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29_q\);

-- Location: LCCOMB_X26_Y9_N12
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[1]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[1]~10_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0~portbdataout\))) # 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~29_q\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[1]~10_combout\);

-- Location: LCCOMB_X26_Y9_N14
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[11]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[11]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(1),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[11]~feeder_combout\);

-- Location: FF_X26_Y9_N15
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(11));

-- Location: FF_X26_Y9_N13
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[1]~10_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(11),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(1));

-- Location: FF_X33_Y8_N19
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(1),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(1));

-- Location: LCCOMB_X33_Y8_N18
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~6_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(1) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(1),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(6),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~6_combout\);

-- Location: FF_X27_Y9_N3
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(12),
	sload => VCC,
	ena => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~40_q\);

-- Location: LCCOMB_X26_Y9_N18
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[12]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[12]~6_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & (\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a11\)) # (!\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\ & 
-- ((\MEM|L_EDAC_PROTECTED_MEMORY|memory_content~40_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~28_q\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0|auto_generated|ram_block1a11\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~40_q\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[12]~6_combout\);

-- Location: LCCOMB_X26_Y9_N22
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[22]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[22]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_ENCODER|result_d\(12),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[22]~feeder_combout\);

-- Location: FF_X26_Y9_N23
\MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(22));

-- Location: FF_X26_Y9_N19
\MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem[12]~6_combout\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content_rtl_0_bypass\(22),
	sload => \MEM|L_EDAC_PROTECTED_MEMORY|memory_content~53_combout\,
	ena => \MEM|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(12));

-- Location: FF_X33_Y8_N23
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|data_out_mem\(12),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12));

-- Location: LCCOMB_X33_Y8_N22
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~5_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12) $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~5_combout\);

-- Location: LCCOMB_X33_Y8_N4
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7) $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~6_combout\ $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~5_combout\ $ (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~6_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~5_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~2_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\);

-- Location: LCCOMB_X33_Y7_N24
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\ = (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5) & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\);

-- Location: LCCOMB_X33_Y7_N20
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[1]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(1) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\ $ 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(7),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(1));

-- Location: FF_X33_Y7_N21
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(1),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(1));

-- Location: LCCOMB_X33_Y7_N0
\L_USER_LOGIC|adapt_data_out[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[1]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(1),
	combout => \L_USER_LOGIC|adapt_data_out[1]~feeder_combout\);

-- Location: FF_X33_Y7_N1
\L_USER_LOGIC|adapt_data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[1]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(1));

-- Location: LCCOMB_X32_Y7_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\ = (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5) & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\);

-- Location: LCCOMB_X32_Y7_N0
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[2]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(2) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8) $ (((!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(8),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(2));

-- Location: FF_X32_Y7_N1
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(2),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(2));

-- Location: LCCOMB_X31_Y8_N12
\L_USER_LOGIC|adapt_data_out[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[2]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(2),
	combout => \L_USER_LOGIC|adapt_data_out[2]~feeder_combout\);

-- Location: FF_X31_Y8_N13
\L_USER_LOGIC|adapt_data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[2]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(2));

-- Location: LCCOMB_X32_Y8_N0
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[3]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(3) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\ & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(9),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(3));

-- Location: FF_X32_Y8_N1
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(3),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(3));

-- Location: LCCOMB_X33_Y7_N2
\L_USER_LOGIC|adapt_data_out[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[3]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(3),
	combout => \L_USER_LOGIC|adapt_data_out[3]~feeder_combout\);

-- Location: FF_X33_Y7_N3
\L_USER_LOGIC|adapt_data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[3]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(3));

-- Location: LCCOMB_X33_Y7_N18
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[4]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(4) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal8~0_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & 
-- !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal8~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(10),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(4));

-- Location: FF_X33_Y7_N19
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(4),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(4));

-- Location: LCCOMB_X33_Y7_N12
\L_USER_LOGIC|adapt_data_out[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[4]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(4),
	combout => \L_USER_LOGIC|adapt_data_out[4]~feeder_combout\);

-- Location: FF_X33_Y7_N13
\L_USER_LOGIC|adapt_data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[4]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(4));

-- Location: LCCOMB_X32_Y7_N2
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[5]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(5) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(11) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\ & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(11),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(5));

-- Location: FF_X32_Y7_N3
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(5),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(5));

-- Location: FF_X29_Y7_N9
\L_USER_LOGIC|adapt_data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(5),
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(5));

-- Location: LCCOMB_X32_Y8_N30
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[6]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(6) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12) $ (((!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(12),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(6));

-- Location: FF_X32_Y8_N31
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(6),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(6));

-- Location: FF_X32_Y7_N19
\L_USER_LOGIC|adapt_data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(6),
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(6));

-- Location: LCCOMB_X31_Y8_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal11~0_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal11~0_combout\);

-- Location: LCCOMB_X31_Y8_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[7]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(7) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13) $ (((!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5) & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(13),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal11~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(7));

-- Location: FF_X31_Y8_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(7),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(7));

-- Location: LCCOMB_X31_Y8_N2
\L_USER_LOGIC|adapt_data_out[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[7]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(7),
	combout => \L_USER_LOGIC|adapt_data_out[7]~feeder_combout\);

-- Location: FF_X31_Y8_N3
\L_USER_LOGIC|adapt_data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[7]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(7));

-- Location: LCCOMB_X33_Y7_N8
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[8]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(8) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\ $ 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(14),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal4~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(8));

-- Location: FF_X33_Y7_N9
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(8),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(8));

-- Location: LCCOMB_X31_Y8_N20
\L_USER_LOGIC|adapt_data_out[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[8]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(8),
	combout => \L_USER_LOGIC|adapt_data_out[8]~feeder_combout\);

-- Location: FF_X31_Y8_N21
\L_USER_LOGIC|adapt_data_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[8]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(8));

-- Location: LCCOMB_X32_Y7_N12
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[9]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(9) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(15),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal5~0_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(9));

-- Location: FF_X32_Y7_N13
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(9),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(9));

-- Location: FF_X31_Y8_N7
\L_USER_LOGIC|adapt_data_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(9),
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(9));

-- Location: LCCOMB_X32_Y8_N8
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[10]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(10) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\ & 
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(16),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal2~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(10));

-- Location: FF_X32_Y8_N9
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(10),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(10));

-- Location: FF_X28_Y7_N7
\L_USER_LOGIC|adapt_data_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(10),
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(10));

-- Location: LCCOMB_X33_Y8_N12
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\ = (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\);

-- Location: LCCOMB_X32_Y8_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[11]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(11) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\ & !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(17),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(11));

-- Location: FF_X32_Y8_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(11),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(11));

-- Location: FF_X28_Y7_N1
\L_USER_LOGIC|adapt_data_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(11),
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(11));

-- Location: LCCOMB_X32_Y8_N20
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[12]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(12) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal17~0_combout\ & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal17~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(18),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(12));

-- Location: FF_X32_Y8_N21
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(12),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(12));

-- Location: FF_X31_Y8_N1
\L_USER_LOGIC|adapt_data_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(12),
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	sload => VCC,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(12));

-- Location: LCCOMB_X33_Y7_N28
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~3_combout\ = (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5) & 
-- (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\ $ (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~0_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[4]~1_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~3_combout\);

-- Location: LCCOMB_X33_Y7_N10
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[13]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(13) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & (\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~3_combout\ & 
-- !\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~3_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(19),
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(13));

-- Location: FF_X33_Y7_N11
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(13),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(13));

-- Location: LCCOMB_X33_Y7_N26
\L_USER_LOGIC|adapt_data_out[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[13]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(13),
	combout => \L_USER_LOGIC|adapt_data_out[13]~feeder_combout\);

-- Location: FF_X33_Y7_N27
\L_USER_LOGIC|adapt_data_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[13]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(13));

-- Location: LCCOMB_X33_Y8_N8
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal19~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal19~0_combout\ = (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4) & (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\ & 
-- (!\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\ & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(4),
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[1]~7_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[2]~9_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal19~0_combout\);

-- Location: LCCOMB_X32_Y8_N26
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[14]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(14) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal19~0_combout\ & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(20),
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal19~0_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome\(5),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(14));

-- Location: FF_X32_Y8_N27
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(14),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(14));

-- Location: LCCOMB_X31_Y8_N26
\L_USER_LOGIC|adapt_data_out[14]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[14]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(14),
	combout => \L_USER_LOGIC|adapt_data_out[14]~feeder_combout\);

-- Location: FF_X31_Y8_N27
\L_USER_LOGIC|adapt_data_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[14]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(14));

-- Location: LCCOMB_X32_Y8_N4
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message[15]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(15) = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21) $ (((\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\ & \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|error_syndrome[3]~4_combout\,
	datac => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|Equal16~2_combout\,
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|data_in_d\(21),
	combout => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(15));

-- Location: FF_X32_Y8_N5
\MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message\(15),
	clrn => \raw_reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(15));

-- Location: LCCOMB_X31_Y8_N24
\L_USER_LOGIC|adapt_data_out[15]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|adapt_data_out[15]~feeder_combout\ = \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MEM|L_EDAC_PROTECTED_MEMORY|L_DECODER|corrected_message_d\(15),
	combout => \L_USER_LOGIC|adapt_data_out[15]~feeder_combout\);

-- Location: FF_X31_Y8_N25
\L_USER_LOGIC|adapt_data_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|adapt_data_out[15]~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	ena => \L_USER_LOGIC|adapt_data_out[15]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_data_out\(15));

-- Location: LCCOMB_X29_Y7_N0
\L_USER_LOGIC|Selector10~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector10~1_combout\ = (\L_USER_LOGIC|Selector14~4_combout\ & (((\L_USER_LOGIC|state.pop_after_mem2~q\ & !\L_USER_LOGIC|Selector14~10_combout\)))) # (!\L_USER_LOGIC|Selector14~4_combout\ & ((\L_USER_LOGIC|Selector10~0_combout\) # 
-- ((\L_USER_LOGIC|state.pop_after_mem2~q\ & !\L_USER_LOGIC|Selector14~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector14~4_combout\,
	datab => \L_USER_LOGIC|Selector10~0_combout\,
	datac => \L_USER_LOGIC|state.pop_after_mem2~q\,
	datad => \L_USER_LOGIC|Selector14~10_combout\,
	combout => \L_USER_LOGIC|Selector10~1_combout\);

-- Location: FF_X29_Y7_N1
\L_USER_LOGIC|state.pop_after_mem2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector10~1_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|state.pop_after_mem2~q\);

-- Location: LCCOMB_X28_Y8_N16
\L_USER_LOGIC|Selector1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector1~3_combout\ = (\Equal1~5_combout\ & (!\Equal2~0_combout\ & (\L_USER_LOGIC|state.top_after_mem2~q\))) # (!\Equal1~5_combout\ & (\Equal2~0_combout\ & ((\L_USER_LOGIC|state.pop_after_mem2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~5_combout\,
	datab => \Equal2~0_combout\,
	datac => \L_USER_LOGIC|state.top_after_mem2~q\,
	datad => \L_USER_LOGIC|state.pop_after_mem2~q\,
	combout => \L_USER_LOGIC|Selector1~3_combout\);

-- Location: LCCOMB_X24_Y7_N28
\L_USER_LOGIC|Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector1~0_combout\ = (!\L_USER_LOGIC|state.idle~q\ & ((\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & ((!\L_USER_LOGIC|L_USER_LOGIC~7_combout\))) # (!\L_USER_LOGIC|L_USER_LOGIC~5_combout\ & (!\L_USER_LOGIC|adapt_re_ack~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|adapt_re_ack~1_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~5_combout\,
	datac => \L_USER_LOGIC|L_USER_LOGIC~7_combout\,
	datad => \L_USER_LOGIC|state.idle~q\,
	combout => \L_USER_LOGIC|Selector1~0_combout\);

-- Location: LCCOMB_X24_Y7_N8
\L_USER_LOGIC|Selector1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector1~4_combout\ = (!\L_USER_LOGIC|Selector1~2_combout\ & (!\L_USER_LOGIC|Selector1~0_combout\ & ((!\L_USER_LOGIC|Selector1~3_combout\) # (!\L_USER_LOGIC|L_USER_LOGIC~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|Selector1~2_combout\,
	datab => \L_USER_LOGIC|L_USER_LOGIC~4_combout\,
	datac => \L_USER_LOGIC|Selector1~3_combout\,
	datad => \L_USER_LOGIC|Selector1~0_combout\,
	combout => \L_USER_LOGIC|Selector1~4_combout\);

-- Location: FF_X24_Y7_N9
\L_USER_LOGIC|adapt_re_ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector1~4_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_re_ack~q\);

-- Location: LCCOMB_X30_Y8_N18
\L_USER_LOGIC|Selector0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector0~2_combout\ = (!\MEM|Equal0~0_combout\ & (\L_USER_LOGIC|Selector5~0_combout\ & (\L_USER_LOGIC|state.push_after_mem~q\ & !\L_USER_LOGIC|Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEM|Equal0~0_combout\,
	datab => \L_USER_LOGIC|Selector5~0_combout\,
	datac => \L_USER_LOGIC|state.push_after_mem~q\,
	datad => \L_USER_LOGIC|Selector2~0_combout\,
	combout => \L_USER_LOGIC|Selector0~2_combout\);

-- Location: LCCOMB_X30_Y8_N12
\L_USER_LOGIC|Selector0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|Selector0~3_combout\ = (!\L_USER_LOGIC|Selector0~2_combout\ & ((\L_USER_LOGIC|state.idle~q\ & ((\L_USER_LOGIC|adapt_we_ack~q\))) # (!\L_USER_LOGIC|state.idle~q\ & (\L_USER_LOGIC|stack_pointer[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.idle~q\,
	datab => \L_USER_LOGIC|stack_pointer[1]~0_combout\,
	datac => \L_USER_LOGIC|adapt_we_ack~q\,
	datad => \L_USER_LOGIC|Selector0~2_combout\,
	combout => \L_USER_LOGIC|Selector0~3_combout\);

-- Location: FF_X30_Y8_N13
\L_USER_LOGIC|adapt_we_ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|Selector0~3_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|adapt_we_ack~q\);

-- Location: LCCOMB_X30_Y8_N26
\s_ready_2_acu~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s_ready_2_acu~0_combout\ = (\L_USER_LOGIC|adapt_re_ack~q\) # (\L_USER_LOGIC|adapt_we_ack~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \L_USER_LOGIC|adapt_re_ack~q\,
	datad => \L_USER_LOGIC|adapt_we_ack~q\,
	combout => \s_ready_2_acu~0_combout\);

-- Location: IOIBUF_X26_Y0_N1
\recover_fsm_n~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_recover_fsm_n,
	o => \recover_fsm_n~input_o\);

-- Location: LCCOMB_X24_Y7_N24
\L_USER_LOGIC|ff_recover_fsm_n~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|ff_recover_fsm_n~0_combout\ = !\recover_fsm_n~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \recover_fsm_n~input_o\,
	combout => \L_USER_LOGIC|ff_recover_fsm_n~0_combout\);

-- Location: FF_X24_Y7_N25
\L_USER_LOGIC|ff_recover_fsm_n\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|ff_recover_fsm_n~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|ff_recover_fsm_n~q\);

-- Location: LCCOMB_X24_Y7_N26
\L_USER_LOGIC|recover_fsm_n_filtered~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|recover_fsm_n_filtered~feeder_combout\ = \L_USER_LOGIC|ff_recover_fsm_n~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \L_USER_LOGIC|ff_recover_fsm_n~q\,
	combout => \L_USER_LOGIC|recover_fsm_n_filtered~feeder_combout\);

-- Location: FF_X24_Y7_N27
\L_USER_LOGIC|recover_fsm_n_filtered\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|recover_fsm_n_filtered~feeder_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|recover_fsm_n_filtered~q\);

-- Location: LCCOMB_X30_Y7_N20
\L_USER_LOGIC|user_fsm_invalid~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \L_USER_LOGIC|user_fsm_invalid~0_combout\ = (\L_USER_LOGIC|state.invalid~q\) # (\L_USER_LOGIC|user_fsm_invalid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \L_USER_LOGIC|state.invalid~q\,
	datac => \L_USER_LOGIC|user_fsm_invalid~q\,
	combout => \L_USER_LOGIC|user_fsm_invalid~0_combout\);

-- Location: FF_X30_Y7_N21
\L_USER_LOGIC|user_fsm_invalid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \L_USER_LOGIC|user_fsm_invalid~0_combout\,
	clrn => \L_USER_LOGIC|as_reset_n~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \L_USER_LOGIC|user_fsm_invalid~q\);

ww_s_data_2_acu(0) <= \s_data_2_acu[0]~output_o\;

ww_s_data_2_acu(1) <= \s_data_2_acu[1]~output_o\;

ww_s_data_2_acu(2) <= \s_data_2_acu[2]~output_o\;

ww_s_data_2_acu(3) <= \s_data_2_acu[3]~output_o\;

ww_s_data_2_acu(4) <= \s_data_2_acu[4]~output_o\;

ww_s_data_2_acu(5) <= \s_data_2_acu[5]~output_o\;

ww_s_data_2_acu(6) <= \s_data_2_acu[6]~output_o\;

ww_s_data_2_acu(7) <= \s_data_2_acu[7]~output_o\;

ww_s_data_2_acu(8) <= \s_data_2_acu[8]~output_o\;

ww_s_data_2_acu(9) <= \s_data_2_acu[9]~output_o\;

ww_s_data_2_acu(10) <= \s_data_2_acu[10]~output_o\;

ww_s_data_2_acu(11) <= \s_data_2_acu[11]~output_o\;

ww_s_data_2_acu(12) <= \s_data_2_acu[12]~output_o\;

ww_s_data_2_acu(13) <= \s_data_2_acu[13]~output_o\;

ww_s_data_2_acu(14) <= \s_data_2_acu[14]~output_o\;

ww_s_data_2_acu(15) <= \s_data_2_acu[15]~output_o\;

ww_s_ready_2_acu <= \s_ready_2_acu~output_o\;

ww_recover_fsm_n_ack <= \recover_fsm_n_ack~output_o\;

ww_user_fsm_invalid <= \user_fsm_invalid~output_o\;
END structure;


