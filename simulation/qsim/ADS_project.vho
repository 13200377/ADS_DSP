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

-- DATE "07/29/2021 22:40:22"

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
	miso : BUFFER std_logic;
	mosi : IN std_logic;
	cs : IN std_logic;
	sck : IN std_logic;
	clk : IN std_logic;
	seg_select : BUFFER std_logic_vector(3 DOWNTO 0);
	segments : BUFFER std_logic_vector(6 DOWNTO 0)
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
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mosi	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cs	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sck	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
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
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
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
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita21~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita22~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita23~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita24~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~COUT\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\ : std_logic;
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\ : std_logic;
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
SIGNAL \mosi~input_o\ : std_logic;
SIGNAL \cs~input_o\ : std_logic;
SIGNAL \spi|cs_record[0]~feeder_combout\ : std_logic;
SIGNAL \spi|cs_record[1]~feeder_combout\ : std_logic;
SIGNAL \spi|cs_record[2]~feeder_combout\ : std_logic;
SIGNAL \spi|bitcounter~11_combout\ : std_logic;
SIGNAL \spi|bitcounter~6_combout\ : std_logic;
SIGNAL \spi|bitcounter~8_combout\ : std_logic;
SIGNAL \sck~input_o\ : std_logic;
SIGNAL \spi|sck_record[2]~feeder_combout\ : std_logic;
SIGNAL \spi|current_state~0_combout\ : std_logic;
SIGNAL \spi|Add0~1_combout\ : std_logic;
SIGNAL \spi|bitcounter~9_combout\ : std_logic;
SIGNAL \spi|Add0~0_combout\ : std_logic;
SIGNAL \spi|bitcounter~7_combout\ : std_logic;
SIGNAL \spi|current_state~1_combout\ : std_logic;
SIGNAL \spi|current_state~2_combout\ : std_logic;
SIGNAL \spi|current_state~q\ : std_logic;
SIGNAL \spi|data_transfer~0_combout\ : std_logic;
SIGNAL \spi|reg[3]~4_combout\ : std_logic;
SIGNAL \spi|reg[4]~feeder_combout\ : std_logic;
SIGNAL \spi|bitcounter~10_combout\ : std_logic;
SIGNAL \spi|reg[6]~feeder_combout\ : std_logic;
SIGNAL \spi|reg[7]~feeder_combout\ : std_logic;
SIGNAL \display|s1|Mux6~0_combout\ : std_logic;
SIGNAL \display|Mux3~0_combout\ : std_logic;
SIGNAL \display|Mux6~0_combout\ : std_logic;
SIGNAL \spi|input_shiftreg[2]~feeder_combout\ : std_logic;
SIGNAL \spi|input_shiftreg[1]~feeder_combout\ : std_logic;
SIGNAL \spi|input_shiftreg[3]~feeder_combout\ : std_logic;
SIGNAL \spi|input_shiftreg[0]~feeder_combout\ : std_logic;
SIGNAL \display|s0|Mux6~0_combout\ : std_logic;
SIGNAL \display|Mux6~1_combout\ : std_logic;
SIGNAL \display|s0|Mux5~0_combout\ : std_logic;
SIGNAL \display|s1|Mux5~0_combout\ : std_logic;
SIGNAL \display|Mux5~0_combout\ : std_logic;
SIGNAL \display|Mux5~1_combout\ : std_logic;
SIGNAL \display|s1|Mux4~0_combout\ : std_logic;
SIGNAL \display|s0|Mux4~0_combout\ : std_logic;
SIGNAL \display|Mux4~0_combout\ : std_logic;
SIGNAL \display|s1|Mux3~0_combout\ : std_logic;
SIGNAL \display|s0|Mux3~0_combout\ : std_logic;
SIGNAL \display|Mux3~1_combout\ : std_logic;
SIGNAL \display|s1|Mux2~0_combout\ : std_logic;
SIGNAL \display|Mux2~0_combout\ : std_logic;
SIGNAL \display|s0|Mux2~0_combout\ : std_logic;
SIGNAL \display|Mux2~1_combout\ : std_logic;
SIGNAL \display|s1|Mux1~0_combout\ : std_logic;
SIGNAL \display|Mux1~0_combout\ : std_logic;
SIGNAL \display|s0|Mux1~0_combout\ : std_logic;
SIGNAL \display|Mux1~1_combout\ : std_logic;
SIGNAL \display|s1|Mux0~0_combout\ : std_logic;
SIGNAL \display|Mux0~0_combout\ : std_logic;
SIGNAL \display|s0|Mux0~0_combout\ : std_logic;
SIGNAL \display|Mux0~1_combout\ : std_logic;
SIGNAL \spi|sck_record\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \spi|reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|seg_select\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \spi|input_shiftreg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \spi|cs_record\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \spi|bitcounter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|ALT_INV_seg_select\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|ALT_INV_Mux0~1_combout\ : std_logic;

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
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit[16]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16));

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\display|ALT_INV_seg_select\(3) <= NOT \display|seg_select\(3);
\display|ALT_INV_seg_select\(2) <= NOT \display|seg_select\(2);
\display|ALT_INV_seg_select\(1) <= NOT \display|seg_select\(1);
\display|ALT_INV_seg_select\(0) <= NOT \display|seg_select\(0);
\display|ALT_INV_Mux0~1_combout\ <= NOT \display|Mux0~1_combout\;
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
	i => GND,
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
	i => \display|Mux6~1_combout\,
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
	i => \display|Mux5~1_combout\,
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
	i => \display|Mux4~0_combout\,
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
	i => \display|Mux3~1_combout\,
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
	i => \display|Mux2~1_combout\,
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
	i => \display|Mux1~1_combout\,
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
	i => \display|ALT_INV_Mux0~1_combout\,
	devoe => ww_devoe,
	o => \segments[6]~output_o\);

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

