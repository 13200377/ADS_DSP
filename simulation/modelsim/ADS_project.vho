-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "08/27/2021 18:25:19"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ADS_project IS
    PORT (
	miso : OUT std_logic;
	mosi : IN std_logic;
	cs : IN std_logic;
	sck : IN std_logic;
	clk : IN std_logic;
	seg_select : OUT std_logic_vector(3 DOWNTO 0);
	segments : OUT std_logic_vector(7 DOWNTO 0);
	vals : OUT std_logic_vector(3 DOWNTO 0)
	);
END ADS_project;

-- Design Ports Information
-- miso	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_select[0]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_select[1]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_select[2]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_select[3]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[0]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[7]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vals[0]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vals[1]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vals[2]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vals[3]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cs	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sck	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mosi	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ADS_project IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_miso : std_logic;
SIGNAL ww_mosi : std_logic;
SIGNAL ww_cs : std_logic;
SIGNAL ww_sck : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_seg_select : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_segments : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_vals : std_logic_vector(3 DOWNTO 0);
SIGNAL \sr_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \miso~output_o\ : std_logic;
SIGNAL \seg_select[0]~output_o\ : std_logic;
SIGNAL \seg_select[1]~output_o\ : std_logic;
SIGNAL \seg_select[2]~output_o\ : std_logic;
SIGNAL \seg_select[3]~output_o\ : std_logic;
SIGNAL \segments[0]~output_o\ : std_logic;
SIGNAL \segments[1]~output_o\ : std_logic;
SIGNAL \segments[2]~output_o\ : std_logic;
SIGNAL \segments[3]~output_o\ : std_logic;
SIGNAL \segments[4]~output_o\ : std_logic;
SIGNAL \segments[5]~output_o\ : std_logic;
SIGNAL \segments[6]~output_o\ : std_logic;
SIGNAL \segments[7]~output_o\ : std_logic;
SIGNAL \vals[0]~output_o\ : std_logic;
SIGNAL \vals[1]~output_o\ : std_logic;
SIGNAL \vals[2]~output_o\ : std_logic;
SIGNAL \vals[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \cs~input_o\ : std_logic;
SIGNAL \spi|cs_record[0]~feeder_combout\ : std_logic;
SIGNAL \spi|cs_record[1]~feeder_combout\ : std_logic;
SIGNAL \spi|cs_record[2]~feeder_combout\ : std_logic;
SIGNAL \spi|bitcounter~10_combout\ : std_logic;
SIGNAL \sck~input_o\ : std_logic;
SIGNAL \spi|sck_record[0]~feeder_combout\ : std_logic;
SIGNAL \spi|data_transfer~0_combout\ : std_logic;
SIGNAL \spi|bitcounter~13_combout\ : std_logic;
SIGNAL \spi|bitcounter~12_combout\ : std_logic;
SIGNAL \spi|bitcounter~14_combout\ : std_logic;
SIGNAL \spi|out_bitcounter~5_combout\ : std_logic;
SIGNAL \spi|Add0~0_combout\ : std_logic;
SIGNAL \spi|bitcounter~15_combout\ : std_logic;
SIGNAL \spi|bitcounter~11_combout\ : std_logic;
SIGNAL \spi|current_state~0_combout\ : std_logic;
SIGNAL \spi|current_state~1_combout\ : std_logic;
SIGNAL \spi|current_state~2_combout\ : std_logic;
SIGNAL \spi|current_state~q\ : std_logic;
SIGNAL \spi|out_bitcounter~0_combout\ : std_logic;
SIGNAL \spi|out_bitcounter~3_combout\ : std_logic;
SIGNAL \spi|Add1~0_combout\ : std_logic;
SIGNAL \spi|out_bitcounter[2]~4_combout\ : std_logic;
SIGNAL \spi|Add1~1_combout\ : std_logic;
SIGNAL \spi|out_bitcounter[3]~6_combout\ : std_logic;
SIGNAL \spi|LessThan1~0_combout\ : std_logic;
SIGNAL \spi|out_bitcounter~1_combout\ : std_logic;
SIGNAL \spi|out_bitcounter[1]~2_combout\ : std_logic;
SIGNAL \spi|tx_reg_empty~0_combout\ : std_logic;
SIGNAL \spi|tx_reg_empty~q\ : std_logic;
SIGNAL \spi|tx_reg[7]~0_combout\ : std_logic;
SIGNAL \spi|tx_empty~0_combout\ : std_logic;
SIGNAL \spi|tx_empty~q\ : std_logic;
SIGNAL \spi|in_data_ready~feeder_combout\ : std_logic;
SIGNAL \spi|in_data_ready~q\ : std_logic;
SIGNAL \sr_clk~0_combout\ : std_logic;
SIGNAL \sr_clk~q\ : std_logic;
SIGNAL \sr_clk~clkctrl_outclk\ : std_logic;
SIGNAL \mosi~input_o\ : std_logic;
SIGNAL \spi|in_reg~4_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[2]~0_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[0]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[0]~feeder_combout\ : std_logic;
SIGNAL \spi|Equal0~0_combout\ : std_logic;
SIGNAL \spi|in_reg~5_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[1]~q\ : std_logic;
SIGNAL \spi|in_reg~6_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[2]~q\ : std_logic;
SIGNAL \spi|in_reg~7_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[3]~q\ : std_logic;
SIGNAL \spi|in_reg~0_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[4]~q\ : std_logic;
SIGNAL \spi|in_reg~1_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[5]~q\ : std_logic;
SIGNAL \spi|in_reg~2_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[6]~q\ : std_logic;
SIGNAL \spi|in_reg~3_combout\ : std_logic;
SIGNAL \spi|data_transfer:in_reg[7]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[7]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][7]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][7]~q\ : std_logic;
SIGNAL \mem|sr_data~20_combout\ : std_logic;
SIGNAL \mem|count[1]~1_combout\ : std_logic;
SIGNAL \mem|count[0]~2_combout\ : std_logic;
SIGNAL \mem|count[2]~0_combout\ : std_logic;
SIGNAL \mem|sr_data[0][1]~1_combout\ : std_logic;
SIGNAL \mem|sr_data[2][7]~q\ : std_logic;
SIGNAL \mem|sr_data~4_combout\ : std_logic;
SIGNAL \mem|sr_data[1][7]~q\ : std_logic;
SIGNAL \mem|sr_data~12_combout\ : std_logic;
SIGNAL \mem|sr_data[0][7]~q\ : std_logic;
SIGNAL \sr_read_en~0_combout\ : std_logic;
SIGNAL \mem|sr_data[3][5]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][5]~q\ : std_logic;
SIGNAL \mem|sr_data~18_combout\ : std_logic;
SIGNAL \mem|sr_data[2][5]~q\ : std_logic;
SIGNAL \mem|sr_data~2_combout\ : std_logic;
SIGNAL \mem|sr_data[1][5]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[5]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data~10_combout\ : std_logic;
SIGNAL \mem|sr_data[0][5]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[4]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][4]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][4]~q\ : std_logic;
SIGNAL \mem|sr_data~17_combout\ : std_logic;
SIGNAL \mem|sr_data[2][4]~q\ : std_logic;
SIGNAL \mem|sr_data~0_combout\ : std_logic;
SIGNAL \mem|sr_data[1][4]~q\ : std_logic;
SIGNAL \mem|sr_data~9_combout\ : std_logic;
SIGNAL \mem|sr_data[0][4]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[3]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][3]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][3]~q\ : std_logic;
SIGNAL \mem|sr_data~24_combout\ : std_logic;
SIGNAL \mem|sr_data[2][3]~q\ : std_logic;
SIGNAL \mem|sr_data~8_combout\ : std_logic;
SIGNAL \mem|sr_data[1][3]~q\ : std_logic;
SIGNAL \mem|sr_data~16_combout\ : std_logic;
SIGNAL \mem|sr_data[0][3]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[6]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][6]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][6]~q\ : std_logic;
SIGNAL \mem|sr_data~19_combout\ : std_logic;
SIGNAL \mem|sr_data[2][6]~q\ : std_logic;
SIGNAL \mem|sr_data~3_combout\ : std_logic;
SIGNAL \mem|sr_data[1][6]~q\ : std_logic;
SIGNAL \mem|sr_data~11_combout\ : std_logic;
SIGNAL \mem|sr_data[0][6]~q\ : std_logic;
SIGNAL \check_end_tx~1_combout\ : std_logic;
SIGNAL \sr_read_en~1_combout\ : std_logic;
SIGNAL \sr_read_en~feeder_combout\ : std_logic;
SIGNAL \sr_read_en~q\ : std_logic;
SIGNAL \mem|sr_data[3][0]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][0]~q\ : std_logic;
SIGNAL \mem|sr_data~21_combout\ : std_logic;
SIGNAL \mem|sr_data[2][0]~q\ : std_logic;
SIGNAL \mem|sr_data~5_combout\ : std_logic;
SIGNAL \mem|sr_data[1][0]~q\ : std_logic;
SIGNAL \mem|sr_data~13_combout\ : std_logic;
SIGNAL \mem|sr_data[0][0]~q\ : std_logic;
SIGNAL \mem|sr_data[3][1]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][1]~q\ : std_logic;
SIGNAL \mem|sr_data~22_combout\ : std_logic;
SIGNAL \mem|sr_data[2][1]~q\ : std_logic;
SIGNAL \mem|sr_data~6_combout\ : std_logic;
SIGNAL \mem|sr_data[1][1]~q\ : std_logic;
SIGNAL \spi|input_shiftreg[1]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data~14_combout\ : std_logic;
SIGNAL \mem|sr_data[0][1]~q\ : std_logic;
SIGNAL \mem|sr_data[3][2]~feeder_combout\ : std_logic;
SIGNAL \mem|sr_data[3][2]~q\ : std_logic;
SIGNAL \mem|sr_data~23_combout\ : std_logic;
SIGNAL \mem|sr_data[2][2]~q\ : std_logic;
SIGNAL \mem|sr_data~7_combout\ : std_logic;
SIGNAL \mem|sr_data[1][2]~q\ : std_logic;
SIGNAL \mem|sr_data~15_combout\ : std_logic;
SIGNAL \mem|sr_data[0][2]~q\ : std_logic;
SIGNAL \check_end_tx~0_combout\ : std_logic;
SIGNAL \tx_mode_active~0_combout\ : std_logic;
SIGNAL \tx_mode_active~q\ : std_logic;
SIGNAL \check_end_tx~2_combout\ : std_logic;
SIGNAL \out_data_ready~q\ : std_logic;
SIGNAL \spi|out_reg~3_combout\ : std_logic;
SIGNAL \spi|out_reg[0]~1_combout\ : std_logic;
SIGNAL \spi|out_reg~2_combout\ : std_logic;
SIGNAL \spi|tx_reg[5]~feeder_combout\ : std_logic;
SIGNAL \spi|Mux0~0_combout\ : std_logic;
SIGNAL \spi|out_reg~4_combout\ : std_logic;
SIGNAL \spi|out_reg~0_combout\ : std_logic;
SIGNAL \spi|Mux0~1_combout\ : std_logic;
SIGNAL \spi|out_reg~5_combout\ : std_logic;
SIGNAL \spi|tx_reg[2]~feeder_combout\ : std_logic;
SIGNAL \spi|out_reg~8_combout\ : std_logic;
SIGNAL \spi|out_reg~7_combout\ : std_logic;
SIGNAL \spi|out_reg~6_combout\ : std_logic;
SIGNAL \spi|tx_reg[1]~feeder_combout\ : std_logic;
SIGNAL \spi|Mux0~2_combout\ : std_logic;
SIGNAL \spi|Mux0~3_combout\ : std_logic;
SIGNAL \spi|Mux0~4_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_outclk\ : std_logic;
SIGNAL \display|seg_select[1]~feeder_combout\ : std_logic;
SIGNAL \display|seg_select~1_combout\ : std_logic;
SIGNAL \display|seg_select~0_combout\ : std_logic;
SIGNAL \display|seg_select~2_combout\ : std_logic;
SIGNAL \display|Mux6~0_combout\ : std_logic;
SIGNAL \display|s0|Mux6~0_combout\ : std_logic;
SIGNAL \display|Mux6~1_combout\ : std_logic;
SIGNAL \display|s2|Mux6~0_combout\ : std_logic;
SIGNAL \display|s1|Mux6~0_combout\ : std_logic;
SIGNAL \display|Mux7~0_combout\ : std_logic;
SIGNAL \display|s3|Mux6~0_combout\ : std_logic;
SIGNAL \display|Mux7~1_combout\ : std_logic;
SIGNAL \display|s0|Mux5~0_combout\ : std_logic;
SIGNAL \display|s3|Mux5~0_combout\ : std_logic;
SIGNAL \display|s1|Mux5~0_combout\ : std_logic;
SIGNAL \display|Mux6~2_combout\ : std_logic;
SIGNAL \display|s2|Mux5~0_combout\ : std_logic;
SIGNAL \display|Mux6~3_combout\ : std_logic;
SIGNAL \display|s2|Mux4~0_combout\ : std_logic;
SIGNAL \display|s1|Mux4~0_combout\ : std_logic;
SIGNAL \display|Mux5~0_combout\ : std_logic;
SIGNAL \display|s3|Mux4~0_combout\ : std_logic;
SIGNAL \display|s0|Mux4~0_combout\ : std_logic;
SIGNAL \display|Mux5~1_combout\ : std_logic;
SIGNAL \display|s2|Mux3~0_combout\ : std_logic;
SIGNAL \display|s3|Mux3~0_combout\ : std_logic;
SIGNAL \display|s1|Mux3~0_combout\ : std_logic;
SIGNAL \display|Mux4~0_combout\ : std_logic;
SIGNAL \display|s0|Mux3~0_combout\ : std_logic;
SIGNAL \display|Mux4~1_combout\ : std_logic;
SIGNAL \display|s2|Mux2~0_combout\ : std_logic;
SIGNAL \display|s1|Mux2~0_combout\ : std_logic;
SIGNAL \display|Mux3~0_combout\ : std_logic;
SIGNAL \display|s3|Mux2~0_combout\ : std_logic;
SIGNAL \display|s0|Mux2~0_combout\ : std_logic;
SIGNAL \display|Mux3~1_combout\ : std_logic;
SIGNAL \display|s0|Mux1~0_combout\ : std_logic;
SIGNAL \display|s1|Mux1~0_combout\ : std_logic;
SIGNAL \display|s3|Mux1~0_combout\ : std_logic;
SIGNAL \display|Mux2~0_combout\ : std_logic;
SIGNAL \display|s2|Mux1~0_combout\ : std_logic;
SIGNAL \display|Mux2~1_combout\ : std_logic;
SIGNAL \display|s1|Mux0~0_combout\ : std_logic;
SIGNAL \display|s2|Mux0~0_combout\ : std_logic;
SIGNAL \display|Mux1~0_combout\ : std_logic;
SIGNAL \display|s0|Mux0~0_combout\ : std_logic;
SIGNAL \display|s3|Mux0~0_combout\ : std_logic;
SIGNAL \display|Mux1~1_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \spi|input_shiftreg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \spi|tx_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \spi|out_bitcounter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \spi|cs_record\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \display|seg_select\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \spi|out_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \spi|sck_record\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \mem|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \spi|bitcounter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_sr_read_en~q\ : std_logic;
SIGNAL \ALT_INV_out_data_ready~q\ : std_logic;
SIGNAL \ALT_INV_tx_mode_active~q\ : std_logic;
SIGNAL \display|ALT_INV_seg_select\ : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

miso <= ww_miso;
ww_mosi <= mosi;
ww_cs <= cs;
ww_sck <= sck;
ww_clk <= clk;
seg_select <= ww_seg_select;
segments <= ww_segments;
vals <= ww_vals;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\sr_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sr_clk~q\);

\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16));

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clk~inputclkctrl_outclk\ <= NOT \clk~inputclkctrl_outclk\;
\ALT_INV_sr_read_en~q\ <= NOT \sr_read_en~q\;
\ALT_INV_out_data_ready~q\ <= NOT \out_data_ready~q\;
\ALT_INV_tx_mode_active~q\ <= NOT \tx_mode_active~q\;
\display|ALT_INV_seg_select\(3) <= NOT \display|seg_select\(3);
\display|ALT_INV_seg_select\(2) <= NOT \display|seg_select\(2);
\display|ALT_INV_seg_select\(1) <= NOT \display|seg_select\(1);
\display|ALT_INV_seg_select\(0) <= NOT \display|seg_select\(0);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y17_N2
\miso~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \spi|Mux0~4_combout\,
	devoe => ww_devoe,
	o => \miso~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\seg_select[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_seg_select\(0),
	devoe => ww_devoe,
	o => \seg_select[0]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\seg_select[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_seg_select\(1),
	devoe => ww_devoe,
	o => \seg_select[1]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\seg_select[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_seg_select\(2),
	devoe => ww_devoe,
	o => \seg_select[2]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\seg_select[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|ALT_INV_seg_select\(3),
	devoe => ww_devoe,
	o => \seg_select[3]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\segments[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux7~1_combout\,
	devoe => ww_devoe,
	o => \segments[0]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\segments[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux6~3_combout\,
	devoe => ww_devoe,
	o => \segments[1]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\segments[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \segments[2]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\segments[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \segments[3]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\segments[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux3~1_combout\,
	devoe => ww_devoe,
	o => \segments[4]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\segments[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux2~1_combout\,
	devoe => ww_devoe,
	o => \segments[5]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\segments[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|Mux1~1_combout\,
	devoe => ww_devoe,
	o => \segments[6]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\segments[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \segments[7]~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\vals[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \spi|tx_empty~q\,
	devoe => ww_devoe,
	o => \vals[0]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\vals[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_tx_mode_active~q\,
	devoe => ww_devoe,
	o => \vals[1]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\vals[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_out_data_ready~q\,
	devoe => ww_devoe,
	o => \vals[2]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\vals[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_sr_read_en~q\,
	devoe => ww_devoe,
	o => \vals[3]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
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

-- Location: IOIBUF_X34_Y3_N22
\cs~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cs,
	o => \cs~input_o\);

-- Location: LCCOMB_X30_Y16_N8
\spi|cs_record[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|cs_record[0]~feeder_combout\ = \cs~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \cs~input_o\,
	combout => \spi|cs_record[0]~feeder_combout\);

-- Location: FF_X30_Y16_N9
\spi|cs_record[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|cs_record[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|cs_record\(0));

-- Location: LCCOMB_X30_Y16_N24
\spi|cs_record[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|cs_record[1]~feeder_combout\ = \spi|cs_record\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|cs_record\(0),
	combout => \spi|cs_record[1]~feeder_combout\);

-- Location: FF_X30_Y16_N25
\spi|cs_record[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|cs_record[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|cs_record\(1));

-- Location: LCCOMB_X30_Y15_N2
\spi|cs_record[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|cs_record[2]~feeder_combout\ = \spi|cs_record\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|cs_record\(1),
	combout => \spi|cs_record[2]~feeder_combout\);

-- Location: FF_X30_Y15_N3
\spi|cs_record[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|cs_record[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|cs_record\(2));

-- Location: LCCOMB_X30_Y16_N30
\spi|bitcounter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~10_combout\ = \spi|cs_record\(1) $ (!\spi|cs_record\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(1),
	datac => \spi|cs_record\(2),
	combout => \spi|bitcounter~10_combout\);

-- Location: IOIBUF_X30_Y0_N1
\sck~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sck,
	o => \sck~input_o\);

-- Location: LCCOMB_X30_Y16_N16
\spi|sck_record[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|sck_record[0]~feeder_combout\ = \sck~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sck~input_o\,
	combout => \spi|sck_record[0]~feeder_combout\);

-- Location: FF_X30_Y16_N17
\spi|sck_record[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|sck_record[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|sck_record\(0));

-- Location: FF_X30_Y16_N19
\spi|sck_record[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|sck_record\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|sck_record\(1));

-- Location: FF_X30_Y16_N5
\spi|sck_record[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|sck_record\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|sck_record\(2));

-- Location: LCCOMB_X30_Y16_N4
\spi|data_transfer~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|data_transfer~0_combout\ = (\spi|sck_record\(1) & (!\spi|sck_record\(2) & \spi|current_state~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|sck_record\(1),
	datac => \spi|sck_record\(2),
	datad => \spi|current_state~q\,
	combout => \spi|data_transfer~0_combout\);

-- Location: LCCOMB_X30_Y16_N10
\spi|bitcounter~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~13_combout\ = (\spi|cs_record\(1) & (\spi|cs_record\(2) & (\spi|data_transfer~0_combout\ $ (\spi|bitcounter\(0))))) # (!\spi|cs_record\(1) & (!\spi|cs_record\(2) & (\spi|data_transfer~0_combout\ $ (\spi|bitcounter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(1),
	datab => \spi|data_transfer~0_combout\,
	datac => \spi|bitcounter\(0),
	datad => \spi|cs_record\(2),
	combout => \spi|bitcounter~13_combout\);

-- Location: FF_X30_Y16_N11
\spi|bitcounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(0));

-- Location: LCCOMB_X30_Y16_N26
\spi|bitcounter~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~12_combout\ = (\spi|cs_record\(1) & (\spi|cs_record\(2) & (\spi|bitcounter\(1) $ (\spi|bitcounter\(0))))) # (!\spi|cs_record\(1) & (!\spi|cs_record\(2) & (\spi|bitcounter\(1) $ (\spi|bitcounter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(1),
	datab => \spi|cs_record\(2),
	datac => \spi|bitcounter\(1),
	datad => \spi|bitcounter\(0),
	combout => \spi|bitcounter~12_combout\);

-- Location: LCCOMB_X30_Y16_N0
\spi|bitcounter~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~14_combout\ = ((\spi|current_state~q\ & (!\spi|sck_record\(2) & \spi|sck_record\(1)))) # (!\spi|bitcounter~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter~10_combout\,
	datab => \spi|current_state~q\,
	datac => \spi|sck_record\(2),
	datad => \spi|sck_record\(1),
	combout => \spi|bitcounter~14_combout\);

-- Location: FF_X30_Y16_N27
\spi|bitcounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~12_combout\,
	ena => \spi|bitcounter~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(1));

-- Location: LCCOMB_X30_Y15_N14
\spi|out_bitcounter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter~5_combout\ = \spi|cs_record\(2) $ (\spi|cs_record\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|out_bitcounter~5_combout\);

-- Location: LCCOMB_X30_Y16_N14
\spi|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Add0~0_combout\ = (\spi|bitcounter\(1) & \spi|bitcounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|bitcounter\(1),
	datad => \spi|bitcounter\(0),
	combout => \spi|Add0~0_combout\);

-- Location: LCCOMB_X30_Y16_N12
\spi|bitcounter~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~15_combout\ = (!\spi|out_bitcounter~5_combout\ & (\spi|bitcounter\(2) $ (((\spi|bitcounter\(0) & \spi|bitcounter\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter\(0),
	datab => \spi|bitcounter\(1),
	datac => \spi|bitcounter\(2),
	datad => \spi|out_bitcounter~5_combout\,
	combout => \spi|bitcounter~15_combout\);

-- Location: FF_X30_Y16_N13
\spi|bitcounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~15_combout\,
	ena => \spi|bitcounter~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(2));

-- Location: LCCOMB_X30_Y16_N28
\spi|bitcounter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~11_combout\ = (!\spi|out_bitcounter~5_combout\ & (\spi|bitcounter\(3) $ (((\spi|Add0~0_combout\ & \spi|bitcounter\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter~5_combout\,
	datab => \spi|Add0~0_combout\,
	datac => \spi|bitcounter\(3),
	datad => \spi|bitcounter\(2),
	combout => \spi|bitcounter~11_combout\);

-- Location: FF_X30_Y16_N29
\spi|bitcounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~11_combout\,
	ena => \spi|bitcounter~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(3));

-- Location: LCCOMB_X30_Y16_N18
\spi|current_state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|current_state~0_combout\ = (!\spi|bitcounter\(0) & (!\spi|sck_record\(2) & (\spi|sck_record\(1) & \spi|current_state~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter\(0),
	datab => \spi|sck_record\(2),
	datac => \spi|sck_record\(1),
	datad => \spi|current_state~q\,
	combout => \spi|current_state~0_combout\);

-- Location: LCCOMB_X30_Y16_N6
\spi|current_state~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|current_state~1_combout\ = (!\spi|bitcounter\(1) & (\spi|bitcounter\(3) & (\spi|current_state~0_combout\ & !\spi|bitcounter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter\(1),
	datab => \spi|bitcounter\(3),
	datac => \spi|current_state~0_combout\,
	datad => \spi|bitcounter\(2),
	combout => \spi|current_state~1_combout\);

-- Location: LCCOMB_X30_Y16_N22
\spi|current_state~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|current_state~2_combout\ = (\spi|cs_record\(1) & (\spi|cs_record\(2) & (\spi|current_state~q\ $ (\spi|current_state~1_combout\)))) # (!\spi|cs_record\(1) & ((\spi|cs_record\(2)) # (\spi|current_state~q\ $ (\spi|current_state~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110111010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(1),
	datab => \spi|cs_record\(2),
	datac => \spi|current_state~q\,
	datad => \spi|current_state~1_combout\,
	combout => \spi|current_state~2_combout\);

-- Location: FF_X30_Y16_N23
\spi|current_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|current_state~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|current_state~q\);

-- Location: LCCOMB_X30_Y16_N20
\spi|out_bitcounter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter~0_combout\ = (!\spi|sck_record\(1) & (\spi|sck_record\(2) & \spi|current_state~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|sck_record\(1),
	datac => \spi|sck_record\(2),
	datad => \spi|current_state~q\,
	combout => \spi|out_bitcounter~0_combout\);

-- Location: LCCOMB_X30_Y15_N6
\spi|out_bitcounter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter~3_combout\ = (\spi|out_bitcounter\(0) $ (((\spi|out_bitcounter~0_combout\ & \spi|LessThan1~0_combout\)))) # (!\spi|bitcounter~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter~10_combout\,
	datab => \spi|out_bitcounter~0_combout\,
	datac => \spi|out_bitcounter\(0),
	datad => \spi|LessThan1~0_combout\,
	combout => \spi|out_bitcounter~3_combout\);

-- Location: FF_X30_Y15_N7
\spi|out_bitcounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_bitcounter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_bitcounter\(0));

-- Location: LCCOMB_X30_Y15_N20
\spi|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Add1~0_combout\ = \spi|out_bitcounter\(2) $ (((\spi|out_bitcounter\(0)) # (\spi|out_bitcounter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(0),
	datab => \spi|out_bitcounter\(2),
	datad => \spi|out_bitcounter\(1),
	combout => \spi|Add1~0_combout\);

-- Location: LCCOMB_X30_Y15_N28
\spi|out_bitcounter[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter[2]~4_combout\ = (\spi|out_bitcounter~1_combout\ & (((!\spi|Add1~0_combout\)) # (!\spi|bitcounter~10_combout\))) # (!\spi|out_bitcounter~1_combout\ & (((\spi|out_bitcounter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter~10_combout\,
	datab => \spi|Add1~0_combout\,
	datac => \spi|out_bitcounter\(2),
	datad => \spi|out_bitcounter~1_combout\,
	combout => \spi|out_bitcounter[2]~4_combout\);

-- Location: FF_X30_Y15_N29
\spi|out_bitcounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_bitcounter[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_bitcounter\(2));

-- Location: LCCOMB_X30_Y15_N16
\spi|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Add1~1_combout\ = \spi|out_bitcounter\(3) $ (((\spi|out_bitcounter\(0)) # ((\spi|out_bitcounter\(2)) # (\spi|out_bitcounter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(0),
	datab => \spi|out_bitcounter\(2),
	datac => \spi|out_bitcounter\(3),
	datad => \spi|out_bitcounter\(1),
	combout => \spi|Add1~1_combout\);

-- Location: LCCOMB_X30_Y15_N22
\spi|out_bitcounter[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter[3]~6_combout\ = (\spi|out_bitcounter~1_combout\ & (!\spi|Add1~1_combout\ & (!\spi|out_bitcounter~5_combout\))) # (!\spi|out_bitcounter~1_combout\ & (((\spi|out_bitcounter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|Add1~1_combout\,
	datab => \spi|out_bitcounter~5_combout\,
	datac => \spi|out_bitcounter\(3),
	datad => \spi|out_bitcounter~1_combout\,
	combout => \spi|out_bitcounter[3]~6_combout\);

-- Location: FF_X30_Y15_N23
\spi|out_bitcounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_bitcounter[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_bitcounter\(3));

-- Location: LCCOMB_X30_Y15_N8
\spi|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|LessThan1~0_combout\ = (\spi|out_bitcounter\(0)) # ((\spi|out_bitcounter\(2)) # ((\spi|out_bitcounter\(3)) # (\spi|out_bitcounter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(0),
	datab => \spi|out_bitcounter\(2),
	datac => \spi|out_bitcounter\(3),
	datad => \spi|out_bitcounter\(1),
	combout => \spi|LessThan1~0_combout\);

-- Location: LCCOMB_X30_Y15_N18
\spi|out_bitcounter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter~1_combout\ = (\spi|LessThan1~0_combout\ & ((\spi|out_bitcounter~0_combout\) # (\spi|cs_record\(1) $ (\spi|cs_record\(2))))) # (!\spi|LessThan1~0_combout\ & (\spi|cs_record\(1) $ (((\spi|cs_record\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(1),
	datab => \spi|LessThan1~0_combout\,
	datac => \spi|out_bitcounter~0_combout\,
	datad => \spi|cs_record\(2),
	combout => \spi|out_bitcounter~1_combout\);

-- Location: LCCOMB_X30_Y15_N24
\spi|out_bitcounter[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_bitcounter[1]~2_combout\ = (\spi|out_bitcounter~1_combout\ & ((\spi|out_bitcounter\(1) $ (!\spi|out_bitcounter\(0))) # (!\spi|bitcounter~10_combout\))) # (!\spi|out_bitcounter~1_combout\ & (((\spi|out_bitcounter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter~10_combout\,
	datab => \spi|out_bitcounter~1_combout\,
	datac => \spi|out_bitcounter\(1),
	datad => \spi|out_bitcounter\(0),
	combout => \spi|out_bitcounter[1]~2_combout\);

-- Location: FF_X30_Y15_N25
\spi|out_bitcounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_bitcounter[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_bitcounter\(1));

-- Location: LCCOMB_X30_Y15_N12
\spi|tx_reg_empty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|tx_reg_empty~0_combout\ = (\out_data_ready~q\) # ((\spi|tx_reg_empty~q\ & ((\spi|cs_record\(1)) # (!\spi|cs_record\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(1),
	datab => \out_data_ready~q\,
	datac => \spi|tx_reg_empty~q\,
	datad => \spi|cs_record\(2),
	combout => \spi|tx_reg_empty~0_combout\);

-- Location: FF_X30_Y15_N13
\spi|tx_reg_empty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|tx_reg_empty~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg_empty~q\);

-- Location: LCCOMB_X31_Y15_N28
\spi|tx_reg[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|tx_reg[7]~0_combout\ = (\spi|cs_record\(2) & (\spi|tx_reg_empty~q\ & !\spi|cs_record\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(2),
	datab => \spi|tx_reg_empty~q\,
	datad => \spi|cs_record\(1),
	combout => \spi|tx_reg[7]~0_combout\);

-- Location: LCCOMB_X30_Y15_N26
\spi|tx_empty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|tx_empty~0_combout\ = (\out_data_ready~q\) # ((\spi|tx_empty~q\ & !\spi|tx_reg[7]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \out_data_ready~q\,
	datac => \spi|tx_empty~q\,
	datad => \spi|tx_reg[7]~0_combout\,
	combout => \spi|tx_empty~0_combout\);

-- Location: FF_X30_Y15_N27
\spi|tx_empty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|tx_empty~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_empty~q\);

-- Location: LCCOMB_X25_Y15_N28
\spi|in_data_ready~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_data_ready~feeder_combout\ = \spi|bitcounter\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|bitcounter\(3),
	combout => \spi|in_data_ready~feeder_combout\);

-- Location: FF_X25_Y15_N29
\spi|in_data_ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_data_ready~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|in_data_ready~q\);

-- Location: LCCOMB_X26_Y15_N4
\sr_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sr_clk~0_combout\ = (\tx_mode_active~q\ & (!\spi|tx_empty~q\ & ((\out_data_ready~q\)))) # (!\tx_mode_active~q\ & (((\spi|in_data_ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|tx_empty~q\,
	datab => \spi|in_data_ready~q\,
	datac => \out_data_ready~q\,
	datad => \tx_mode_active~q\,
	combout => \sr_clk~0_combout\);

-- Location: FF_X26_Y15_N5
sr_clk : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sr_clk~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr_clk~q\);

-- Location: CLKCTRL_G7
\sr_clk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sr_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sr_clk~clkctrl_outclk\);

-- Location: IOIBUF_X34_Y2_N22
\mosi~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mosi,
	o => \mosi~input_o\);

-- Location: LCCOMB_X29_Y16_N24
\spi|in_reg~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~4_combout\ = (\mosi~input_o\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|cs_record\(2),
	datac => \mosi~input_o\,
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~4_combout\);

-- Location: LCCOMB_X29_Y16_N28
\spi|data_transfer:in_reg[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|data_transfer:in_reg[2]~0_combout\ = (\spi|data_transfer~0_combout\ & ((\spi|cs_record\(1)) # (!\spi|cs_record\(2)))) # (!\spi|data_transfer~0_combout\ & (!\spi|cs_record\(2) & \spi|cs_record\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|data_transfer~0_combout\,
	datab => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|data_transfer:in_reg[2]~0_combout\);

-- Location: FF_X29_Y16_N25
\spi|data_transfer:in_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~4_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[0]~q\);

-- Location: LCCOMB_X29_Y16_N16
\spi|input_shiftreg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[0]~feeder_combout\ = \spi|data_transfer:in_reg[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|data_transfer:in_reg[0]~q\,
	combout => \spi|input_shiftreg[0]~feeder_combout\);

-- Location: LCCOMB_X29_Y16_N20
\spi|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Equal0~0_combout\ = (!\spi|cs_record\(2) & \spi|cs_record\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|Equal0~0_combout\);

-- Location: FF_X29_Y16_N17
\spi|input_shiftreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[0]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(0));

-- Location: LCCOMB_X29_Y16_N18
\spi|in_reg~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~5_combout\ = (\spi|data_transfer:in_reg[0]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|data_transfer:in_reg[0]~q\,
	datac => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~5_combout\);

-- Location: FF_X29_Y16_N19
\spi|data_transfer:in_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~5_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[1]~q\);

-- Location: LCCOMB_X29_Y16_N8
\spi|in_reg~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~6_combout\ = (\spi|data_transfer:in_reg[1]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|data_transfer:in_reg[1]~q\,
	datac => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~6_combout\);

-- Location: FF_X29_Y16_N9
\spi|data_transfer:in_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~6_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[2]~q\);

-- Location: LCCOMB_X29_Y16_N14
\spi|in_reg~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~7_combout\ = (\spi|data_transfer:in_reg[2]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|cs_record\(2),
	datac => \spi|data_transfer:in_reg[2]~q\,
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~7_combout\);

-- Location: FF_X29_Y16_N15
\spi|data_transfer:in_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~7_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[3]~q\);

-- Location: LCCOMB_X29_Y16_N30
\spi|in_reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~0_combout\ = (\spi|data_transfer:in_reg[3]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|data_transfer:in_reg[3]~q\,
	datac => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~0_combout\);

-- Location: FF_X29_Y16_N31
\spi|data_transfer:in_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~0_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[4]~q\);

-- Location: LCCOMB_X29_Y16_N26
\spi|in_reg~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~1_combout\ = (\spi|data_transfer:in_reg[4]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|cs_record\(2),
	datac => \spi|data_transfer:in_reg[4]~q\,
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~1_combout\);

-- Location: FF_X29_Y16_N27
\spi|data_transfer:in_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~1_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[5]~q\);

-- Location: LCCOMB_X29_Y16_N4
\spi|in_reg~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~2_combout\ = (\spi|data_transfer:in_reg[5]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|cs_record\(2),
	datac => \spi|data_transfer:in_reg[5]~q\,
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~2_combout\);

-- Location: FF_X29_Y16_N5
\spi|data_transfer:in_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~2_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[6]~q\);

-- Location: LCCOMB_X29_Y16_N10
\spi|in_reg~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|in_reg~3_combout\ = (\spi|data_transfer:in_reg[6]~q\ & ((\spi|cs_record\(2)) # (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|cs_record\(2),
	datac => \spi|data_transfer:in_reg[6]~q\,
	datad => \spi|cs_record\(1),
	combout => \spi|in_reg~3_combout\);

-- Location: FF_X29_Y16_N11
\spi|data_transfer:in_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|in_reg~3_combout\,
	ena => \spi|data_transfer:in_reg[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|data_transfer:in_reg[7]~q\);

-- Location: LCCOMB_X29_Y16_N6
\spi|input_shiftreg[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[7]~feeder_combout\ = \spi|data_transfer:in_reg[7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|data_transfer:in_reg[7]~q\,
	combout => \spi|input_shiftreg[7]~feeder_combout\);

-- Location: FF_X29_Y16_N7
\spi|input_shiftreg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[7]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(7));

-- Location: LCCOMB_X23_Y15_N22
\mem|sr_data[3][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][7]~feeder_combout\ = \mem|sr_data[2][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][7]~q\,
	combout => \mem|sr_data[3][7]~feeder_combout\);

-- Location: FF_X23_Y15_N23
\mem|sr_data[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][7]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][7]~q\);

-- Location: LCCOMB_X23_Y15_N10
\mem|sr_data~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~20_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[3][7]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[1][7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][7]~q\,
	datac => \mem|sr_data[3][7]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~20_combout\);

-- Location: LCCOMB_X24_Y15_N4
\mem|count[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|count[1]~1_combout\ = (\sr_read_en~q\ & ((\mem|count\(1) & ((\mem|count\(0)))) # (!\mem|count\(1) & (\mem|count\(2) & !\mem|count\(0))))) # (!\sr_read_en~q\ & (\mem|count\(1) $ (((!\mem|count\(2) & \mem|count\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|count\(2),
	datab => \sr_read_en~q\,
	datac => \mem|count\(1),
	datad => \mem|count\(0),
	combout => \mem|count[1]~1_combout\);

-- Location: FF_X24_Y15_N5
\mem|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|count[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|count\(1));

-- Location: LCCOMB_X24_Y15_N26
\mem|count[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|count[0]~2_combout\ = (\mem|count\(2) & (\sr_read_en~q\ $ ((\mem|count\(0))))) # (!\mem|count\(2) & (!\mem|count\(0) & ((\mem|count\(1)) # (!\sr_read_en~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|count\(2),
	datab => \sr_read_en~q\,
	datac => \mem|count\(0),
	datad => \mem|count\(1),
	combout => \mem|count[0]~2_combout\);

-- Location: FF_X24_Y15_N27
\mem|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|count[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|count\(0));

-- Location: LCCOMB_X24_Y15_N30
\mem|count[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|count[2]~0_combout\ = (\mem|count\(0) & ((\mem|count\(2)) # ((!\sr_read_en~q\ & \mem|count\(1))))) # (!\mem|count\(0) & (\mem|count\(2) & ((\mem|count\(1)) # (!\sr_read_en~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|count\(0),
	datab => \sr_read_en~q\,
	datac => \mem|count\(2),
	datad => \mem|count\(1),
	combout => \mem|count[2]~0_combout\);

-- Location: FF_X24_Y15_N31
\mem|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|count\(2));

-- Location: LCCOMB_X24_Y15_N12
\mem|sr_data[0][1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[0][1]~1_combout\ = (\mem|count\(2)) # ((\mem|count\(1)) # ((\mem|count\(0)) # (!\sr_read_en~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|count\(2),
	datab => \mem|count\(1),
	datac => \mem|count\(0),
	datad => \sr_read_en~q\,
	combout => \mem|sr_data[0][1]~1_combout\);

-- Location: FF_X23_Y15_N11
\mem|sr_data[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~20_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][7]~q\);

-- Location: LCCOMB_X23_Y15_N6
\mem|sr_data~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~4_combout\ = (\sr_read_en~q\ & (\mem|sr_data[2][7]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[0][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[2][7]~q\,
	datab => \sr_read_en~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \mem|sr_data~4_combout\);

-- Location: FF_X23_Y15_N7
\mem|sr_data[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~4_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][7]~q\);

-- Location: LCCOMB_X29_Y15_N10
\mem|sr_data~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~12_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[1][7]~q\))) # (!\sr_read_en~q\ & (\spi|input_shiftreg\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(7),
	datac => \mem|sr_data[1][7]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~12_combout\);

-- Location: FF_X29_Y15_N11
\mem|sr_data[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~12_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][7]~q\);

-- Location: LCCOMB_X25_Y15_N30
\sr_read_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sr_read_en~0_combout\ = (!\tx_mode_active~q\ & \mem|sr_data[0][7]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tx_mode_active~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \sr_read_en~0_combout\);

-- Location: LCCOMB_X23_Y15_N30
\mem|sr_data[3][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][5]~feeder_combout\ = \mem|sr_data[2][5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mem|sr_data[2][5]~q\,
	combout => \mem|sr_data[3][5]~feeder_combout\);

-- Location: FF_X23_Y15_N31
\mem|sr_data[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][5]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][5]~q\);

-- Location: LCCOMB_X23_Y15_N14
\mem|sr_data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~18_combout\ = (\sr_read_en~q\ & (\mem|sr_data[3][5]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[1][5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sr_read_en~q\,
	datac => \mem|sr_data[3][5]~q\,
	datad => \mem|sr_data[1][5]~q\,
	combout => \mem|sr_data~18_combout\);

-- Location: FF_X23_Y15_N15
\mem|sr_data[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~18_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][5]~q\);

-- Location: LCCOMB_X23_Y15_N18
\mem|sr_data~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~2_combout\ = (\sr_read_en~q\ & (\mem|sr_data[2][5]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[0][5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mem|sr_data[2][5]~q\,
	datac => \mem|sr_data[0][5]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~2_combout\);

-- Location: FF_X23_Y15_N19
\mem|sr_data[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~2_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][5]~q\);

-- Location: LCCOMB_X28_Y15_N16
\spi|input_shiftreg[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[5]~feeder_combout\ = \spi|data_transfer:in_reg[5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|data_transfer:in_reg[5]~q\,
	combout => \spi|input_shiftreg[5]~feeder_combout\);

-- Location: FF_X28_Y15_N17
\spi|input_shiftreg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[5]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(5));

-- Location: LCCOMB_X29_Y15_N18
\mem|sr_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~10_combout\ = (\sr_read_en~q\ & (\mem|sr_data[1][5]~q\)) # (!\sr_read_en~q\ & ((\spi|input_shiftreg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][5]~q\,
	datab => \spi|input_shiftreg\(5),
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~10_combout\);

-- Location: FF_X29_Y15_N19
\mem|sr_data[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~10_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][5]~q\);

-- Location: LCCOMB_X28_Y15_N14
\spi|input_shiftreg[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[4]~feeder_combout\ = \spi|data_transfer:in_reg[4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|data_transfer:in_reg[4]~q\,
	combout => \spi|input_shiftreg[4]~feeder_combout\);

-- Location: FF_X28_Y15_N15
\spi|input_shiftreg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[4]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(4));

-- Location: LCCOMB_X23_Y15_N4
\mem|sr_data[3][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][4]~feeder_combout\ = \mem|sr_data[2][4]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][4]~q\,
	combout => \mem|sr_data[3][4]~feeder_combout\);

-- Location: FF_X23_Y15_N5
\mem|sr_data[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][4]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][4]~q\);

-- Location: LCCOMB_X23_Y15_N20
\mem|sr_data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~17_combout\ = (\sr_read_en~q\ & (\mem|sr_data[3][4]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[1][4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sr_read_en~q\,
	datac => \mem|sr_data[3][4]~q\,
	datad => \mem|sr_data[1][4]~q\,
	combout => \mem|sr_data~17_combout\);

-- Location: FF_X23_Y15_N21
\mem|sr_data[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~17_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][4]~q\);

-- Location: LCCOMB_X23_Y15_N28
\mem|sr_data~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~0_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[2][4]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[0][4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sr_read_en~q\,
	datac => \mem|sr_data[0][4]~q\,
	datad => \mem|sr_data[2][4]~q\,
	combout => \mem|sr_data~0_combout\);

-- Location: FF_X23_Y15_N29
\mem|sr_data[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~0_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][4]~q\);

-- Location: LCCOMB_X29_Y15_N20
\mem|sr_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~9_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[1][4]~q\))) # (!\sr_read_en~q\ & (\spi|input_shiftreg\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(4),
	datac => \mem|sr_data[1][4]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~9_combout\);