-- Location: LCCOMB_X19_Y7_N6
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

-- Location: LCCOMB_X21_Y6_N0
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

-- Location: LCCOMB_X19_Y6_N6
\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\ $ (GND))) # 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\ & VCC))
-- \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\ = CARRY((\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & !\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16),
	datad => VCC,
	cin => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita15~COUT\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~combout\,
	cout => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita16~COUT\);

-- Location: LCCOMB_X19_Y6_N8
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

-- Location: FF_X19_Y6_N9
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

-- Location: LCCOMB_X19_Y6_N30
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\ = (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(16),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(15),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(17),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(14),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\);

-- Location: LCCOMB_X19_Y6_N10
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

-- Location: FF_X19_Y6_N11
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

-- Location: LCCOMB_X19_Y6_N12
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

-- Location: FF_X19_Y6_N13
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

-- Location: LCCOMB_X19_Y6_N14
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

-- Location: FF_X19_Y6_N15
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

-- Location: LCCOMB_X19_Y6_N16
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

-- Location: FF_X19_Y6_N17
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

-- Location: LCCOMB_X18_Y6_N18
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

-- Location: LCCOMB_X18_Y6_N8
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13) & !\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(12),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(11),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(13),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(10),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\);

-- Location: LCCOMB_X19_Y6_N18
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

-- Location: FF_X19_Y6_N19
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

-- Location: LCCOMB_X19_Y6_N20
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

-- Location: FF_X19_Y6_N21
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

-- Location: LCCOMB_X19_Y6_N22
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

-- Location: FF_X19_Y6_N23
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

-- Location: LCCOMB_X19_Y6_N24
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

-- Location: FF_X19_Y6_N25
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

-- Location: LCCOMB_X18_Y6_N28
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23) & (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(23),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(24),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(22),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(25),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\);

-- Location: LCCOMB_X18_Y6_N14
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\ & 
-- (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\ & (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\ & 
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~2_combout\,
	datab => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~1_combout\,
	datac => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~3_combout\,
	datad => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~0_combout\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\);

-- Location: LCCOMB_X19_Y7_N2
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5) & 
-- (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4) & \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(3),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(5),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(4),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(2),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\);

-- Location: LCCOMB_X19_Y7_N0
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0) & 
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(1),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(0),
	datad => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~6_combout\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\);

-- Location: LCCOMB_X19_Y6_N26
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

-- Location: LCCOMB_X19_Y7_N4
\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\ = (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7) & (\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6) & 
-- (!\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8) & !\clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(7),
	datab => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(6),
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(8),
	datad => \clocking|LPM_COUNTER_component|auto_generated|counter_reg_bit\(9),
	combout => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\);

-- Location: LCCOMB_X19_Y6_N28
\clocking|LPM_COUNTER_component|auto_generated|cout_actual\ : cycloneive_lcell_comb
-- Equation(s):
-- \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\ = (\clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\) # ((\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\ & 
-- (\clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\ & \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~4_combout\,
	datab => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~7_combout\,
	datac => \clocking|LPM_COUNTER_component|auto_generated|counter_comb_bita25~0_combout\,
	datad => \clocking|LPM_COUNTER_component|auto_generated|cmpr1|aneb_result_wire[0]~5_combout\,
	combout => \clocking|LPM_COUNTER_component|auto_generated|cout_actual~combout\);

-- Location: FF_X19_Y7_N7
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

-- Location: LCCOMB_X19_Y7_N8
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

-- Location: FF_X19_Y7_N9
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

-- Location: LCCOMB_X19_Y7_N10
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

-- Location: FF_X19_Y7_N11
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

-- Location: LCCOMB_X19_Y7_N12
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