-- Location: FF_X29_Y15_N21
\mem|sr_data[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~9_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][4]~q\);

-- Location: LCCOMB_X28_Y15_N18
\spi|input_shiftreg[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[3]~feeder_combout\ = \spi|data_transfer:in_reg[3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|data_transfer:in_reg[3]~q\,
	combout => \spi|input_shiftreg[3]~feeder_combout\);

-- Location: FF_X28_Y15_N19
\spi|input_shiftreg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[3]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(3));

-- Location: LCCOMB_X25_Y16_N22
\mem|sr_data[3][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][3]~feeder_combout\ = \mem|sr_data[2][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][3]~q\,
	combout => \mem|sr_data[3][3]~feeder_combout\);

-- Location: FF_X25_Y16_N23
\mem|sr_data[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][3]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][3]~q\);

-- Location: LCCOMB_X25_Y16_N2
\mem|sr_data~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~24_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[3][3]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[1][3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][3]~q\,
	datac => \mem|sr_data[3][3]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~24_combout\);

-- Location: FF_X25_Y16_N3
\mem|sr_data[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~24_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][3]~q\);

-- Location: LCCOMB_X25_Y16_N6
\mem|sr_data~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~8_combout\ = (\sr_read_en~q\ & (\mem|sr_data[2][3]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sr_read_en~q\,
	datab => \mem|sr_data[2][3]~q\,
	datac => \mem|sr_data[0][3]~q\,
	combout => \mem|sr_data~8_combout\);

-- Location: FF_X25_Y16_N7
\mem|sr_data[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~8_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][3]~q\);

-- Location: LCCOMB_X28_Y15_N24
\mem|sr_data~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~16_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[1][3]~q\))) # (!\sr_read_en~q\ & (\spi|input_shiftreg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(3),
	datac => \sr_read_en~q\,
	datad => \mem|sr_data[1][3]~q\,
	combout => \mem|sr_data~16_combout\);

-- Location: FF_X28_Y15_N25
\mem|sr_data[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~16_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][3]~q\);

-- Location: LCCOMB_X29_Y16_N12
\spi|input_shiftreg[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[6]~feeder_combout\ = \spi|data_transfer:in_reg[6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|data_transfer:in_reg[6]~q\,
	combout => \spi|input_shiftreg[6]~feeder_combout\);

-- Location: FF_X29_Y16_N13
\spi|input_shiftreg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[6]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(6));

-- Location: LCCOMB_X23_Y15_N8
\mem|sr_data[3][6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][6]~feeder_combout\ = \mem|sr_data[2][6]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][6]~q\,
	combout => \mem|sr_data[3][6]~feeder_combout\);

-- Location: FF_X23_Y15_N9
\mem|sr_data[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][6]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][6]~q\);

-- Location: LCCOMB_X23_Y15_N12
\mem|sr_data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~19_combout\ = (\sr_read_en~q\ & (\mem|sr_data[3][6]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[1][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sr_read_en~q\,
	datac => \mem|sr_data[3][6]~q\,
	datad => \mem|sr_data[1][6]~q\,
	combout => \mem|sr_data~19_combout\);

-- Location: FF_X23_Y15_N13
\mem|sr_data[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~19_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][6]~q\);

-- Location: LCCOMB_X23_Y15_N16
\mem|sr_data~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~3_combout\ = (\sr_read_en~q\ & (\mem|sr_data[2][6]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[0][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[2][6]~q\,
	datac => \mem|sr_data[0][6]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~3_combout\);

-- Location: FF_X23_Y15_N17
\mem|sr_data[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~3_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][6]~q\);

-- Location: LCCOMB_X29_Y15_N24
\mem|sr_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~11_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[1][6]~q\))) # (!\sr_read_en~q\ & (\spi|input_shiftreg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(6),
	datac => \mem|sr_data[1][6]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~11_combout\);