-- Location: FF_X19_Y7_N13
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

-- Location: LCCOMB_X19_Y7_N14
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

-- Location: FF_X19_Y7_N15
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

-- Location: LCCOMB_X19_Y7_N16
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

-- Location: FF_X19_Y7_N17
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

-- Location: LCCOMB_X19_Y7_N18
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

-- Location: FF_X19_Y7_N19
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

-- Location: LCCOMB_X19_Y7_N20
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

-- Location: FF_X19_Y7_N21
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

-- Location: LCCOMB_X19_Y7_N22
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

-- Location: FF_X19_Y7_N23
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

-- Location: LCCOMB_X19_Y7_N24
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

-- Location: FF_X19_Y7_N25
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

-- Location: LCCOMB_X19_Y7_N26
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

-- Location: FF_X19_Y7_N27
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

-- Location: LCCOMB_X19_Y7_N28
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

-- Location: FF_X19_Y7_N29
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

-- Location: LCCOMB_X19_Y7_N30
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

-- Location: FF_X19_Y7_N31
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

-- Location: LCCOMB_X19_Y6_N0
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

-- Location: FF_X19_Y6_N1
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

-- Location: LCCOMB_X19_Y6_N2
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

-- Location: FF_X19_Y6_N3
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

-- Location: LCCOMB_X19_Y6_N4
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

-- Location: FF_X19_Y6_N5
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

-- Location: FF_X19_Y6_N7
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

-- Location: CLKCTRL_G9
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

-- Location: LCCOMB_X12_Y20_N18
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

-- Location: FF_X12_Y20_N19
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

-- Location: LCCOMB_X12_Y20_N28
\display|seg_select~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select~1_combout\ = (\display|seg_select\(1) & !\display|seg_select\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|seg_select\(1),
	datad => \display|seg_select\(0),
	combout => \display|seg_select~1_combout\);

-- Location: FF_X12_Y20_N29
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

-- Location: LCCOMB_X12_Y20_N12
\display|seg_select~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select~0_combout\ = (!\display|seg_select\(2) & (!\display|seg_select\(0) & !\display|seg_select\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|seg_select\(2),
	datac => \display|seg_select\(0),
	datad => \display|seg_select\(1),
	combout => \display|seg_select~0_combout\);

-- Location: FF_X12_Y20_N13
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

-- Location: LCCOMB_X12_Y20_N2
\display|seg_select~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|seg_select~2_combout\ = (!\display|seg_select\(0) & (\display|seg_select\(2) & !\display|seg_select\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(0),
	datab => \display|seg_select\(2),
	datad => \display|seg_select\(1),
	combout => \display|seg_select~2_combout\);

-- Location: FF_X12_Y20_N3
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

-- Location: LCCOMB_X14_Y20_N2
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

-- Location: FF_X14_Y20_N3
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

-- Location: LCCOMB_X13_Y20_N0
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

-- Location: FF_X13_Y20_N1
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

-- Location: LCCOMB_X13_Y20_N6
\spi|cs_record[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|cs_record[2]~feeder_combout\ = \spi|cs_record\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|cs_record\(1),
	combout => \spi|cs_record[2]~feeder_combout\);

-- Location: FF_X13_Y20_N7
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

-- Location: LCCOMB_X13_Y20_N28
\spi|bitcounter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~11_combout\ = (\spi|data_transfer~0_combout\ & (!\spi|bitcounter\(0) & (\spi|cs_record\(1) $ (!\spi|cs_record\(2))))) # (!\spi|data_transfer~0_combout\ & (\spi|bitcounter\(0) & (\spi|cs_record\(1) $ (!\spi|cs_record\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|data_transfer~0_combout\,
	datab => \spi|cs_record\(1),
	datac => \spi|bitcounter\(0),
	datad => \spi|cs_record\(2),
	combout => \spi|bitcounter~11_combout\);

-- Location: FF_X13_Y20_N29
\spi|bitcounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(0));

-- Location: LCCOMB_X13_Y20_N24
\spi|bitcounter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~6_combout\ = \spi|cs_record\(2) $ (!\spi|cs_record\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(2),
	datad => \spi|cs_record\(1),
	combout => \spi|bitcounter~6_combout\);