-- Location: FF_X29_Y15_N25
\mem|sr_data[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~11_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][6]~q\);

-- Location: LCCOMB_X25_Y15_N20
\check_end_tx~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \check_end_tx~1_combout\ = (\mem|sr_data[0][5]~q\ & (\mem|sr_data[0][4]~q\ & (\mem|sr_data[0][3]~q\ & \mem|sr_data[0][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][5]~q\,
	datab => \mem|sr_data[0][4]~q\,
	datac => \mem|sr_data[0][3]~q\,
	datad => \mem|sr_data[0][6]~q\,
	combout => \check_end_tx~1_combout\);

-- Location: LCCOMB_X25_Y15_N4
\sr_read_en~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sr_read_en~1_combout\ = (\sr_read_en~q\) # ((\check_end_tx~0_combout\ & (\sr_read_en~0_combout\ & \check_end_tx~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \check_end_tx~0_combout\,
	datab => \sr_read_en~q\,
	datac => \sr_read_en~0_combout\,
	datad => \check_end_tx~1_combout\,
	combout => \sr_read_en~1_combout\);

-- Location: LCCOMB_X24_Y15_N28
\sr_read_en~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \sr_read_en~feeder_combout\ = \sr_read_en~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sr_read_en~1_combout\,
	combout => \sr_read_en~feeder_combout\);

-- Location: FF_X24_Y15_N29
sr_read_en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \sr_read_en~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sr_read_en~q\);

-- Location: LCCOMB_X25_Y16_N8
\mem|sr_data[3][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][0]~feeder_combout\ = \mem|sr_data[2][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][0]~q\,
	combout => \mem|sr_data[3][0]~feeder_combout\);

-- Location: FF_X25_Y16_N9
\mem|sr_data[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][0]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][0]~q\);

-- Location: LCCOMB_X25_Y16_N16
\mem|sr_data~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~21_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[3][0]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[1][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sr_read_en~q\,
	datab => \mem|sr_data[1][0]~q\,
	datac => \mem|sr_data[3][0]~q\,
	combout => \mem|sr_data~21_combout\);

-- Location: FF_X25_Y16_N17
\mem|sr_data[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~21_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][0]~q\);

-- Location: LCCOMB_X25_Y16_N0
\mem|sr_data~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~5_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[2][0]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[0][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][0]~q\,
	datab => \mem|sr_data[2][0]~q\,
	datac => \sr_read_en~q\,
	combout => \mem|sr_data~5_combout\);

-- Location: FF_X25_Y16_N1
\mem|sr_data[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~5_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][0]~q\);

-- Location: LCCOMB_X29_Y15_N0
\mem|sr_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~13_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[1][0]~q\))) # (!\sr_read_en~q\ & (\spi|input_shiftreg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|input_shiftreg\(0),
	datac => \mem|sr_data[1][0]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~13_combout\);

-- Location: FF_X29_Y15_N1
\mem|sr_data[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~13_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][0]~q\);

-- Location: LCCOMB_X25_Y16_N14
\mem|sr_data[3][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][1]~feeder_combout\ = \mem|sr_data[2][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][1]~q\,
	combout => \mem|sr_data[3][1]~feeder_combout\);

-- Location: FF_X25_Y16_N15
\mem|sr_data[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][1]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][1]~q\);

-- Location: LCCOMB_X25_Y16_N10
\mem|sr_data~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~22_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[3][1]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[1][1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datac => \mem|sr_data[3][1]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~22_combout\);

-- Location: FF_X25_Y16_N11
\mem|sr_data[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~22_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][1]~q\);

-- Location: LCCOMB_X25_Y16_N30
\mem|sr_data~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~6_combout\ = (\sr_read_en~q\ & (\mem|sr_data[2][1]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[0][1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[2][1]~q\,
	datac => \mem|sr_data[0][1]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~6_combout\);

-- Location: FF_X25_Y16_N31
\mem|sr_data[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~6_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][1]~q\);

-- Location: LCCOMB_X29_Y16_N22
\spi|input_shiftreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[1]~feeder_combout\ = \spi|data_transfer:in_reg[1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|data_transfer:in_reg[1]~q\,
	combout => \spi|input_shiftreg[1]~feeder_combout\);

-- Location: FF_X29_Y16_N23
\spi|input_shiftreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[1]~feeder_combout\,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(1));

-- Location: LCCOMB_X29_Y15_N2
\mem|sr_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~14_combout\ = (\sr_read_en~q\ & (\mem|sr_data[1][1]~q\)) # (!\sr_read_en~q\ & ((\spi|input_shiftreg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mem|sr_data[1][1]~q\,
	datac => \spi|input_shiftreg\(1),
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~14_combout\);

-- Location: FF_X29_Y15_N3
\mem|sr_data[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~14_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][1]~q\);

-- Location: LCCOMB_X25_Y16_N4
\mem|sr_data[3][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data[3][2]~feeder_combout\ = \mem|sr_data[2][2]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|sr_data[2][2]~q\,
	combout => \mem|sr_data[3][2]~feeder_combout\);

-- Location: FF_X25_Y16_N5
\mem|sr_data[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data[3][2]~feeder_combout\,
	ena => \ALT_INV_sr_read_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[3][2]~q\);

-- Location: LCCOMB_X25_Y16_N24
\mem|sr_data~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~23_combout\ = (\sr_read_en~q\ & ((\mem|sr_data[3][2]~q\))) # (!\sr_read_en~q\ & (\mem|sr_data[1][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[3][2]~q\,
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~23_combout\);

-- Location: FF_X25_Y16_N25
\mem|sr_data[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~23_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[2][2]~q\);

-- Location: LCCOMB_X25_Y16_N12
\mem|sr_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~7_combout\ = (\sr_read_en~q\ & (\mem|sr_data[2][2]~q\)) # (!\sr_read_en~q\ & ((\mem|sr_data[0][2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sr_read_en~q\,
	datab => \mem|sr_data[2][2]~q\,
	datac => \mem|sr_data[0][2]~q\,
	combout => \mem|sr_data~7_combout\);

-- Location: FF_X25_Y16_N13
\mem|sr_data[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~7_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[1][2]~q\);

-- Location: FF_X29_Y16_N29
\spi|input_shiftreg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|data_transfer:in_reg[2]~q\,
	sload => VCC,
	ena => \spi|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(2));

-- Location: LCCOMB_X29_Y15_N8
\mem|sr_data~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \mem|sr_data~15_combout\ = (\sr_read_en~q\ & (\mem|sr_data[1][2]~q\)) # (!\sr_read_en~q\ & ((\spi|input_shiftreg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][2]~q\,
	datab => \spi|input_shiftreg\(2),
	datad => \sr_read_en~q\,
	combout => \mem|sr_data~15_combout\);

-- Location: FF_X29_Y15_N9
\mem|sr_data[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sr_clk~clkctrl_outclk\,
	d => \mem|sr_data~15_combout\,
	ena => \mem|sr_data[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|sr_data[0][2]~q\);

-- Location: LCCOMB_X25_Y15_N26
\check_end_tx~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \check_end_tx~0_combout\ = (\mem|sr_data[0][0]~q\ & (\mem|sr_data[0][1]~q\ & (\mem|sr_data[0][2]~q\ & \spi|in_data_ready~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][0]~q\,
	datab => \mem|sr_data[0][1]~q\,
	datac => \mem|sr_data[0][2]~q\,
	datad => \spi|in_data_ready~q\,
	combout => \check_end_tx~0_combout\);

-- Location: LCCOMB_X25_Y15_N14
\tx_mode_active~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \tx_mode_active~0_combout\ = (\tx_mode_active~q\) # ((\check_end_tx~0_combout\ & (\mem|sr_data[0][7]~q\ & \check_end_tx~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \check_end_tx~0_combout\,
	datab => \mem|sr_data[0][7]~q\,
	datac => \tx_mode_active~q\,
	datad => \check_end_tx~1_combout\,
	combout => \tx_mode_active~0_combout\);

-- Location: FF_X25_Y15_N15
tx_mode_active : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \tx_mode_active~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_mode_active~q\);

-- Location: LCCOMB_X30_Y15_N4
\check_end_tx~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \check_end_tx~2_combout\ = (\tx_mode_active~q\ & !\spi|tx_empty~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_mode_active~q\,
	datac => \spi|tx_empty~q\,
	combout => \check_end_tx~2_combout\);

-- Location: FF_X30_Y15_N5
out_data_ready : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \check_end_tx~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \out_data_ready~q\);

-- Location: LCCOMB_X29_Y15_N30
\spi|out_reg~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~3_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][4]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][4]~q\,
	combout => \spi|out_reg~3_combout\);

-- Location: LCCOMB_X29_Y15_N14
\spi|out_reg[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg[0]~1_combout\ = (\out_data_ready~q\) # ((\spi|cs_record\(2) & (\spi|tx_reg_empty~q\ & !\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(2),
	datab => \spi|tx_reg_empty~q\,
	datac => \spi|cs_record\(1),
	datad => \out_data_ready~q\,
	combout => \spi|out_reg[0]~1_combout\);

-- Location: FF_X29_Y15_N31
\spi|out_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~3_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(4));

-- Location: FF_X31_Y15_N25
\spi|tx_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|out_reg\(4),
	sload => VCC,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(4));

-- Location: LCCOMB_X29_Y15_N16
\spi|out_reg~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~2_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][5]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][5]~q\,
	combout => \spi|out_reg~2_combout\);

-- Location: FF_X29_Y15_N17
\spi|out_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~2_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(5));

-- Location: LCCOMB_X31_Y15_N18
\spi|tx_reg[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|tx_reg[5]~feeder_combout\ = \spi|out_reg\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|out_reg\(5),
	combout => \spi|tx_reg[5]~feeder_combout\);

-- Location: FF_X31_Y15_N19
\spi|tx_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|tx_reg[5]~feeder_combout\,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(5));

-- Location: LCCOMB_X31_Y15_N24
\spi|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Mux0~0_combout\ = (\spi|out_bitcounter\(1) & (\spi|out_bitcounter\(0))) # (!\spi|out_bitcounter\(1) & ((\spi|out_bitcounter\(0) & ((\spi|tx_reg\(5)))) # (!\spi|out_bitcounter\(0) & (\spi|tx_reg\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(1),
	datab => \spi|out_bitcounter\(0),
	datac => \spi|tx_reg\(4),
	datad => \spi|tx_reg\(5),
	combout => \spi|Mux0~0_combout\);

-- Location: LCCOMB_X29_Y15_N28
\spi|out_reg~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~4_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][7]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \spi|out_reg~4_combout\);

-- Location: FF_X29_Y15_N29
\spi|out_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~4_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(7));

-- Location: FF_X31_Y15_N27
\spi|tx_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|out_reg\(7),
	sload => VCC,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(7));

-- Location: LCCOMB_X29_Y15_N22
\spi|out_reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~0_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][6]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][6]~q\,
	combout => \spi|out_reg~0_combout\);

-- Location: FF_X29_Y15_N23
\spi|out_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~0_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(6));

-- Location: FF_X31_Y15_N29
\spi|tx_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|out_reg\(6),
	sload => VCC,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(6));

-- Location: LCCOMB_X31_Y15_N26
\spi|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Mux0~1_combout\ = (\spi|out_bitcounter\(1) & ((\spi|Mux0~0_combout\ & (\spi|tx_reg\(7))) # (!\spi|Mux0~0_combout\ & ((\spi|tx_reg\(6)))))) # (!\spi|out_bitcounter\(1) & (\spi|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(1),
	datab => \spi|Mux0~0_combout\,
	datac => \spi|tx_reg\(7),
	datad => \spi|tx_reg\(6),
	combout => \spi|Mux0~1_combout\);

-- Location: LCCOMB_X29_Y15_N26
\spi|out_reg~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~5_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][2]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datac => \mem|sr_data[0][2]~q\,
	combout => \spi|out_reg~5_combout\);

-- Location: FF_X29_Y15_N27
\spi|out_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~5_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(2));

-- Location: LCCOMB_X31_Y15_N16
\spi|tx_reg[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|tx_reg[2]~feeder_combout\ = \spi|out_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|out_reg\(2),
	combout => \spi|tx_reg[2]~feeder_combout\);

-- Location: FF_X31_Y15_N17
\spi|tx_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|tx_reg[2]~feeder_combout\,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(2));

-- Location: LCCOMB_X29_Y15_N4
\spi|out_reg~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~8_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][3]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][3]~q\,
	combout => \spi|out_reg~8_combout\);

-- Location: FF_X29_Y15_N5
\spi|out_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~8_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(3));

-- Location: FF_X31_Y15_N23
\spi|tx_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|out_reg\(3),
	sload => VCC,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(3));

-- Location: LCCOMB_X29_Y15_N6
\spi|out_reg~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~7_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][0]~q\,
	combout => \spi|out_reg~7_combout\);

-- Location: FF_X29_Y15_N7
\spi|out_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~7_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(0));

-- Location: FF_X31_Y15_N13
\spi|tx_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|out_reg\(0),
	sload => VCC,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(0));

-- Location: LCCOMB_X29_Y15_N12
\spi|out_reg~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|out_reg~6_combout\ = (\out_data_ready~q\ & \mem|sr_data[0][1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out_data_ready~q\,
	datad => \mem|sr_data[0][1]~q\,
	combout => \spi|out_reg~6_combout\);

-- Location: FF_X29_Y15_N13
\spi|out_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|out_reg~6_combout\,
	ena => \spi|out_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|out_reg\(1));

-- Location: LCCOMB_X31_Y15_N10
\spi|tx_reg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|tx_reg[1]~feeder_combout\ = \spi|out_reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|out_reg\(1),
	combout => \spi|tx_reg[1]~feeder_combout\);

-- Location: FF_X31_Y15_N11
\spi|tx_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|tx_reg[1]~feeder_combout\,
	ena => \spi|tx_reg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|tx_reg\(1));

-- Location: LCCOMB_X31_Y15_N12
\spi|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Mux0~2_combout\ = (\spi|out_bitcounter\(1) & (\spi|out_bitcounter\(0))) # (!\spi|out_bitcounter\(1) & ((\spi|out_bitcounter\(0) & ((\spi|tx_reg\(1)))) # (!\spi|out_bitcounter\(0) & (\spi|tx_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(1),
	datab => \spi|out_bitcounter\(0),
	datac => \spi|tx_reg\(0),
	datad => \spi|tx_reg\(1),
	combout => \spi|Mux0~2_combout\);

-- Location: LCCOMB_X31_Y15_N22
\spi|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Mux0~3_combout\ = (\spi|out_bitcounter\(1) & ((\spi|Mux0~2_combout\ & ((\spi|tx_reg\(3)))) # (!\spi|Mux0~2_combout\ & (\spi|tx_reg\(2))))) # (!\spi|out_bitcounter\(1) & (((\spi|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|out_bitcounter\(1),
	datab => \spi|tx_reg\(2),
	datac => \spi|tx_reg\(3),
	datad => \spi|Mux0~2_combout\,
	combout => \spi|Mux0~3_combout\);

-- Location: LCCOMB_X31_Y15_N20
\spi|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Mux0~4_combout\ = (\spi|out_bitcounter\(2) & (\spi|Mux0~1_combout\)) # (!\spi|out_bitcounter\(2) & ((\spi|Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|Mux0~1_combout\,
	datab => \spi|out_bitcounter\(2),
	datac => \spi|Mux0~3_combout\,
	combout => \spi|Mux0~4_combout\);

-- Location: LCCOMB_X26_Y15_N6
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\ = \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0) $ (VCC)
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ = CARRY(\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0),
	datad => VCC,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X25_Y14_N0
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X26_Y14_N6
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\);

-- Location: LCCOMB_X26_Y14_N8
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\);

-- Location: FF_X26_Y14_N9
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17));

-- Location: LCCOMB_X26_Y14_N30
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\ = (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\);

-- Location: LCCOMB_X26_Y14_N10
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita17~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\);

-- Location: FF_X26_Y14_N11
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18));

-- Location: LCCOMB_X26_Y14_N12
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita18~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\);

-- Location: FF_X26_Y14_N13
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19));

-- Location: LCCOMB_X26_Y14_N14
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita19~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\);

-- Location: FF_X26_Y14_N15
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20));

-- Location: LCCOMB_X26_Y14_N16
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita20~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\);

-- Location: FF_X26_Y14_N17
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21));

-- Location: LCCOMB_X26_Y14_N18
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\);

-- Location: FF_X26_Y14_N19
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22));

-- Location: LCCOMB_X26_Y14_N20
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\);

-- Location: FF_X26_Y14_N21
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23));

-- Location: LCCOMB_X26_Y14_N22
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\);

-- Location: FF_X26_Y14_N23
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24));

-- Location: LCCOMB_X26_Y14_N24
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~COUT\);

-- Location: FF_X26_Y14_N25
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25));

-- Location: LCCOMB_X25_Y14_N28
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\ = (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\);

-- Location: LCCOMB_X25_Y14_N8
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\ = (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12) & !\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\);

-- Location: LCCOMB_X25_Y14_N18
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(20),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(18),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(19),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(21),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\);

-- Location: LCCOMB_X25_Y14_N14
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\ & 
-- (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\ & (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\ & 
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\,
	datab => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\,
	datac => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\,
	datad => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\);

-- Location: LCCOMB_X26_Y15_N0
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\ = (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6) & 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7) & !\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\);

-- Location: LCCOMB_X26_Y15_N2
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\);

-- Location: LCCOMB_X25_Y15_N18
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\ & \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1),
	datac => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\,
	datad => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\);

-- Location: LCCOMB_X26_Y14_N26
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\ = !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~COUT\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\);

-- Location: LCCOMB_X26_Y14_N28
\clocking|LPM_COUNTER_component|auto_generated|cout_actual\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\) # ((\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\ & 
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\,
	datab => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\,
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\);

-- Location: FF_X26_Y15_N7
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0));

-- Location: LCCOMB_X26_Y15_N8
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\);

-- Location: FF_X26_Y15_N9
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1));

-- Location: LCCOMB_X26_Y15_N10
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\);

-- Location: FF_X26_Y15_N11
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2));

-- Location: LCCOMB_X26_Y15_N12
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\);

-- Location: FF_X26_Y15_N13
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3));

-- Location: LCCOMB_X26_Y15_N14
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\);

-- Location: FF_X26_Y15_N15
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4));

-- Location: LCCOMB_X26_Y15_N16
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\);

-- Location: FF_X26_Y15_N17
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5));

-- Location: LCCOMB_X26_Y15_N18
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\);

-- Location: FF_X26_Y15_N19
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6));

-- Location: LCCOMB_X26_Y15_N20
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\);

-- Location: FF_X26_Y15_N21
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7));

-- Location: LCCOMB_X26_Y15_N22
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\);

-- Location: FF_X26_Y15_N23
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8));

-- Location: LCCOMB_X26_Y15_N24
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\);

-- Location: FF_X26_Y15_N25
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9));

-- Location: LCCOMB_X26_Y15_N26
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\);

-- Location: FF_X26_Y15_N27
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10));

-- Location: LCCOMB_X26_Y15_N28
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita10~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\);

-- Location: FF_X26_Y15_N29
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11));

-- Location: LCCOMB_X26_Y15_N30
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita11~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\);

-- Location: FF_X26_Y15_N31
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12));

-- Location: LCCOMB_X26_Y14_N0
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita12~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\);

-- Location: FF_X26_Y14_N1
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13));

-- Location: LCCOMB_X26_Y14_N2
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita13~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\);

-- Location: FF_X26_Y14_N3
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14));

-- Location: LCCOMB_X26_Y14_N4
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\)) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15) & ((\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\) # (GND)))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\ = CARRY((!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\) # (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita14~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\);

-- Location: FF_X26_Y14_N5
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15));

-- Location: FF_X26_Y14_N7
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~combout\,
	asdata => \~GND~combout\,
	sload => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16));

-- Location: CLKCTRL_G8
\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_outclk\);

-- Location: LCCOMB_X22_Y19_N18
\display|seg_select[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select[1]~feeder_combout\ = \display|seg_select\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \display|seg_select\(0),
	combout => \display|seg_select[1]~feeder_combout\);

-- Location: FF_X22_Y19_N19
\display|seg_select[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_outclk\,
	d => \display|seg_select[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|seg_select\(1));

-- Location: LCCOMB_X22_Y19_N12
\display|seg_select~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select~1_combout\ = (!\display|seg_select\(0) & \display|seg_select\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|seg_select\(0),
	datad => \display|seg_select\(1),
	combout => \display|seg_select~1_combout\);

-- Location: FF_X22_Y19_N13
\display|seg_select[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_outclk\,
	d => \display|seg_select~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|seg_select\(2));

-- Location: LCCOMB_X22_Y19_N28
\display|seg_select~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select~0_combout\ = (!\display|seg_select\(2) & (!\display|seg_select\(0) & !\display|seg_select\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(2),
	datac => \display|seg_select\(0),
	datad => \display|seg_select\(1),
	combout => \display|seg_select~0_combout\);

-- Location: FF_X22_Y19_N29
\display|seg_select[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_outclk\,
	d => \display|seg_select~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|seg_select\(0));

-- Location: LCCOMB_X22_Y19_N6
\display|seg_select~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select~2_combout\ = (\display|seg_select\(2) & (!\display|seg_select\(0) & !\display|seg_select\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(2),
	datab => \display|seg_select\(0),
	datad => \display|seg_select\(1),
	combout => \display|seg_select~2_combout\);

-- Location: FF_X22_Y19_N7
\display|seg_select[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_outclk\,
	d => \display|seg_select~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|seg_select\(3));

-- Location: LCCOMB_X22_Y19_N30
\display|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux6~0_combout\ = (\display|seg_select\(0)) # ((\display|seg_select\(3)) # (\display|seg_select\(2) $ (!\display|seg_select\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(2),
	datab => \display|seg_select\(1),
	datac => \display|seg_select\(0),
	datad => \display|seg_select\(3),
	combout => \display|Mux6~0_combout\);

-- Location: LCCOMB_X25_Y17_N0
\display|s0|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux6~0_combout\ = (\mem|sr_data[0][3]~q\ & (\mem|sr_data[0][0]~q\ & (\mem|sr_data[0][1]~q\ $ (\mem|sr_data[0][2]~q\)))) # (!\mem|sr_data[0][3]~q\ & (!\mem|sr_data[0][1]~q\ & (\mem|sr_data[0][0]~q\ $ (\mem|sr_data[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][1]~q\,
	datab => \mem|sr_data[0][3]~q\,
	datac => \mem|sr_data[0][0]~q\,
	datad => \mem|sr_data[0][2]~q\,
	combout => \display|s0|Mux6~0_combout\);

-- Location: LCCOMB_X22_Y19_N4
\display|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux6~1_combout\ = (\display|seg_select\(2)) # ((\display|seg_select\(0)) # (\display|seg_select\(1) $ (!\display|seg_select\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(2),
	datab => \display|seg_select\(1),
	datac => \display|seg_select\(0),
	datad => \display|seg_select\(3),
	combout => \display|Mux6~1_combout\);

-- Location: LCCOMB_X24_Y19_N8
\display|s2|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux6~0_combout\ = (\mem|sr_data[1][2]~q\ & (!\mem|sr_data[1][1]~q\ & (\mem|sr_data[1][3]~q\ $ (!\mem|sr_data[1][0]~q\)))) # (!\mem|sr_data[1][2]~q\ & (\mem|sr_data[1][0]~q\ & (\mem|sr_data[1][1]~q\ $ (!\mem|sr_data[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux6~0_combout\);