-- Location: LCCOMB_X14_Y20_N6
\spi|bitcounter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~8_combout\ = (\spi|bitcounter~6_combout\ & (\spi|bitcounter\(1) $ (((\spi|data_transfer~0_combout\ & \spi|bitcounter\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|data_transfer~0_combout\,
	datab => \spi|bitcounter\(0),
	datac => \spi|bitcounter\(1),
	datad => \spi|bitcounter~6_combout\,
	combout => \spi|bitcounter~8_combout\);

-- Location: FF_X14_Y20_N7
\spi|bitcounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(1));

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

-- Location: FF_X14_Y20_N31
\spi|sck_record[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \sck~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|sck_record\(0));

-- Location: FF_X13_Y20_N17
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

-- Location: LCCOMB_X13_Y20_N18
\spi|sck_record[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|sck_record[2]~feeder_combout\ = \spi|sck_record\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|sck_record\(1),
	combout => \spi|sck_record[2]~feeder_combout\);

-- Location: FF_X13_Y20_N19
\spi|sck_record[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|sck_record[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|sck_record\(2));

-- Location: LCCOMB_X13_Y20_N16
\spi|current_state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|current_state~0_combout\ = (\spi|current_state~q\ & (!\spi|sck_record\(2) & (\spi|sck_record\(1) & !\spi|bitcounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|current_state~q\,
	datab => \spi|sck_record\(2),
	datac => \spi|sck_record\(1),
	datad => \spi|bitcounter\(0),
	combout => \spi|current_state~0_combout\);

-- Location: LCCOMB_X14_Y20_N22
\spi|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Add0~1_combout\ = \spi|bitcounter\(2) $ (((\spi|bitcounter\(0) & \spi|bitcounter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi|bitcounter\(0),
	datac => \spi|bitcounter\(2),
	datad => \spi|bitcounter\(1),
	combout => \spi|Add0~1_combout\);

-- Location: LCCOMB_X14_Y20_N4
\spi|bitcounter~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~9_combout\ = (\spi|bitcounter~6_combout\ & ((\spi|data_transfer~0_combout\ & (\spi|Add0~1_combout\)) # (!\spi|data_transfer~0_combout\ & ((\spi|bitcounter\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|Add0~1_combout\,
	datab => \spi|bitcounter~6_combout\,
	datac => \spi|bitcounter\(2),
	datad => \spi|data_transfer~0_combout\,
	combout => \spi|bitcounter~9_combout\);

-- Location: FF_X14_Y20_N5
\spi|bitcounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(2));

-- Location: LCCOMB_X14_Y20_N12
\spi|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|Add0~0_combout\ = \spi|bitcounter\(3) $ (((\spi|bitcounter\(1) & (\spi|bitcounter\(2) & \spi|bitcounter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter\(1),
	datab => \spi|bitcounter\(2),
	datac => \spi|bitcounter\(3),
	datad => \spi|bitcounter\(0),
	combout => \spi|Add0~0_combout\);

-- Location: LCCOMB_X14_Y20_N24
\spi|bitcounter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~7_combout\ = (\spi|bitcounter~6_combout\ & ((\spi|data_transfer~0_combout\ & (\spi|Add0~0_combout\)) # (!\spi|data_transfer~0_combout\ & ((\spi|bitcounter\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|Add0~0_combout\,
	datab => \spi|bitcounter~6_combout\,
	datac => \spi|bitcounter\(3),
	datad => \spi|data_transfer~0_combout\,
	combout => \spi|bitcounter~7_combout\);

-- Location: FF_X14_Y20_N25
\spi|bitcounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|bitcounter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|bitcounter\(3));

-- Location: LCCOMB_X13_Y20_N20
\spi|current_state~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|current_state~1_combout\ = (!\spi|bitcounter\(1) & (\spi|current_state~0_combout\ & (\spi|bitcounter\(3) & !\spi|bitcounter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|bitcounter\(1),
	datab => \spi|current_state~0_combout\,
	datac => \spi|bitcounter\(3),
	datad => \spi|bitcounter\(2),
	combout => \spi|current_state~1_combout\);

-- Location: LCCOMB_X13_Y20_N22
\spi|current_state~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|current_state~2_combout\ = (\spi|cs_record\(2) & ((\spi|current_state~q\ $ (\spi|current_state~1_combout\)) # (!\spi|cs_record\(1)))) # (!\spi|cs_record\(2) & (!\spi|cs_record\(1) & (\spi|current_state~q\ $ (\spi|current_state~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101110110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(2),
	datab => \spi|cs_record\(1),
	datac => \spi|current_state~q\,
	datad => \spi|current_state~1_combout\,
	combout => \spi|current_state~2_combout\);

-- Location: FF_X13_Y20_N23
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

-- Location: LCCOMB_X13_Y20_N14
\spi|data_transfer~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|data_transfer~0_combout\ = (\spi|current_state~q\ & (\spi|sck_record\(1) & !\spi|sck_record\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|current_state~q\,
	datab => \spi|sck_record\(1),
	datad => \spi|sck_record\(2),
	combout => \spi|data_transfer~0_combout\);

-- Location: LCCOMB_X13_Y20_N4
\spi|reg[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|reg[3]~4_combout\ = (\spi|data_transfer~0_combout\ & (\spi|cs_record\(1) $ (!\spi|cs_record\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|data_transfer~0_combout\,
	datab => \spi|cs_record\(1),
	datad => \spi|cs_record\(2),
	combout => \spi|reg[3]~4_combout\);

-- Location: FF_X13_Y20_N5
\spi|reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \mosi~input_o\,
	sload => VCC,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(0));

-- Location: FF_X13_Y20_N27
\spi|reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(0),
	sload => VCC,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(1));

-- Location: FF_X13_Y20_N15
\spi|reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(1),
	sload => VCC,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(2));

-- Location: FF_X13_Y20_N25
\spi|reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(2),
	sload => VCC,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(3));

-- Location: LCCOMB_X13_Y20_N30
\spi|reg[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|reg[4]~feeder_combout\ = \spi|reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|reg\(3),
	combout => \spi|reg[4]~feeder_combout\);

-- Location: FF_X13_Y20_N31
\spi|reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|reg[4]~feeder_combout\,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(4));

-- Location: FF_X13_Y20_N3
\spi|reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(4),
	sload => VCC,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(5));

-- Location: LCCOMB_X13_Y20_N26
\spi|bitcounter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|bitcounter~10_combout\ = (!\spi|data_transfer~0_combout\ & (\spi|cs_record\(2) $ (!\spi|cs_record\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|cs_record\(2),
	datab => \spi|cs_record\(1),
	datad => \spi|data_transfer~0_combout\,
	combout => \spi|bitcounter~10_combout\);

-- Location: FF_X12_Y20_N23
\spi|input_shiftreg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(5),
	sload => VCC,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(5));

-- Location: LCCOMB_X13_Y20_N8
\spi|reg[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|reg[6]~feeder_combout\ = \spi|reg\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|reg\(5),
	combout => \spi|reg[6]~feeder_combout\);

-- Location: FF_X13_Y20_N9
\spi|reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|reg[6]~feeder_combout\,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(6));

-- Location: LCCOMB_X13_Y20_N12
\spi|reg[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|reg[7]~feeder_combout\ = \spi|reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|reg\(6),
	combout => \spi|reg[7]~feeder_combout\);

-- Location: FF_X13_Y20_N13
\spi|reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|reg[7]~feeder_combout\,
	ena => \spi|reg[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|reg\(7));

-- Location: FF_X12_Y20_N27
\spi|input_shiftreg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(7),
	sload => VCC,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(7));

-- Location: FF_X12_Y20_N25
\spi|input_shiftreg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(6),
	sload => VCC,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(6));

-- Location: FF_X12_Y20_N17
\spi|input_shiftreg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi|reg\(4),
	sload => VCC,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(4));

-- Location: LCCOMB_X12_Y20_N8
\display|s1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux6~0_combout\ = (\spi|input_shiftreg\(7) & (\spi|input_shiftreg\(4) & (\spi|input_shiftreg\(5) $ (\spi|input_shiftreg\(6))))) # (!\spi|input_shiftreg\(7) & (!\spi|input_shiftreg\(5) & (\spi|input_shiftreg\(6) $ (\spi|input_shiftreg\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(5),
	datab => \spi|input_shiftreg\(7),
	datac => \spi|input_shiftreg\(6),
	datad => \spi|input_shiftreg\(4),
	combout => \display|s1|Mux6~0_combout\);

-- Location: LCCOMB_X12_Y20_N14
\display|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux3~0_combout\ = (\display|seg_select\(1) & (!\display|seg_select\(3) & (!\display|seg_select\(2) & !\display|seg_select\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(1),
	datab => \display|seg_select\(3),
	datac => \display|seg_select\(2),
	datad => \display|seg_select\(0),
	combout => \display|Mux3~0_combout\);

-- Location: LCCOMB_X12_Y20_N4
\display|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux6~0_combout\ = (\display|seg_select\(0)) # ((\display|seg_select\(1) & ((\display|seg_select\(3)) # (\display|seg_select\(2)))) # (!\display|seg_select\(1) & (\display|seg_select\(3) $ (!\display|seg_select\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(1),
	datab => \display|seg_select\(3),
	datac => \display|seg_select\(2),
	datad => \display|seg_select\(0),
	combout => \display|Mux6~0_combout\);

-- Location: LCCOMB_X14_Y20_N20
\spi|input_shiftreg[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[2]~feeder_combout\ = \spi|reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|reg\(2),
	combout => \spi|input_shiftreg[2]~feeder_combout\);

-- Location: FF_X14_Y20_N21
\spi|input_shiftreg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[2]~feeder_combout\,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(2));

-- Location: LCCOMB_X14_Y20_N26
\spi|input_shiftreg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[1]~feeder_combout\ = \spi|reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|reg\(1),
	combout => \spi|input_shiftreg[1]~feeder_combout\);

-- Location: FF_X14_Y20_N27
\spi|input_shiftreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[1]~feeder_combout\,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(1));

-- Location: LCCOMB_X14_Y20_N18
\spi|input_shiftreg[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[3]~feeder_combout\ = \spi|reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi|reg\(3),
	combout => \spi|input_shiftreg[3]~feeder_combout\);

-- Location: FF_X14_Y20_N19
\spi|input_shiftreg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[3]~feeder_combout\,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(3));

-- Location: LCCOMB_X14_Y20_N28
\spi|input_shiftreg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \spi|input_shiftreg[0]~feeder_combout\ = \spi|reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \spi|reg\(0),
	combout => \spi|input_shiftreg[0]~feeder_combout\);

-- Location: FF_X14_Y20_N29
\spi|input_shiftreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \spi|input_shiftreg[0]~feeder_combout\,
	ena => \spi|bitcounter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \spi|input_shiftreg\(0));

-- Location: LCCOMB_X16_Y20_N28
\display|s0|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux6~0_combout\ = (\spi|input_shiftreg\(2) & (!\spi|input_shiftreg\(1) & (\spi|input_shiftreg\(3) $ (!\spi|input_shiftreg\(0))))) # (!\spi|input_shiftreg\(2) & (\spi|input_shiftreg\(0) & (\spi|input_shiftreg\(1) $ (!\spi|input_shiftreg\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(2),
	datab => \spi|input_shiftreg\(1),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux6~0_combout\);

-- Location: LCCOMB_X16_Y20_N2
\display|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux6~1_combout\ = (\display|s1|Mux6~0_combout\ & ((\display|Mux3~0_combout\) # ((\display|Mux6~0_combout\ & \display|s0|Mux6~0_combout\)))) # (!\display|s1|Mux6~0_combout\ & (((\display|Mux6~0_combout\ & \display|s0|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s1|Mux6~0_combout\,
	datab => \display|Mux3~0_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|s0|Mux6~0_combout\,
	combout => \display|Mux6~1_combout\);

-- Location: LCCOMB_X16_Y20_N4
\display|s0|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux5~0_combout\ = (\spi|input_shiftreg\(1) & ((\spi|input_shiftreg\(0) & ((\spi|input_shiftreg\(3)))) # (!\spi|input_shiftreg\(0) & (\spi|input_shiftreg\(2))))) # (!\spi|input_shiftreg\(1) & (\spi|input_shiftreg\(2) & (\spi|input_shiftreg\(3) 
-- $ (\spi|input_shiftreg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(2),
	datab => \spi|input_shiftreg\(1),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux5~0_combout\);

-- Location: LCCOMB_X12_Y20_N10
\display|s1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux5~0_combout\ = (\spi|input_shiftreg\(5) & ((\spi|input_shiftreg\(4) & (\spi|input_shiftreg\(7))) # (!\spi|input_shiftreg\(4) & ((\spi|input_shiftreg\(6)))))) # (!\spi|input_shiftreg\(5) & (\spi|input_shiftreg\(6) & (\spi|input_shiftreg\(7) 
-- $ (\spi|input_shiftreg\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(5),
	datab => \spi|input_shiftreg\(7),
	datac => \spi|input_shiftreg\(6),
	datad => \spi|input_shiftreg\(4),
	combout => \display|s1|Mux5~0_combout\);

-- Location: LCCOMB_X12_Y20_N20
\display|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux5~0_combout\ = (!\display|Mux6~0_combout\ & (!\display|seg_select\(3) & ((\display|seg_select\(2)) # (\display|s1|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|seg_select\(3),
	datac => \display|seg_select\(2),
	datad => \display|s1|Mux5~0_combout\,
	combout => \display|Mux5~0_combout\);

-- Location: LCCOMB_X16_Y20_N14
\display|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux5~1_combout\ = (\display|Mux5~0_combout\) # ((\display|s0|Mux5~0_combout\ & \display|Mux6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|s0|Mux5~0_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|Mux5~0_combout\,
	combout => \display|Mux5~1_combout\);

-- Location: LCCOMB_X12_Y20_N6
\display|s1|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux4~0_combout\ = (\spi|input_shiftreg\(7) & (\spi|input_shiftreg\(6) & ((\spi|input_shiftreg\(5)) # (!\spi|input_shiftreg\(4))))) # (!\spi|input_shiftreg\(7) & (\spi|input_shiftreg\(5) & (!\spi|input_shiftreg\(6) & !\spi|input_shiftreg\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(5),
	datab => \spi|input_shiftreg\(7),
	datac => \spi|input_shiftreg\(6),
	datad => \spi|input_shiftreg\(4),
	combout => \display|s1|Mux4~0_combout\);

-- Location: LCCOMB_X16_Y20_N24
\display|s0|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux4~0_combout\ = (\spi|input_shiftreg\(2) & (\spi|input_shiftreg\(3) & ((\spi|input_shiftreg\(1)) # (!\spi|input_shiftreg\(0))))) # (!\spi|input_shiftreg\(2) & (\spi|input_shiftreg\(1) & (!\spi|input_shiftreg\(3) & !\spi|input_shiftreg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(2),
	datab => \spi|input_shiftreg\(1),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux4~0_combout\);

-- Location: LCCOMB_X16_Y20_N18
\display|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux4~0_combout\ = (\display|s1|Mux4~0_combout\ & ((\display|Mux3~0_combout\) # ((\display|s0|Mux4~0_combout\ & \display|Mux6~0_combout\)))) # (!\display|s1|Mux4~0_combout\ & (((\display|s0|Mux4~0_combout\ & \display|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s1|Mux4~0_combout\,
	datab => \display|Mux3~0_combout\,
	datac => \display|s0|Mux4~0_combout\,
	datad => \display|Mux6~0_combout\,
	combout => \display|Mux4~0_combout\);

-- Location: LCCOMB_X12_Y20_N16
\display|s1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux3~0_combout\ = (\spi|input_shiftreg\(5) & ((\spi|input_shiftreg\(4) & ((\spi|input_shiftreg\(6)))) # (!\spi|input_shiftreg\(4) & (\spi|input_shiftreg\(7) & !\spi|input_shiftreg\(6))))) # (!\spi|input_shiftreg\(5) & (!\spi|input_shiftreg\(7) 
-- & (\spi|input_shiftreg\(4) $ (\spi|input_shiftreg\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(5),
	datab => \spi|input_shiftreg\(7),
	datac => \spi|input_shiftreg\(4),
	datad => \spi|input_shiftreg\(6),
	combout => \display|s1|Mux3~0_combout\);

-- Location: LCCOMB_X16_Y20_N20
\display|s0|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux3~0_combout\ = (\spi|input_shiftreg\(1) & ((\spi|input_shiftreg\(2) & ((\spi|input_shiftreg\(0)))) # (!\spi|input_shiftreg\(2) & (\spi|input_shiftreg\(3) & !\spi|input_shiftreg\(0))))) # (!\spi|input_shiftreg\(1) & (!\spi|input_shiftreg\(3) 
-- & (\spi|input_shiftreg\(2) $ (\spi|input_shiftreg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(2),
	datab => \spi|input_shiftreg\(1),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux3~0_combout\);

-- Location: LCCOMB_X16_Y20_N26
\display|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux3~1_combout\ = (\display|s1|Mux3~0_combout\ & ((\display|Mux3~0_combout\) # ((\display|s0|Mux3~0_combout\ & \display|Mux6~0_combout\)))) # (!\display|s1|Mux3~0_combout\ & (((\display|s0|Mux3~0_combout\ & \display|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|s1|Mux3~0_combout\,
	datab => \display|Mux3~0_combout\,
	datac => \display|s0|Mux3~0_combout\,
	datad => \display|Mux6~0_combout\,
	combout => \display|Mux3~1_combout\);

-- Location: LCCOMB_X12_Y20_N22
\display|s1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux2~0_combout\ = (\spi|input_shiftreg\(5) & (((!\spi|input_shiftreg\(7) & \spi|input_shiftreg\(4))))) # (!\spi|input_shiftreg\(5) & ((\spi|input_shiftreg\(6) & (!\spi|input_shiftreg\(7))) # (!\spi|input_shiftreg\(6) & 
-- ((\spi|input_shiftreg\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(6),
	datab => \spi|input_shiftreg\(7),
	datac => \spi|input_shiftreg\(5),
	datad => \spi|input_shiftreg\(4),
	combout => \display|s1|Mux2~0_combout\);

-- Location: LCCOMB_X12_Y20_N0
\display|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux2~0_combout\ = (!\display|Mux6~0_combout\ & ((\display|seg_select\(3)) # ((\display|s1|Mux2~0_combout\ & !\display|seg_select\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|s1|Mux2~0_combout\,
	datac => \display|seg_select\(2),
	datad => \display|seg_select\(3),
	combout => \display|Mux2~0_combout\);

-- Location: LCCOMB_X14_Y20_N8
\display|s0|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux2~0_combout\ = (\spi|input_shiftreg\(1) & (((!\spi|input_shiftreg\(3) & \spi|input_shiftreg\(0))))) # (!\spi|input_shiftreg\(1) & ((\spi|input_shiftreg\(2) & (!\spi|input_shiftreg\(3))) # (!\spi|input_shiftreg\(2) & 
-- ((\spi|input_shiftreg\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(1),
	datab => \spi|input_shiftreg\(2),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux2~0_combout\);

-- Location: LCCOMB_X13_Y20_N2
\display|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux2~1_combout\ = (\display|Mux2~0_combout\) # ((\display|Mux6~0_combout\ & \display|s0|Mux2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux2~0_combout\,
	datab => \display|Mux6~0_combout\,
	datad => \display|s0|Mux2~0_combout\,
	combout => \display|Mux2~1_combout\);

-- Location: LCCOMB_X12_Y20_N24
\display|s1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux1~0_combout\ = (\spi|input_shiftreg\(5) & (!\spi|input_shiftreg\(7) & ((\spi|input_shiftreg\(4)) # (!\spi|input_shiftreg\(6))))) # (!\spi|input_shiftreg\(5) & (\spi|input_shiftreg\(4) & (\spi|input_shiftreg\(7) $ 
-- (!\spi|input_shiftreg\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(5),
	datab => \spi|input_shiftreg\(7),
	datac => \spi|input_shiftreg\(6),
	datad => \spi|input_shiftreg\(4),
	combout => \display|s1|Mux1~0_combout\);

-- Location: LCCOMB_X13_Y20_N10
\display|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux1~0_combout\ = (!\display|Mux6~0_combout\ & ((\display|seg_select\(3)) # ((\display|s1|Mux1~0_combout\ & !\display|seg_select\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|seg_select\(3),
	datab => \display|s1|Mux1~0_combout\,
	datac => \display|Mux6~0_combout\,
	datad => \display|seg_select\(2),
	combout => \display|Mux1~0_combout\);

-- Location: LCCOMB_X16_Y20_N16
\display|s0|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux1~0_combout\ = (\spi|input_shiftreg\(2) & (\spi|input_shiftreg\(0) & (\spi|input_shiftreg\(1) $ (\spi|input_shiftreg\(3))))) # (!\spi|input_shiftreg\(2) & (!\spi|input_shiftreg\(3) & ((\spi|input_shiftreg\(1)) # (\spi|input_shiftreg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(2),
	datab => \spi|input_shiftreg\(1),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux1~0_combout\);

-- Location: LCCOMB_X16_Y20_N10
\display|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux1~1_combout\ = (\display|Mux1~0_combout\) # ((\display|Mux6~0_combout\ & \display|s0|Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|Mux6~0_combout\,
	datac => \display|Mux1~0_combout\,
	datad => \display|s0|Mux1~0_combout\,
	combout => \display|Mux1~1_combout\);

-- Location: LCCOMB_X12_Y20_N26
\display|s1|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s1|Mux0~0_combout\ = (\spi|input_shiftreg\(4) & ((\spi|input_shiftreg\(7)) # (\spi|input_shiftreg\(5) $ (\spi|input_shiftreg\(6))))) # (!\spi|input_shiftreg\(4) & ((\spi|input_shiftreg\(5)) # (\spi|input_shiftreg\(7) $ 
-- (\spi|input_shiftreg\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(5),
	datab => \spi|input_shiftreg\(4),
	datac => \spi|input_shiftreg\(7),
	datad => \spi|input_shiftreg\(6),
	combout => \display|s1|Mux0~0_combout\);

-- Location: LCCOMB_X12_Y20_N30
\display|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux0~0_combout\ = (!\display|Mux6~0_combout\ & ((\display|seg_select\(3)) # ((\display|s1|Mux0~0_combout\) # (\display|seg_select\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux6~0_combout\,
	datab => \display|seg_select\(3),
	datac => \display|s1|Mux0~0_combout\,
	datad => \display|seg_select\(2),
	combout => \display|Mux0~0_combout\);

-- Location: LCCOMB_X16_Y20_N12
\display|s0|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|s0|Mux0~0_combout\ = (\spi|input_shiftreg\(0) & ((\spi|input_shiftreg\(3)) # (\spi|input_shiftreg\(2) $ (\spi|input_shiftreg\(1))))) # (!\spi|input_shiftreg\(0) & ((\spi|input_shiftreg\(1)) # (\spi|input_shiftreg\(2) $ 
-- (\spi|input_shiftreg\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi|input_shiftreg\(2),
	datab => \spi|input_shiftreg\(1),
	datac => \spi|input_shiftreg\(3),
	datad => \spi|input_shiftreg\(0),
	combout => \display|s0|Mux0~0_combout\);

-- Location: LCCOMB_X16_Y20_N22
\display|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display|Mux0~1_combout\ = (\display|Mux0~0_combout\) # ((\display|Mux6~0_combout\ & \display|s0|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|Mux6~0_combout\,
	datac => \display|Mux0~0_combout\,
	datad => \display|s0|Mux0~0_combout\,
	combout => \display|Mux0~1_combout\);

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
END structure;