-- Location: LCCOMB_X23_Y15_N24
\display|s1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux6~0_combout\ = (\mem|sr_data[0][6]~q\ & (!\mem|sr_data[0][5]~q\ & (\mem|sr_data[0][4]~q\ $ (!\mem|sr_data[0][7]~q\)))) # (!\mem|sr_data[0][6]~q\ & (\mem|sr_data[0][4]~q\ & (\mem|sr_data[0][5]~q\ $ (!\mem|sr_data[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][5]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][4]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux6~0_combout\);

-- Location: LCCOMB_X24_Y19_N30
\display|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux7~0_combout\ = (\display|Mux6~0_combout\ & (\display|Mux6~1_combout\)) # (!\display|Mux6~0_combout\ & ((\display|Mux6~1_combout\ & (\display|s2|Mux6~0_combout\)) # (!\display|Mux6~1_combout\ & ((\display|s1|Mux6~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|s2|Mux6~0_combout\,
	datad => \display|s1|Mux6~0_combout\,
	combout => \display|Mux7~0_combout\);

-- Location: LCCOMB_X22_Y19_N16
\display|s3|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux6~0_combout\ = (\mem|sr_data[1][6]~q\ & (!\mem|sr_data[1][5]~q\ & (\mem|sr_data[1][4]~q\ $ (!\mem|sr_data[1][7]~q\)))) # (!\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][4]~q\ & (\mem|sr_data[1][5]~q\ $ (!\mem|sr_data[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][5]~q\,
	datab => \mem|sr_data[1][6]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][7]~q\,
	combout => \display|s3|Mux6~0_combout\);

-- Location: LCCOMB_X24_Y19_N0
\display|Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux7~1_combout\ = (\display|Mux6~0_combout\ & ((\display|Mux7~0_combout\ & (\display|s0|Mux6~0_combout\)) # (!\display|Mux7~0_combout\ & ((\display|s3|Mux6~0_combout\))))) # (!\display|Mux6~0_combout\ & (((\display|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|s0|Mux6~0_combout\,
	datac => \display|Mux7~0_combout\,
	datad => \display|s3|Mux6~0_combout\,
	combout => \display|Mux7~1_combout\);

-- Location: LCCOMB_X25_Y16_N20
\display|s0|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux5~0_combout\ = (\mem|sr_data[0][1]~q\ & ((\mem|sr_data[0][0]~q\ & ((\mem|sr_data[0][3]~q\))) # (!\mem|sr_data[0][0]~q\ & (\mem|sr_data[0][2]~q\)))) # (!\mem|sr_data[0][1]~q\ & (\mem|sr_data[0][2]~q\ & (\mem|sr_data[0][3]~q\ $ 
-- (\mem|sr_data[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][2]~q\,
	datab => \mem|sr_data[0][1]~q\,
	datac => \mem|sr_data[0][3]~q\,
	datad => \mem|sr_data[0][0]~q\,
	combout => \display|s0|Mux5~0_combout\);

-- Location: LCCOMB_X22_Y19_N14
\display|s3|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux5~0_combout\ = (\mem|sr_data[1][5]~q\ & ((\mem|sr_data[1][4]~q\ & ((\mem|sr_data[1][7]~q\))) # (!\mem|sr_data[1][4]~q\ & (\mem|sr_data[1][6]~q\)))) # (!\mem|sr_data[1][5]~q\ & (\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][4]~q\ $ 
-- (\mem|sr_data[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][5]~q\,
	datab => \mem|sr_data[1][6]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][7]~q\,
	combout => \display|s3|Mux5~0_combout\);

-- Location: LCCOMB_X25_Y15_N24
\display|s1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux5~0_combout\ = (\mem|sr_data[0][5]~q\ & ((\mem|sr_data[0][4]~q\ & ((\mem|sr_data[0][7]~q\))) # (!\mem|sr_data[0][4]~q\ & (\mem|sr_data[0][6]~q\)))) # (!\mem|sr_data[0][5]~q\ & (\mem|sr_data[0][6]~q\ & (\mem|sr_data[0][4]~q\ $ 
-- (\mem|sr_data[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][4]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][5]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux5~0_combout\);

-- Location: LCCOMB_X22_Y19_N20
\display|Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux6~2_combout\ = (\display|Mux6~0_combout\ & ((\display|Mux6~1_combout\) # ((\display|s3|Mux5~0_combout\)))) # (!\display|Mux6~0_combout\ & (!\display|Mux6~1_combout\ & ((\display|s1|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|s3|Mux5~0_combout\,
	datad => \display|s1|Mux5~0_combout\,
	combout => \display|Mux6~2_combout\);

-- Location: LCCOMB_X24_Y19_N18
\display|s2|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux5~0_combout\ = (\mem|sr_data[1][1]~q\ & ((\mem|sr_data[1][0]~q\ & ((\mem|sr_data[1][3]~q\))) # (!\mem|sr_data[1][0]~q\ & (\mem|sr_data[1][2]~q\)))) # (!\mem|sr_data[1][1]~q\ & (\mem|sr_data[1][2]~q\ & (\mem|sr_data[1][3]~q\ $ 
-- (\mem|sr_data[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux5~0_combout\);

-- Location: LCCOMB_X24_Y19_N4
\display|Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux6~3_combout\ = (\display|Mux6~1_combout\ & ((\display|Mux6~2_combout\ & (\display|s0|Mux5~0_combout\)) # (!\display|Mux6~2_combout\ & ((\display|s2|Mux5~0_combout\))))) # (!\display|Mux6~1_combout\ & (((\display|Mux6~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s0|Mux5~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|Mux6~2_combout\,
	datad => \display|s2|Mux5~0_combout\,
	combout => \display|Mux6~3_combout\);

-- Location: LCCOMB_X24_Y19_N26
\display|s2|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux4~0_combout\ = (\mem|sr_data[1][2]~q\ & (\mem|sr_data[1][3]~q\ & ((\mem|sr_data[1][1]~q\) # (!\mem|sr_data[1][0]~q\)))) # (!\mem|sr_data[1][2]~q\ & (\mem|sr_data[1][1]~q\ & (!\mem|sr_data[1][3]~q\ & !\mem|sr_data[1][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux4~0_combout\);

-- Location: LCCOMB_X25_Y15_N6
\display|s1|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux4~0_combout\ = (\mem|sr_data[0][6]~q\ & (\mem|sr_data[0][7]~q\ & ((\mem|sr_data[0][5]~q\) # (!\mem|sr_data[0][4]~q\)))) # (!\mem|sr_data[0][6]~q\ & (!\mem|sr_data[0][4]~q\ & (\mem|sr_data[0][5]~q\ & !\mem|sr_data[0][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][4]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][5]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux4~0_combout\);

-- Location: LCCOMB_X24_Y19_N20
\display|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux5~0_combout\ = (\display|Mux6~1_combout\ & ((\display|s2|Mux4~0_combout\) # ((\display|Mux6~0_combout\)))) # (!\display|Mux6~1_combout\ & (((!\display|Mux6~0_combout\ & \display|s1|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s2|Mux4~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|s1|Mux4~0_combout\,
	combout => \display|Mux5~0_combout\);

-- Location: LCCOMB_X22_Y19_N2
\display|s3|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux4~0_combout\ = (\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][7]~q\ & ((\mem|sr_data[1][5]~q\) # (!\mem|sr_data[1][4]~q\)))) # (!\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][5]~q\ & (!\mem|sr_data[1][4]~q\ & !\mem|sr_data[1][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][5]~q\,
	datab => \mem|sr_data[1][6]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][7]~q\,
	combout => \display|s3|Mux4~0_combout\);

-- Location: LCCOMB_X25_Y16_N26
\display|s0|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux4~0_combout\ = (\mem|sr_data[0][2]~q\ & (\mem|sr_data[0][3]~q\ & ((\mem|sr_data[0][1]~q\) # (!\mem|sr_data[0][0]~q\)))) # (!\mem|sr_data[0][2]~q\ & (\mem|sr_data[0][1]~q\ & (!\mem|sr_data[0][3]~q\ & !\mem|sr_data[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][2]~q\,
	datab => \mem|sr_data[0][1]~q\,
	datac => \mem|sr_data[0][3]~q\,
	datad => \mem|sr_data[0][0]~q\,
	combout => \display|s0|Mux4~0_combout\);

-- Location: LCCOMB_X22_Y19_N24
\display|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux5~1_combout\ = (\display|Mux5~0_combout\ & (((\display|s0|Mux4~0_combout\) # (!\display|Mux6~0_combout\)))) # (!\display|Mux5~0_combout\ & (\display|s3|Mux4~0_combout\ & (\display|Mux6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux5~0_combout\,
	datab => \display|s3|Mux4~0_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|s0|Mux4~0_combout\,
	combout => \display|Mux5~1_combout\);

-- Location: LCCOMB_X24_Y19_N22
\display|s2|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux3~0_combout\ = (\mem|sr_data[1][1]~q\ & ((\mem|sr_data[1][2]~q\ & ((\mem|sr_data[1][0]~q\))) # (!\mem|sr_data[1][2]~q\ & (\mem|sr_data[1][3]~q\ & !\mem|sr_data[1][0]~q\)))) # (!\mem|sr_data[1][1]~q\ & (!\mem|sr_data[1][3]~q\ & 
-- (\mem|sr_data[1][2]~q\ $ (\mem|sr_data[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux3~0_combout\);

-- Location: LCCOMB_X22_Y19_N22
\display|s3|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux3~0_combout\ = (\mem|sr_data[1][5]~q\ & ((\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][4]~q\)) # (!\mem|sr_data[1][6]~q\ & (!\mem|sr_data[1][4]~q\ & \mem|sr_data[1][7]~q\)))) # (!\mem|sr_data[1][5]~q\ & (!\mem|sr_data[1][7]~q\ & 
-- (\mem|sr_data[1][6]~q\ $ (\mem|sr_data[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][5]~q\,
	datab => \mem|sr_data[1][6]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][7]~q\,
	combout => \display|s3|Mux3~0_combout\);

-- Location: LCCOMB_X25_Y15_N16
\display|s1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux3~0_combout\ = (\mem|sr_data[0][5]~q\ & ((\mem|sr_data[0][4]~q\ & (\mem|sr_data[0][6]~q\)) # (!\mem|sr_data[0][4]~q\ & (!\mem|sr_data[0][6]~q\ & \mem|sr_data[0][7]~q\)))) # (!\mem|sr_data[0][5]~q\ & (!\mem|sr_data[0][7]~q\ & 
-- (\mem|sr_data[0][4]~q\ $ (\mem|sr_data[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][4]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][5]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux3~0_combout\);

-- Location: LCCOMB_X24_Y19_N16
\display|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux4~0_combout\ = (\display|Mux6~0_combout\ & ((\display|Mux6~1_combout\) # ((\display|s3|Mux3~0_combout\)))) # (!\display|Mux6~0_combout\ & (!\display|Mux6~1_combout\ & ((\display|s1|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|s3|Mux3~0_combout\,
	datad => \display|s1|Mux3~0_combout\,
	combout => \display|Mux4~0_combout\);

-- Location: LCCOMB_X25_Y16_N28
\display|s0|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux3~0_combout\ = (\mem|sr_data[0][1]~q\ & ((\mem|sr_data[0][2]~q\ & ((\mem|sr_data[0][0]~q\))) # (!\mem|sr_data[0][2]~q\ & (\mem|sr_data[0][3]~q\ & !\mem|sr_data[0][0]~q\)))) # (!\mem|sr_data[0][1]~q\ & (!\mem|sr_data[0][3]~q\ & 
-- (\mem|sr_data[0][2]~q\ $ (\mem|sr_data[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][2]~q\,
	datab => \mem|sr_data[0][1]~q\,
	datac => \mem|sr_data[0][3]~q\,
	datad => \mem|sr_data[0][0]~q\,
	combout => \display|s0|Mux3~0_combout\);

-- Location: LCCOMB_X24_Y19_N2
\display|Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux4~1_combout\ = (\display|Mux4~0_combout\ & (((\display|s0|Mux3~0_combout\) # (!\display|Mux6~1_combout\)))) # (!\display|Mux4~0_combout\ & (\display|s2|Mux3~0_combout\ & (\display|Mux6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s2|Mux3~0_combout\,
	datab => \display|Mux4~0_combout\,
	datac => \display|Mux6~1_combout\,
	datad => \display|s0|Mux3~0_combout\,
	combout => \display|Mux4~1_combout\);

-- Location: LCCOMB_X24_Y19_N12
\display|s2|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux2~0_combout\ = (\mem|sr_data[1][1]~q\ & (((!\mem|sr_data[1][3]~q\ & \mem|sr_data[1][0]~q\)))) # (!\mem|sr_data[1][1]~q\ & ((\mem|sr_data[1][2]~q\ & (!\mem|sr_data[1][3]~q\)) # (!\mem|sr_data[1][2]~q\ & ((\mem|sr_data[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux2~0_combout\);

-- Location: LCCOMB_X25_Y15_N22
\display|s1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux2~0_combout\ = (\mem|sr_data[0][5]~q\ & (\mem|sr_data[0][4]~q\ & ((!\mem|sr_data[0][7]~q\)))) # (!\mem|sr_data[0][5]~q\ & ((\mem|sr_data[0][6]~q\ & ((!\mem|sr_data[0][7]~q\))) # (!\mem|sr_data[0][6]~q\ & (\mem|sr_data[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][4]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][5]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux2~0_combout\);

-- Location: LCCOMB_X24_Y19_N10
\display|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux3~0_combout\ = (\display|Mux6~1_combout\ & ((\display|s2|Mux2~0_combout\) # ((\display|Mux6~0_combout\)))) # (!\display|Mux6~1_combout\ & (((!\display|Mux6~0_combout\ & \display|s1|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s2|Mux2~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|s1|Mux2~0_combout\,
	combout => \display|Mux3~0_combout\);

-- Location: LCCOMB_X22_Y19_N8
\display|s3|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux2~0_combout\ = (\mem|sr_data[1][5]~q\ & (((\mem|sr_data[1][4]~q\ & !\mem|sr_data[1][7]~q\)))) # (!\mem|sr_data[1][5]~q\ & ((\mem|sr_data[1][6]~q\ & ((!\mem|sr_data[1][7]~q\))) # (!\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][5]~q\,
	datab => \mem|sr_data[1][6]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][7]~q\,
	combout => \display|s3|Mux2~0_combout\);

-- Location: LCCOMB_X25_Y16_N18
\display|s0|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux2~0_combout\ = (\mem|sr_data[0][1]~q\ & (((!\mem|sr_data[0][3]~q\ & \mem|sr_data[0][0]~q\)))) # (!\mem|sr_data[0][1]~q\ & ((\mem|sr_data[0][2]~q\ & (!\mem|sr_data[0][3]~q\)) # (!\mem|sr_data[0][2]~q\ & ((\mem|sr_data[0][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][2]~q\,
	datab => \mem|sr_data[0][1]~q\,
	datac => \mem|sr_data[0][3]~q\,
	datad => \mem|sr_data[0][0]~q\,
	combout => \display|s0|Mux2~0_combout\);

-- Location: LCCOMB_X22_Y19_N26
\display|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux3~1_combout\ = (\display|Mux6~0_combout\ & ((\display|Mux3~0_combout\ & ((\display|s0|Mux2~0_combout\))) # (!\display|Mux3~0_combout\ & (\display|s3|Mux2~0_combout\)))) # (!\display|Mux6~0_combout\ & (\display|Mux3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|Mux3~0_combout\,
	datac => \display|s3|Mux2~0_combout\,
	datad => \display|s0|Mux2~0_combout\,
	combout => \display|Mux3~1_combout\);

-- Location: LCCOMB_X25_Y15_N0
\display|s0|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux1~0_combout\ = (\mem|sr_data[0][0]~q\ & (\mem|sr_data[0][3]~q\ $ (((\mem|sr_data[0][1]~q\) # (!\mem|sr_data[0][2]~q\))))) # (!\mem|sr_data[0][0]~q\ & (!\mem|sr_data[0][2]~q\ & (\mem|sr_data[0][1]~q\ & !\mem|sr_data[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][0]~q\,
	datab => \mem|sr_data[0][2]~q\,
	datac => \mem|sr_data[0][1]~q\,
	datad => \mem|sr_data[0][3]~q\,
	combout => \display|s0|Mux1~0_combout\);

-- Location: LCCOMB_X25_Y15_N12
\display|s1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux1~0_combout\ = (\mem|sr_data[0][4]~q\ & (\mem|sr_data[0][7]~q\ $ (((\mem|sr_data[0][5]~q\) # (!\mem|sr_data[0][6]~q\))))) # (!\mem|sr_data[0][4]~q\ & (!\mem|sr_data[0][6]~q\ & (\mem|sr_data[0][5]~q\ & !\mem|sr_data[0][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][4]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][5]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux1~0_combout\);

-- Location: LCCOMB_X28_Y15_N22
\display|s3|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux1~0_combout\ = (\mem|sr_data[1][6]~q\ & (\mem|sr_data[1][4]~q\ & (\mem|sr_data[1][7]~q\ $ (\mem|sr_data[1][5]~q\)))) # (!\mem|sr_data[1][6]~q\ & (!\mem|sr_data[1][7]~q\ & ((\mem|sr_data[1][4]~q\) # (\mem|sr_data[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][6]~q\,
	datab => \mem|sr_data[1][7]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][5]~q\,
	combout => \display|s3|Mux1~0_combout\);

-- Location: LCCOMB_X25_Y15_N10
\display|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux2~0_combout\ = (\display|Mux6~1_combout\ & (((\display|Mux6~0_combout\)))) # (!\display|Mux6~1_combout\ & ((\display|Mux6~0_combout\ & ((\display|s3|Mux1~0_combout\))) # (!\display|Mux6~0_combout\ & (\display|s1|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s1|Mux1~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|s3|Mux1~0_combout\,
	combout => \display|Mux2~0_combout\);

-- Location: LCCOMB_X24_Y19_N28
\display|s2|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux1~0_combout\ = (\mem|sr_data[1][1]~q\ & (!\mem|sr_data[1][3]~q\ & ((\mem|sr_data[1][0]~q\) # (!\mem|sr_data[1][2]~q\)))) # (!\mem|sr_data[1][1]~q\ & (\mem|sr_data[1][0]~q\ & (\mem|sr_data[1][2]~q\ $ (!\mem|sr_data[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux1~0_combout\);

-- Location: LCCOMB_X24_Y19_N14
\display|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux2~1_combout\ = (\display|Mux6~1_combout\ & ((\display|Mux2~0_combout\ & (\display|s0|Mux1~0_combout\)) # (!\display|Mux2~0_combout\ & ((\display|s2|Mux1~0_combout\))))) # (!\display|Mux6~1_combout\ & (((\display|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s0|Mux1~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|Mux2~0_combout\,
	datad => \display|s2|Mux1~0_combout\,
	combout => \display|Mux2~1_combout\);

-- Location: LCCOMB_X23_Y15_N26
\display|s1|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux0~0_combout\ = (\mem|sr_data[0][4]~q\ & ((\mem|sr_data[0][7]~q\) # (\mem|sr_data[0][5]~q\ $ (\mem|sr_data[0][6]~q\)))) # (!\mem|sr_data[0][4]~q\ & ((\mem|sr_data[0][5]~q\) # (\mem|sr_data[0][6]~q\ $ (\mem|sr_data[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][5]~q\,
	datab => \mem|sr_data[0][6]~q\,
	datac => \mem|sr_data[0][4]~q\,
	datad => \mem|sr_data[0][7]~q\,
	combout => \display|s1|Mux0~0_combout\);

-- Location: LCCOMB_X24_Y19_N24
\display|s2|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s2|Mux0~0_combout\ = (\mem|sr_data[1][0]~q\ & ((\mem|sr_data[1][3]~q\) # (\mem|sr_data[1][1]~q\ $ (\mem|sr_data[1][2]~q\)))) # (!\mem|sr_data[1][0]~q\ & ((\mem|sr_data[1][1]~q\) # (\mem|sr_data[1][2]~q\ $ (\mem|sr_data[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][1]~q\,
	datab => \mem|sr_data[1][2]~q\,
	datac => \mem|sr_data[1][3]~q\,
	datad => \mem|sr_data[1][0]~q\,
	combout => \display|s2|Mux0~0_combout\);

-- Location: LCCOMB_X24_Y19_N6
\display|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux1~0_combout\ = (\display|Mux6~1_combout\ & (((\display|Mux6~0_combout\) # (!\display|s2|Mux0~0_combout\)))) # (!\display|Mux6~1_combout\ & (!\display|s1|Mux0~0_combout\ & (!\display|Mux6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s1|Mux0~0_combout\,
	datab => \display|Mux6~1_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|s2|Mux0~0_combout\,
	combout => \display|Mux1~0_combout\);

-- Location: LCCOMB_X28_Y15_N30
\display|s0|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux0~0_combout\ = (\mem|sr_data[0][0]~q\ & ((\mem|sr_data[0][3]~q\) # (\mem|sr_data[0][2]~q\ $ (\mem|sr_data[0][1]~q\)))) # (!\mem|sr_data[0][0]~q\ & ((\mem|sr_data[0][1]~q\) # (\mem|sr_data[0][3]~q\ $ (\mem|sr_data[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[0][3]~q\,
	datab => \mem|sr_data[0][0]~q\,
	datac => \mem|sr_data[0][2]~q\,
	datad => \mem|sr_data[0][1]~q\,
	combout => \display|s0|Mux0~0_combout\);

-- Location: LCCOMB_X28_Y15_N20
\display|s3|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s3|Mux0~0_combout\ = (\mem|sr_data[1][4]~q\ & ((\mem|sr_data[1][7]~q\) # (\mem|sr_data[1][6]~q\ $ (\mem|sr_data[1][5]~q\)))) # (!\mem|sr_data[1][4]~q\ & ((\mem|sr_data[1][5]~q\) # (\mem|sr_data[1][6]~q\ $ (\mem|sr_data[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|sr_data[1][6]~q\,
	datab => \mem|sr_data[1][7]~q\,
	datac => \mem|sr_data[1][4]~q\,
	datad => \mem|sr_data[1][5]~q\,
	combout => \display|s3|Mux0~0_combout\);

-- Location: LCCOMB_X28_Y15_N28
\display|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux1~1_combout\ = (\display|Mux1~0_combout\ & (((!\display|s0|Mux0~0_combout\)) # (!\display|Mux6~0_combout\))) # (!\display|Mux1~0_combout\ & (\display|Mux6~0_combout\ & ((!\display|s3|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux1~0_combout\,
	datab => \display|Mux6~0_combout\,
	datac => \display|s0|Mux0~0_combout\,
	datad => \display|s3|Mux0~0_combout\,
	combout => \display|Mux1~1_combout\);

ww_miso <= \miso~output_o\;

ww_seg_select(0) <= \seg_select[0]~output_o\;

ww_seg_select(1) <= \seg_select[1]~output_o\;

ww_seg_select(2) <= \seg_select[2]~output_o\;

ww_seg_select(3) <= \seg_select[3]~output_o\;

ww_segments(0) <= \segments[0]~output_o\;

ww_segments(1) <= \segments[1]~output_o\;

ww_segments(2) <= \segments[2]~output_o\;

ww_segments(3) <= \segments[3]~output_o\;

ww_segments(4) <= \segments[4]~output_o\;

ww_segments(5) <= \segments[5]~output_o\;

ww_segments(6) <= \segments[6]~output_o\;

ww_segments(7) <= \segments[7]~output_o\;

ww_vals(0) <= \vals[0]~output_o\;

ww_vals(1) <= \vals[1]~output_o\;

ww_vals(2) <= \vals[2]~output_o\;

ww_vals(3) <= \vals[3]~output_o\;
END structure;


