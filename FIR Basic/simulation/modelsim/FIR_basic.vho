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
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "09/08/2021 13:57:58"

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
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fir_basic IS
    PORT (
	clk : IN std_logic;
	x_in : IN IEEE.NUMERIC_STD.signed(7 DOWNTO 0);
	y_out : OUT IEEE.NUMERIC_STD.signed(15 DOWNTO 0)
	);
END fir_basic;

-- Design Ports Information
-- y_out[0]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[1]	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[2]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[3]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[4]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[5]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[6]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[7]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[8]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[9]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[10]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[11]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[12]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[13]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[14]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y_out[15]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[0]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[1]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[2]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[3]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[4]	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[5]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[6]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x_in[7]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fir_basic IS
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
SIGNAL ww_x_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_y_out : std_logic_vector(15 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \y_out[0]~output_o\ : std_logic;
SIGNAL \y_out[1]~output_o\ : std_logic;
SIGNAL \y_out[2]~output_o\ : std_logic;
SIGNAL \y_out[3]~output_o\ : std_logic;
SIGNAL \y_out[4]~output_o\ : std_logic;
SIGNAL \y_out[5]~output_o\ : std_logic;
SIGNAL \y_out[6]~output_o\ : std_logic;
SIGNAL \y_out[7]~output_o\ : std_logic;
SIGNAL \y_out[8]~output_o\ : std_logic;
SIGNAL \y_out[9]~output_o\ : std_logic;
SIGNAL \y_out[10]~output_o\ : std_logic;
SIGNAL \y_out[11]~output_o\ : std_logic;
SIGNAL \y_out[12]~output_o\ : std_logic;
SIGNAL \y_out[13]~output_o\ : std_logic;
SIGNAL \y_out[14]~output_o\ : std_logic;
SIGNAL \y_out[15]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \x_in[0]~input_o\ : std_logic;
SIGNAL \tdl[0][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[0][0]~q\ : std_logic;
SIGNAL \y_out[0]~reg0feeder_combout\ : std_logic;
SIGNAL \y_out[0]~reg0_q\ : std_logic;
SIGNAL \x_in[1]~input_o\ : std_logic;
SIGNAL \tdl[0][1]~feeder_combout\ : std_logic;
SIGNAL \tdl[0][1]~q\ : std_logic;
SIGNAL \tdl[1][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[1][0]~q\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \y_out[1]~reg0_q\ : std_logic;
SIGNAL \tdl[2][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[2][0]~q\ : std_logic;
SIGNAL \x_in[2]~input_o\ : std_logic;
SIGNAL \tdl[0][2]~q\ : std_logic;
SIGNAL \tdl[1][1]~feeder_combout\ : std_logic;
SIGNAL \tdl[1][1]~q\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \y_out[2]~reg0_q\ : std_logic;
SIGNAL \x_in[3]~input_o\ : std_logic;
SIGNAL \tdl[0][3]~q\ : std_logic;
SIGNAL \tdl[1][2]~feeder_combout\ : std_logic;
SIGNAL \tdl[1][2]~q\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \tdl[2][1]~feeder_combout\ : std_logic;
SIGNAL \tdl[2][1]~q\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \tdl[3][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[3][0]~q\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \y_out[3]~reg0_q\ : std_logic;
SIGNAL \tdl[1][3]~q\ : std_logic;
SIGNAL \x_in[4]~input_o\ : std_logic;
SIGNAL \tdl[0][4]~feeder_combout\ : std_logic;
SIGNAL \tdl[0][4]~q\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \tdl[2][2]~feeder_combout\ : std_logic;
SIGNAL \tdl[2][2]~q\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \tdl[3][1]~feeder_combout\ : std_logic;
SIGNAL \tdl[3][1]~q\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \tdl[4][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[4][0]~q\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \y_out[4]~reg0_q\ : std_logic;
SIGNAL \tdl[5][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[5][0]~q\ : std_logic;
SIGNAL \x_in[5]~input_o\ : std_logic;
SIGNAL \tdl[0][5]~q\ : std_logic;
SIGNAL \tdl[1][4]~q\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \tdl[2][3]~q\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \tdl[3][2]~feeder_combout\ : std_logic;
SIGNAL \tdl[3][2]~q\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \tdl[4][1]~feeder_combout\ : std_logic;
SIGNAL \tdl[4][1]~q\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \y_out[5]~reg0_q\ : std_logic;
SIGNAL \tdl[6][0]~feeder_combout\ : std_logic;
SIGNAL \tdl[6][0]~q\ : std_logic;
SIGNAL \tdl[3][3]~feeder_combout\ : std_logic;
SIGNAL \tdl[3][3]~q\ : std_logic;
SIGNAL \tdl[1][5]~q\ : std_logic;
SIGNAL \x_in[6]~input_o\ : std_logic;
SIGNAL \tdl[0][6]~q\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \tdl[2][4]~q\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \tdl[4][2]~q\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \tdl[5][1]~q\ : std_logic;
SIGNAL \Add4~1\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \y_out[6]~reg0_q\ : std_logic;
SIGNAL \tdl[7][0]~q\ : std_logic;
SIGNAL \tdl[6][1]~q\ : std_logic;
SIGNAL \tdl[5][2]~q\ : std_logic;
SIGNAL \tdl[4][3]~q\ : std_logic;
SIGNAL \tdl[3][4]~q\ : std_logic;
SIGNAL \tdl[1][6]~q\ : std_logic;
SIGNAL \x_in[7]~input_o\ : std_logic;
SIGNAL \tdl[0][7]~q\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \tdl[2][5]~q\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Add4~3\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \Add5~1\ : std_logic;
SIGNAL \Add5~2_combout\ : std_logic;
SIGNAL \y_out[7]~9_combout\ : std_logic;
SIGNAL \y_out[7]~reg0_q\ : std_logic;
SIGNAL \tdl[7][1]~q\ : std_logic;
SIGNAL \Add7~1_cout\ : std_logic;
SIGNAL \Add7~2_combout\ : std_logic;
SIGNAL \tdl[4][4]~q\ : std_logic;
SIGNAL \tdl[3][5]~feeder_combout\ : std_logic;
SIGNAL \tdl[3][5]~q\ : std_logic;
SIGNAL \tdl[2][6]~q\ : std_logic;
SIGNAL \tdl[1][7]~q\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \tdl[5][3]~q\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \tdl[6][2]~q\ : std_logic;
SIGNAL \Add5~3\ : std_logic;
SIGNAL \Add5~4_combout\ : std_logic;
SIGNAL \y_out[7]~10\ : std_logic;
SIGNAL \y_out[8]~11_combout\ : std_logic;
SIGNAL \y_out[8]~reg0_q\ : std_logic;
SIGNAL \tdl[4][5]~feeder_combout\ : std_logic;
SIGNAL \tdl[4][5]~q\ : std_logic;
SIGNAL \tdl[3][6]~q\ : std_logic;
SIGNAL \tdl[2][7]~q\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \tdl[5][4]~q\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \tdl[6][3]~q\ : std_logic;
SIGNAL \Add5~5\ : std_logic;
SIGNAL \Add5~6_combout\ : std_logic;
SIGNAL \tdl[7][2]~q\ : std_logic;
SIGNAL \Add7~3\ : std_logic;
SIGNAL \Add7~4_combout\ : std_logic;
SIGNAL \y_out[8]~12\ : std_logic;
SIGNAL \y_out[9]~13_combout\ : std_logic;
SIGNAL \y_out[9]~reg0_q\ : std_logic;
SIGNAL \tdl[5][5]~q\ : std_logic;
SIGNAL \tdl[4][6]~q\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \tdl[3][7]~feeder_combout\ : std_logic;
SIGNAL \tdl[3][7]~q\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \tdl[6][4]~q\ : std_logic;
SIGNAL \Add5~7\ : std_logic;
SIGNAL \Add5~8_combout\ : std_logic;
SIGNAL \tdl[7][3]~q\ : std_logic;
SIGNAL \Add7~5\ : std_logic;
SIGNAL \Add7~6_combout\ : std_logic;
SIGNAL \y_out[9]~14\ : std_logic;
SIGNAL \y_out[10]~15_combout\ : std_logic;
SIGNAL \y_out[10]~reg0_q\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \tdl[4][7]~feeder_combout\ : std_logic;
SIGNAL \tdl[4][7]~q\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \tdl[5][6]~q\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \tdl[6][5]~q\ : std_logic;
SIGNAL \Add5~9\ : std_logic;
SIGNAL \Add5~10_combout\ : std_logic;
SIGNAL \tdl[7][4]~q\ : std_logic;
SIGNAL \Add7~7\ : std_logic;
SIGNAL \Add7~8_combout\ : std_logic;
SIGNAL \y_out[10]~16\ : std_logic;
SIGNAL \y_out[11]~17_combout\ : std_logic;
SIGNAL \y_out[11]~reg0_q\ : std_logic;
SIGNAL \tdl[5][7]~feeder_combout\ : std_logic;
SIGNAL \tdl[5][7]~q\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \tdl[6][6]~q\ : std_logic;
SIGNAL \Add5~11\ : std_logic;
SIGNAL \Add5~12_combout\ : std_logic;
SIGNAL \tdl[7][5]~q\ : std_logic;
SIGNAL \Add7~9\ : std_logic;
SIGNAL \Add7~10_combout\ : std_logic;
SIGNAL \y_out[11]~18\ : std_logic;
SIGNAL \y_out[12]~19_combout\ : std_logic;
SIGNAL \y_out[12]~reg0_q\ : std_logic;
SIGNAL \tdl[6][7]~feeder_combout\ : std_logic;
SIGNAL \tdl[6][7]~q\ : std_logic;
SIGNAL \Add4~15\ : std_logic;
SIGNAL \Add4~16_combout\ : std_logic;
SIGNAL \Add5~13\ : std_logic;
SIGNAL \Add5~14_combout\ : std_logic;
SIGNAL \tdl[7][6]~q\ : std_logic;
SIGNAL \Add7~11\ : std_logic;
SIGNAL \Add7~12_combout\ : std_logic;
SIGNAL \y_out[12]~20\ : std_logic;
SIGNAL \y_out[13]~21_combout\ : std_logic;
SIGNAL \y_out[13]~reg0_q\ : std_logic;
SIGNAL \tdl[7][7]~q\ : std_logic;
SIGNAL \Add7~13\ : std_logic;
SIGNAL \Add7~14_combout\ : std_logic;
SIGNAL \Add5~15\ : std_logic;
SIGNAL \Add5~16_combout\ : std_logic;
SIGNAL \y_out[13]~22\ : std_logic;
SIGNAL \y_out[14]~23_combout\ : std_logic;
SIGNAL \y_out[14]~reg0_q\ : std_logic;
SIGNAL \Add7~15\ : std_logic;
SIGNAL \Add7~16_combout\ : std_logic;
SIGNAL \y_out[14]~24\ : std_logic;
SIGNAL \y_out[15]~25_combout\ : std_logic;
SIGNAL \y_out[15]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_clk~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_x_in <= IEEE.STD_LOGIC_1164.STD_LOGIC_VECTOR(x_in);
y_out <= IEEE.NUMERIC_STD.SIGNED(ww_y_out);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clk~inputclkctrl_outclk\ <= NOT \clk~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y19_N16
\y_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[0]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\y_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[1]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\y_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[2]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\y_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[3]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\y_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[4]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\y_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[5]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\y_out[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[6]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[6]~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\y_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[7]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[7]~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\y_out[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[8]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[8]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\y_out[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[9]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[9]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\y_out[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[10]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[10]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\y_out[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[11]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[11]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\y_out[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[12]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[12]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\y_out[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[13]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[13]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\y_out[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[14]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[14]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\y_out[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y_out[15]~reg0_q\,
	devoe => ww_devoe,
	o => \y_out[15]~output_o\);

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

-- Location: IOIBUF_X34_Y12_N8
\x_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(0),
	o => \x_in[0]~input_o\);

-- Location: LCCOMB_X33_Y19_N6
\tdl[0][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[0][0]~feeder_combout\ = \x_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \x_in[0]~input_o\,
	combout => \tdl[0][0]~feeder_combout\);

-- Location: FF_X33_Y19_N7
\tdl[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[0][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][0]~q\);

-- Location: LCCOMB_X33_Y19_N4
\y_out[0]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[0]~reg0feeder_combout\ = \tdl[0][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[0][0]~q\,
	combout => \y_out[0]~reg0feeder_combout\);

-- Location: FF_X33_Y19_N5
\y_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[0]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[0]~reg0_q\);

-- Location: IOIBUF_X34_Y12_N1
\x_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(1),
	o => \x_in[1]~input_o\);

-- Location: LCCOMB_X21_Y19_N26
\tdl[0][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[0][1]~feeder_combout\ = \x_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \x_in[1]~input_o\,
	combout => \tdl[0][1]~feeder_combout\);

-- Location: FF_X21_Y19_N27
\tdl[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[0][1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][1]~q\);

-- Location: LCCOMB_X21_Y19_N28
\tdl[1][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[1][0]~feeder_combout\ = \tdl[0][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[0][0]~q\,
	combout => \tdl[1][0]~feeder_combout\);

-- Location: FF_X21_Y19_N29
\tdl[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[1][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][0]~q\);

-- Location: LCCOMB_X21_Y19_N4
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\tdl[0][1]~q\ & (\tdl[1][0]~q\ $ (VCC))) # (!\tdl[0][1]~q\ & (\tdl[1][0]~q\ & VCC))
-- \Add0~1\ = CARRY((\tdl[0][1]~q\ & \tdl[1][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[0][1]~q\,
	datab => \tdl[1][0]~q\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: FF_X21_Y19_N5
\y_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[1]~reg0_q\);

-- Location: LCCOMB_X22_Y19_N8
\tdl[2][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[2][0]~feeder_combout\ = \tdl[1][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[1][0]~q\,
	combout => \tdl[2][0]~feeder_combout\);

-- Location: FF_X22_Y19_N9
\tdl[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[2][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][0]~q\);

-- Location: IOIBUF_X18_Y24_N15
\x_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(2),
	o => \x_in[2]~input_o\);

-- Location: FF_X21_Y19_N31
\tdl[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \x_in[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][2]~q\);

-- Location: LCCOMB_X21_Y19_N24
\tdl[1][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[1][1]~feeder_combout\ = \tdl[0][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[0][1]~q\,
	combout => \tdl[1][1]~feeder_combout\);

-- Location: FF_X21_Y19_N25
\tdl[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[1][1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][1]~q\);

-- Location: LCCOMB_X21_Y19_N6
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\tdl[0][2]~q\ & ((\tdl[1][1]~q\ & (\Add0~1\ & VCC)) # (!\tdl[1][1]~q\ & (!\Add0~1\)))) # (!\tdl[0][2]~q\ & ((\tdl[1][1]~q\ & (!\Add0~1\)) # (!\tdl[1][1]~q\ & ((\Add0~1\) # (GND)))))
-- \Add0~3\ = CARRY((\tdl[0][2]~q\ & (!\tdl[1][1]~q\ & !\Add0~1\)) # (!\tdl[0][2]~q\ & ((!\Add0~1\) # (!\tdl[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[0][2]~q\,
	datab => \tdl[1][1]~q\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X22_Y19_N10
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\tdl[2][0]~q\ & (\Add0~2_combout\ $ (VCC))) # (!\tdl[2][0]~q\ & (\Add0~2_combout\ & VCC))
-- \Add1~1\ = CARRY((\tdl[2][0]~q\ & \Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[2][0]~q\,
	datab => \Add0~2_combout\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: FF_X22_Y19_N11
\y_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Add1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[2]~reg0_q\);

-- Location: IOIBUF_X16_Y24_N15
\x_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(3),
	o => \x_in[3]~input_o\);

-- Location: FF_X21_Y19_N23
\tdl[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \x_in[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][3]~q\);

-- Location: LCCOMB_X21_Y19_N2
\tdl[1][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[1][2]~feeder_combout\ = \tdl[0][2]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[0][2]~q\,
	combout => \tdl[1][2]~feeder_combout\);

-- Location: FF_X21_Y19_N3
\tdl[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[1][2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][2]~q\);

-- Location: LCCOMB_X21_Y19_N8
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\tdl[0][3]~q\ $ (\tdl[1][2]~q\ $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\tdl[0][3]~q\ & ((\tdl[1][2]~q\) # (!\Add0~3\))) # (!\tdl[0][3]~q\ & (\tdl[1][2]~q\ & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[0][3]~q\,
	datab => \tdl[1][2]~q\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X22_Y19_N30
\tdl[2][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[2][1]~feeder_combout\ = \tdl[1][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[1][1]~q\,
	combout => \tdl[2][1]~feeder_combout\);

-- Location: FF_X22_Y19_N31
\tdl[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[2][1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][1]~q\);

-- Location: LCCOMB_X22_Y19_N12
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\Add0~4_combout\ & ((\tdl[2][1]~q\ & (\Add1~1\ & VCC)) # (!\tdl[2][1]~q\ & (!\Add1~1\)))) # (!\Add0~4_combout\ & ((\tdl[2][1]~q\ & (!\Add1~1\)) # (!\tdl[2][1]~q\ & ((\Add1~1\) # (GND)))))
-- \Add1~3\ = CARRY((\Add0~4_combout\ & (!\tdl[2][1]~q\ & !\Add1~1\)) # (!\Add0~4_combout\ & ((!\Add1~1\) # (!\tdl[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \tdl[2][1]~q\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X23_Y19_N28
\tdl[3][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[3][0]~feeder_combout\ = \tdl[2][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[2][0]~q\,
	combout => \tdl[3][0]~feeder_combout\);

-- Location: FF_X23_Y19_N29
\tdl[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[3][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][0]~q\);

-- Location: LCCOMB_X23_Y19_N10
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = (\Add1~2_combout\ & (\tdl[3][0]~q\ $ (VCC))) # (!\Add1~2_combout\ & (\tdl[3][0]~q\ & VCC))
-- \Add2~1\ = CARRY((\Add1~2_combout\ & \tdl[3][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \tdl[3][0]~q\,
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: FF_X23_Y19_N11
\y_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Add2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[3]~reg0_q\);

-- Location: FF_X21_Y19_N11
\tdl[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[0][3]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][3]~q\);

-- Location: IOIBUF_X16_Y24_N1
\x_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(4),
	o => \x_in[4]~input_o\);

-- Location: LCCOMB_X21_Y19_N0
\tdl[0][4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[0][4]~feeder_combout\ = \x_in[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \x_in[4]~input_o\,
	combout => \tdl[0][4]~feeder_combout\);

-- Location: FF_X21_Y19_N1
\tdl[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[0][4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][4]~q\);

-- Location: LCCOMB_X21_Y19_N10
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\tdl[1][3]~q\ & ((\tdl[0][4]~q\ & (\Add0~5\ & VCC)) # (!\tdl[0][4]~q\ & (!\Add0~5\)))) # (!\tdl[1][3]~q\ & ((\tdl[0][4]~q\ & (!\Add0~5\)) # (!\tdl[0][4]~q\ & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\tdl[1][3]~q\ & (!\tdl[0][4]~q\ & !\Add0~5\)) # (!\tdl[1][3]~q\ & ((!\Add0~5\) # (!\tdl[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[1][3]~q\,
	datab => \tdl[0][4]~q\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X22_Y19_N0
\tdl[2][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[2][2]~feeder_combout\ = \tdl[1][2]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[1][2]~q\,
	combout => \tdl[2][2]~feeder_combout\);

-- Location: FF_X22_Y19_N1
\tdl[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[2][2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][2]~q\);

-- Location: LCCOMB_X22_Y19_N14
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((\Add0~6_combout\ $ (\tdl[2][2]~q\ $ (!\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((\Add0~6_combout\ & ((\tdl[2][2]~q\) # (!\Add1~3\))) # (!\Add0~6_combout\ & (\tdl[2][2]~q\ & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \tdl[2][2]~q\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X23_Y19_N2
\tdl[3][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[3][1]~feeder_combout\ = \tdl[2][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[2][1]~q\,
	combout => \tdl[3][1]~feeder_combout\);

-- Location: FF_X23_Y19_N3
\tdl[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[3][1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][1]~q\);

-- Location: LCCOMB_X23_Y19_N12
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (\Add1~4_combout\ & ((\tdl[3][1]~q\ & (\Add2~1\ & VCC)) # (!\tdl[3][1]~q\ & (!\Add2~1\)))) # (!\Add1~4_combout\ & ((\tdl[3][1]~q\ & (!\Add2~1\)) # (!\tdl[3][1]~q\ & ((\Add2~1\) # (GND)))))
-- \Add2~3\ = CARRY((\Add1~4_combout\ & (!\tdl[3][1]~q\ & !\Add2~1\)) # (!\Add1~4_combout\ & ((!\Add2~1\) # (!\tdl[3][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~4_combout\,
	datab => \tdl[3][1]~q\,
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X24_Y19_N18
\tdl[4][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[4][0]~feeder_combout\ = \tdl[3][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[3][0]~q\,
	combout => \tdl[4][0]~feeder_combout\);

-- Location: FF_X24_Y19_N19
\tdl[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[4][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][0]~q\);

-- Location: LCCOMB_X24_Y19_N0
\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = (\Add2~2_combout\ & (\tdl[4][0]~q\ $ (VCC))) # (!\Add2~2_combout\ & (\tdl[4][0]~q\ & VCC))
-- \Add3~1\ = CARRY((\Add2~2_combout\ & \tdl[4][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~2_combout\,
	datab => \tdl[4][0]~q\,
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: FF_X24_Y19_N1
\y_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Add3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[4]~reg0_q\);

-- Location: LCCOMB_X28_Y19_N20
\tdl[5][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[5][0]~feeder_combout\ = \tdl[4][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[4][0]~q\,
	combout => \tdl[5][0]~feeder_combout\);

-- Location: FF_X28_Y19_N21
\tdl[5][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[5][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][0]~q\);

-- Location: IOIBUF_X18_Y24_N22
\x_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(5),
	o => \x_in[5]~input_o\);

-- Location: FF_X21_Y19_N7
\tdl[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \x_in[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][5]~q\);

-- Location: FF_X21_Y19_N9
\tdl[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[0][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][4]~q\);

-- Location: LCCOMB_X21_Y19_N12
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\tdl[0][5]~q\ $ (\tdl[1][4]~q\ $ (!\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\tdl[0][5]~q\ & ((\tdl[1][4]~q\) # (!\Add0~7\))) # (!\tdl[0][5]~q\ & (\tdl[1][4]~q\ & !\Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[0][5]~q\,
	datab => \tdl[1][4]~q\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: FF_X22_Y19_N3
\tdl[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[1][3]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][3]~q\);

-- Location: LCCOMB_X22_Y19_N16
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\Add0~8_combout\ & ((\tdl[2][3]~q\ & (\Add1~5\ & VCC)) # (!\tdl[2][3]~q\ & (!\Add1~5\)))) # (!\Add0~8_combout\ & ((\tdl[2][3]~q\ & (!\Add1~5\)) # (!\tdl[2][3]~q\ & ((\Add1~5\) # (GND)))))
-- \Add1~7\ = CARRY((\Add0~8_combout\ & (!\tdl[2][3]~q\ & !\Add1~5\)) # (!\Add0~8_combout\ & ((!\Add1~5\) # (!\tdl[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \tdl[2][3]~q\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X23_Y19_N4
\tdl[3][2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[3][2]~feeder_combout\ = \tdl[2][2]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[2][2]~q\,
	combout => \tdl[3][2]~feeder_combout\);

-- Location: FF_X23_Y19_N5
\tdl[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[3][2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][2]~q\);

-- Location: LCCOMB_X23_Y19_N14
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = ((\Add1~6_combout\ $ (\tdl[3][2]~q\ $ (!\Add2~3\)))) # (GND)
-- \Add2~5\ = CARRY((\Add1~6_combout\ & ((\tdl[3][2]~q\) # (!\Add2~3\))) # (!\Add1~6_combout\ & (\tdl[3][2]~q\ & !\Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~6_combout\,
	datab => \tdl[3][2]~q\,
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCCOMB_X24_Y19_N28
\tdl[4][1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[4][1]~feeder_combout\ = \tdl[3][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[3][1]~q\,
	combout => \tdl[4][1]~feeder_combout\);

-- Location: FF_X24_Y19_N29
\tdl[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[4][1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][1]~q\);

-- Location: LCCOMB_X24_Y19_N2
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\Add2~4_combout\ & ((\tdl[4][1]~q\ & (\Add3~1\ & VCC)) # (!\tdl[4][1]~q\ & (!\Add3~1\)))) # (!\Add2~4_combout\ & ((\tdl[4][1]~q\ & (!\Add3~1\)) # (!\tdl[4][1]~q\ & ((\Add3~1\) # (GND)))))
-- \Add3~3\ = CARRY((\Add2~4_combout\ & (!\tdl[4][1]~q\ & !\Add3~1\)) # (!\Add2~4_combout\ & ((!\Add3~1\) # (!\tdl[4][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~4_combout\,
	datab => \tdl[4][1]~q\,
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X28_Y19_N2
\Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = (\tdl[5][0]~q\ & (\Add3~2_combout\ $ (VCC))) # (!\tdl[5][0]~q\ & (\Add3~2_combout\ & VCC))
-- \Add4~1\ = CARRY((\tdl[5][0]~q\ & \Add3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[5][0]~q\,
	datab => \Add3~2_combout\,
	datad => VCC,
	combout => \Add4~0_combout\,
	cout => \Add4~1\);

-- Location: FF_X28_Y19_N3
\y_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Add4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[5]~reg0_q\);

-- Location: LCCOMB_X29_Y19_N20
\tdl[6][0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[6][0]~feeder_combout\ = \tdl[5][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[5][0]~q\,
	combout => \tdl[6][0]~feeder_combout\);

-- Location: FF_X29_Y19_N21
\tdl[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[6][0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][0]~q\);

-- Location: LCCOMB_X23_Y19_N30
\tdl[3][3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[3][3]~feeder_combout\ = \tdl[2][3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[2][3]~q\,
	combout => \tdl[3][3]~feeder_combout\);

-- Location: FF_X23_Y19_N31
\tdl[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[3][3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][3]~q\);

-- Location: FF_X21_Y19_N13
\tdl[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[0][5]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][5]~q\);

-- Location: IOIBUF_X28_Y24_N8
\x_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(6),
	o => \x_in[6]~input_o\);

-- Location: FF_X21_Y19_N15
\tdl[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \x_in[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][6]~q\);

-- Location: LCCOMB_X21_Y19_N14
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\tdl[1][5]~q\ & ((\tdl[0][6]~q\ & (\Add0~9\ & VCC)) # (!\tdl[0][6]~q\ & (!\Add0~9\)))) # (!\tdl[1][5]~q\ & ((\tdl[0][6]~q\ & (!\Add0~9\)) # (!\tdl[0][6]~q\ & ((\Add0~9\) # (GND)))))
-- \Add0~11\ = CARRY((\tdl[1][5]~q\ & (!\tdl[0][6]~q\ & !\Add0~9\)) # (!\tdl[1][5]~q\ & ((!\Add0~9\) # (!\tdl[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[1][5]~q\,
	datab => \tdl[0][6]~q\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X22_Y19_N5
\tdl[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[1][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][4]~q\);

-- Location: LCCOMB_X22_Y19_N18
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = ((\Add0~10_combout\ $ (\tdl[2][4]~q\ $ (!\Add1~7\)))) # (GND)
-- \Add1~9\ = CARRY((\Add0~10_combout\ & ((\tdl[2][4]~q\) # (!\Add1~7\))) # (!\Add0~10_combout\ & (\tdl[2][4]~q\ & !\Add1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datab => \tdl[2][4]~q\,
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X23_Y19_N16
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (\tdl[3][3]~q\ & ((\Add1~8_combout\ & (\Add2~5\ & VCC)) # (!\Add1~8_combout\ & (!\Add2~5\)))) # (!\tdl[3][3]~q\ & ((\Add1~8_combout\ & (!\Add2~5\)) # (!\Add1~8_combout\ & ((\Add2~5\) # (GND)))))
-- \Add2~7\ = CARRY((\tdl[3][3]~q\ & (!\Add1~8_combout\ & !\Add2~5\)) # (!\tdl[3][3]~q\ & ((!\Add2~5\) # (!\Add1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[3][3]~q\,
	datab => \Add1~8_combout\,
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: FF_X24_Y19_N31
\tdl[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[3][2]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][2]~q\);

-- Location: LCCOMB_X24_Y19_N4
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = ((\Add2~6_combout\ $ (\tdl[4][2]~q\ $ (!\Add3~3\)))) # (GND)
-- \Add3~5\ = CARRY((\Add2~6_combout\ & ((\tdl[4][2]~q\) # (!\Add3~3\))) # (!\Add2~6_combout\ & (\tdl[4][2]~q\ & !\Add3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~6_combout\,
	datab => \tdl[4][2]~q\,
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: FF_X28_Y19_N5
\tdl[5][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[4][1]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][1]~q\);

-- Location: LCCOMB_X28_Y19_N4
\Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (\Add3~4_combout\ & ((\tdl[5][1]~q\ & (\Add4~1\ & VCC)) # (!\tdl[5][1]~q\ & (!\Add4~1\)))) # (!\Add3~4_combout\ & ((\tdl[5][1]~q\ & (!\Add4~1\)) # (!\tdl[5][1]~q\ & ((\Add4~1\) # (GND)))))
-- \Add4~3\ = CARRY((\Add3~4_combout\ & (!\tdl[5][1]~q\ & !\Add4~1\)) # (!\Add3~4_combout\ & ((!\Add4~1\) # (!\tdl[5][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~4_combout\,
	datab => \tdl[5][1]~q\,
	datad => VCC,
	cin => \Add4~1\,
	combout => \Add4~2_combout\,
	cout => \Add4~3\);

-- Location: LCCOMB_X29_Y19_N2
\Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = (\tdl[6][0]~q\ & (\Add4~2_combout\ $ (VCC))) # (!\tdl[6][0]~q\ & (\Add4~2_combout\ & VCC))
-- \Add5~1\ = CARRY((\tdl[6][0]~q\ & \Add4~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[6][0]~q\,
	datab => \Add4~2_combout\,
	datad => VCC,
	combout => \Add5~0_combout\,
	cout => \Add5~1\);

-- Location: FF_X29_Y19_N3
\y_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Add5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[6]~reg0_q\);

-- Location: FF_X31_Y19_N9
\tdl[7][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][0]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][0]~q\);

-- Location: FF_X29_Y19_N5
\tdl[6][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[5][1]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][1]~q\);

-- Location: FF_X28_Y19_N7
\tdl[5][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[4][2]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][2]~q\);

-- Location: FF_X24_Y19_N25
\tdl[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[3][3]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][3]~q\);

-- Location: FF_X23_Y19_N1
\tdl[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[2][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][4]~q\);

-- Location: FF_X21_Y19_N17
\tdl[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[0][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][6]~q\);

-- Location: IOIBUF_X16_Y24_N8
\x_in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x_in(7),
	o => \x_in[7]~input_o\);

-- Location: FF_X21_Y19_N19
\tdl[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \x_in[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[0][7]~q\);

-- Location: LCCOMB_X21_Y19_N16
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((\tdl[1][6]~q\ $ (\tdl[0][7]~q\ $ (!\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((\tdl[1][6]~q\ & ((\tdl[0][7]~q\) # (!\Add0~11\))) # (!\tdl[1][6]~q\ & (\tdl[0][7]~q\ & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[1][6]~q\,
	datab => \tdl[0][7]~q\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: FF_X22_Y19_N29
\tdl[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[1][5]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][5]~q\);

-- Location: LCCOMB_X22_Y19_N20
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Add0~12_combout\ & ((\tdl[2][5]~q\ & (\Add1~9\ & VCC)) # (!\tdl[2][5]~q\ & (!\Add1~9\)))) # (!\Add0~12_combout\ & ((\tdl[2][5]~q\ & (!\Add1~9\)) # (!\tdl[2][5]~q\ & ((\Add1~9\) # (GND)))))
-- \Add1~11\ = CARRY((\Add0~12_combout\ & (!\tdl[2][5]~q\ & !\Add1~9\)) # (!\Add0~12_combout\ & ((!\Add1~9\) # (!\tdl[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~12_combout\,
	datab => \tdl[2][5]~q\,
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X23_Y19_N18
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = ((\tdl[3][4]~q\ $ (\Add1~10_combout\ $ (!\Add2~7\)))) # (GND)
-- \Add2~9\ = CARRY((\tdl[3][4]~q\ & ((\Add1~10_combout\) # (!\Add2~7\))) # (!\tdl[3][4]~q\ & (\Add1~10_combout\ & !\Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[3][4]~q\,
	datab => \Add1~10_combout\,
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X24_Y19_N6
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\tdl[4][3]~q\ & ((\Add2~8_combout\ & (\Add3~5\ & VCC)) # (!\Add2~8_combout\ & (!\Add3~5\)))) # (!\tdl[4][3]~q\ & ((\Add2~8_combout\ & (!\Add3~5\)) # (!\Add2~8_combout\ & ((\Add3~5\) # (GND)))))
-- \Add3~7\ = CARRY((\tdl[4][3]~q\ & (!\Add2~8_combout\ & !\Add3~5\)) # (!\tdl[4][3]~q\ & ((!\Add3~5\) # (!\Add2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[4][3]~q\,
	datab => \Add2~8_combout\,
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X28_Y19_N6
\Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = ((\tdl[5][2]~q\ $ (\Add3~6_combout\ $ (!\Add4~3\)))) # (GND)
-- \Add4~5\ = CARRY((\tdl[5][2]~q\ & ((\Add3~6_combout\) # (!\Add4~3\))) # (!\tdl[5][2]~q\ & (\Add3~6_combout\ & !\Add4~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[5][2]~q\,
	datab => \Add3~6_combout\,
	datad => VCC,
	cin => \Add4~3\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

-- Location: LCCOMB_X29_Y19_N4
\Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~2_combout\ = (\tdl[6][1]~q\ & ((\Add4~4_combout\ & (\Add5~1\ & VCC)) # (!\Add4~4_combout\ & (!\Add5~1\)))) # (!\tdl[6][1]~q\ & ((\Add4~4_combout\ & (!\Add5~1\)) # (!\Add4~4_combout\ & ((\Add5~1\) # (GND)))))
-- \Add5~3\ = CARRY((\tdl[6][1]~q\ & (!\Add4~4_combout\ & !\Add5~1\)) # (!\tdl[6][1]~q\ & ((!\Add5~1\) # (!\Add4~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[6][1]~q\,
	datab => \Add4~4_combout\,
	datad => VCC,
	cin => \Add5~1\,
	combout => \Add5~2_combout\,
	cout => \Add5~3\);

-- Location: LCCOMB_X30_Y19_N8
\y_out[7]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[7]~9_combout\ = (\tdl[7][0]~q\ & (\Add5~2_combout\ $ (VCC))) # (!\tdl[7][0]~q\ & (\Add5~2_combout\ & VCC))
-- \y_out[7]~10\ = CARRY((\tdl[7][0]~q\ & \Add5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[7][0]~q\,
	datab => \Add5~2_combout\,
	datad => VCC,
	combout => \y_out[7]~9_combout\,
	cout => \y_out[7]~10\);

-- Location: FF_X30_Y19_N9
\y_out[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[7]~reg0_q\);

-- Location: FF_X31_Y19_N11
\tdl[7][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][1]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][1]~q\);

-- Location: LCCOMB_X31_Y19_N8
\Add7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~1_cout\ = CARRY(!\tdl[7][0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tdl[7][0]~q\,
	datad => VCC,
	cout => \Add7~1_cout\);

-- Location: LCCOMB_X31_Y19_N10
\Add7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~2_combout\ = (\tdl[7][1]~q\ & ((\Add7~1_cout\) # (GND))) # (!\tdl[7][1]~q\ & (!\Add7~1_cout\))
-- \Add7~3\ = CARRY((\tdl[7][1]~q\) # (!\Add7~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[7][1]~q\,
	datad => VCC,
	cin => \Add7~1_cout\,
	combout => \Add7~2_combout\,
	cout => \Add7~3\);

-- Location: FF_X24_Y19_N23
\tdl[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[3][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][4]~q\);

-- Location: LCCOMB_X23_Y19_N8
\tdl[3][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[3][5]~feeder_combout\ = \tdl[2][5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[2][5]~q\,
	combout => \tdl[3][5]~feeder_combout\);

-- Location: FF_X23_Y19_N9
\tdl[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[3][5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][5]~q\);

-- Location: FF_X22_Y19_N23
\tdl[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[1][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][6]~q\);

-- Location: FF_X21_Y19_N21
\tdl[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[0][7]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[1][7]~q\);

-- Location: LCCOMB_X21_Y19_N18
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\tdl[1][7]~q\ & ((\tdl[0][7]~q\ & (\Add0~13\ & VCC)) # (!\tdl[0][7]~q\ & (!\Add0~13\)))) # (!\tdl[1][7]~q\ & ((\tdl[0][7]~q\ & (!\Add0~13\)) # (!\tdl[0][7]~q\ & ((\Add0~13\) # (GND)))))
-- \Add0~15\ = CARRY((\tdl[1][7]~q\ & (!\tdl[0][7]~q\ & !\Add0~13\)) # (!\tdl[1][7]~q\ & ((!\Add0~13\) # (!\tdl[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[1][7]~q\,
	datab => \tdl[0][7]~q\,
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X22_Y19_N22
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = ((\tdl[2][6]~q\ $ (\Add0~14_combout\ $ (!\Add1~11\)))) # (GND)
-- \Add1~13\ = CARRY((\tdl[2][6]~q\ & ((\Add0~14_combout\) # (!\Add1~11\))) # (!\tdl[2][6]~q\ & (\Add0~14_combout\ & !\Add1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[2][6]~q\,
	datab => \Add0~14_combout\,
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X23_Y19_N20
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (\tdl[3][5]~q\ & ((\Add1~12_combout\ & (\Add2~9\ & VCC)) # (!\Add1~12_combout\ & (!\Add2~9\)))) # (!\tdl[3][5]~q\ & ((\Add1~12_combout\ & (!\Add2~9\)) # (!\Add1~12_combout\ & ((\Add2~9\) # (GND)))))
-- \Add2~11\ = CARRY((\tdl[3][5]~q\ & (!\Add1~12_combout\ & !\Add2~9\)) # (!\tdl[3][5]~q\ & ((!\Add2~9\) # (!\Add1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[3][5]~q\,
	datab => \Add1~12_combout\,
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCCOMB_X24_Y19_N8
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = ((\tdl[4][4]~q\ $ (\Add2~10_combout\ $ (!\Add3~7\)))) # (GND)
-- \Add3~9\ = CARRY((\tdl[4][4]~q\ & ((\Add2~10_combout\) # (!\Add3~7\))) # (!\tdl[4][4]~q\ & (\Add2~10_combout\ & !\Add3~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[4][4]~q\,
	datab => \Add2~10_combout\,
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: FF_X28_Y19_N9
\tdl[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[4][3]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][3]~q\);

-- Location: LCCOMB_X28_Y19_N8
\Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = (\Add3~8_combout\ & ((\tdl[5][3]~q\ & (\Add4~5\ & VCC)) # (!\tdl[5][3]~q\ & (!\Add4~5\)))) # (!\Add3~8_combout\ & ((\tdl[5][3]~q\ & (!\Add4~5\)) # (!\tdl[5][3]~q\ & ((\Add4~5\) # (GND)))))
-- \Add4~7\ = CARRY((\Add3~8_combout\ & (!\tdl[5][3]~q\ & !\Add4~5\)) # (!\Add3~8_combout\ & ((!\Add4~5\) # (!\tdl[5][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~8_combout\,
	datab => \tdl[5][3]~q\,
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

-- Location: FF_X29_Y19_N7
\tdl[6][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[5][2]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][2]~q\);

-- Location: LCCOMB_X29_Y19_N6
\Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~4_combout\ = ((\Add4~6_combout\ $ (\tdl[6][2]~q\ $ (!\Add5~3\)))) # (GND)
-- \Add5~5\ = CARRY((\Add4~6_combout\ & ((\tdl[6][2]~q\) # (!\Add5~3\))) # (!\Add4~6_combout\ & (\tdl[6][2]~q\ & !\Add5~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~6_combout\,
	datab => \tdl[6][2]~q\,
	datad => VCC,
	cin => \Add5~3\,
	combout => \Add5~4_combout\,
	cout => \Add5~5\);

-- Location: LCCOMB_X30_Y19_N10
\y_out[8]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[8]~11_combout\ = (\Add7~2_combout\ & ((\Add5~4_combout\ & (\y_out[7]~10\ & VCC)) # (!\Add5~4_combout\ & (!\y_out[7]~10\)))) # (!\Add7~2_combout\ & ((\Add5~4_combout\ & (!\y_out[7]~10\)) # (!\Add5~4_combout\ & ((\y_out[7]~10\) # (GND)))))
-- \y_out[8]~12\ = CARRY((\Add7~2_combout\ & (!\Add5~4_combout\ & !\y_out[7]~10\)) # (!\Add7~2_combout\ & ((!\y_out[7]~10\) # (!\Add5~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~2_combout\,
	datab => \Add5~4_combout\,
	datad => VCC,
	cin => \y_out[7]~10\,
	combout => \y_out[8]~11_combout\,
	cout => \y_out[8]~12\);

-- Location: FF_X30_Y19_N11
\y_out[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[8]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[8]~reg0_q\);

-- Location: LCCOMB_X24_Y19_N20
\tdl[4][5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[4][5]~feeder_combout\ = \tdl[3][5]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[3][5]~q\,
	combout => \tdl[4][5]~feeder_combout\);

-- Location: FF_X24_Y19_N21
\tdl[4][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[4][5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][5]~q\);

-- Location: FF_X23_Y19_N13
\tdl[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[2][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][6]~q\);

-- Location: FF_X22_Y19_N7
\tdl[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[1][7]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[2][7]~q\);

-- Location: LCCOMB_X21_Y19_N20
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = \tdl[0][7]~q\ $ (\Add0~15\ $ (!\tdl[1][7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[0][7]~q\,
	datad => \tdl[1][7]~q\,
	cin => \Add0~15\,
	combout => \Add0~16_combout\);

-- Location: LCCOMB_X22_Y19_N24
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\tdl[2][7]~q\ & ((\Add0~16_combout\ & (\Add1~13\ & VCC)) # (!\Add0~16_combout\ & (!\Add1~13\)))) # (!\tdl[2][7]~q\ & ((\Add0~16_combout\ & (!\Add1~13\)) # (!\Add0~16_combout\ & ((\Add1~13\) # (GND)))))
-- \Add1~15\ = CARRY((\tdl[2][7]~q\ & (!\Add0~16_combout\ & !\Add1~13\)) # (!\tdl[2][7]~q\ & ((!\Add1~13\) # (!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[2][7]~q\,
	datab => \Add0~16_combout\,
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X23_Y19_N22
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = ((\tdl[3][6]~q\ $ (\Add1~14_combout\ $ (!\Add2~11\)))) # (GND)
-- \Add2~13\ = CARRY((\tdl[3][6]~q\ & ((\Add1~14_combout\) # (!\Add2~11\))) # (!\tdl[3][6]~q\ & (\Add1~14_combout\ & !\Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[3][6]~q\,
	datab => \Add1~14_combout\,
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: LCCOMB_X24_Y19_N10
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (\tdl[4][5]~q\ & ((\Add2~12_combout\ & (\Add3~9\ & VCC)) # (!\Add2~12_combout\ & (!\Add3~9\)))) # (!\tdl[4][5]~q\ & ((\Add2~12_combout\ & (!\Add3~9\)) # (!\Add2~12_combout\ & ((\Add3~9\) # (GND)))))
-- \Add3~11\ = CARRY((\tdl[4][5]~q\ & (!\Add2~12_combout\ & !\Add3~9\)) # (!\tdl[4][5]~q\ & ((!\Add3~9\) # (!\Add2~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[4][5]~q\,
	datab => \Add2~12_combout\,
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: FF_X28_Y19_N11
\tdl[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[4][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][4]~q\);

-- Location: LCCOMB_X28_Y19_N10
\Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = ((\Add3~10_combout\ $ (\tdl[5][4]~q\ $ (!\Add4~7\)))) # (GND)
-- \Add4~9\ = CARRY((\Add3~10_combout\ & ((\tdl[5][4]~q\) # (!\Add4~7\))) # (!\Add3~10_combout\ & (\tdl[5][4]~q\ & !\Add4~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~10_combout\,
	datab => \tdl[5][4]~q\,
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

-- Location: FF_X29_Y19_N9
\tdl[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[5][3]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][3]~q\);

-- Location: LCCOMB_X29_Y19_N8
\Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~6_combout\ = (\Add4~8_combout\ & ((\tdl[6][3]~q\ & (\Add5~5\ & VCC)) # (!\tdl[6][3]~q\ & (!\Add5~5\)))) # (!\Add4~8_combout\ & ((\tdl[6][3]~q\ & (!\Add5~5\)) # (!\tdl[6][3]~q\ & ((\Add5~5\) # (GND)))))
-- \Add5~7\ = CARRY((\Add4~8_combout\ & (!\tdl[6][3]~q\ & !\Add5~5\)) # (!\Add4~8_combout\ & ((!\Add5~5\) # (!\tdl[6][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~8_combout\,
	datab => \tdl[6][3]~q\,
	datad => VCC,
	cin => \Add5~5\,
	combout => \Add5~6_combout\,
	cout => \Add5~7\);

-- Location: FF_X31_Y19_N13
\tdl[7][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][2]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][2]~q\);

-- Location: LCCOMB_X31_Y19_N12
\Add7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~4_combout\ = (\tdl[7][2]~q\ & (!\Add7~3\ & VCC)) # (!\tdl[7][2]~q\ & (\Add7~3\ $ (GND)))
-- \Add7~5\ = CARRY((!\tdl[7][2]~q\ & !\Add7~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[7][2]~q\,
	datad => VCC,
	cin => \Add7~3\,
	combout => \Add7~4_combout\,
	cout => \Add7~5\);

-- Location: LCCOMB_X30_Y19_N12
\y_out[9]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[9]~13_combout\ = ((\Add5~6_combout\ $ (\Add7~4_combout\ $ (!\y_out[8]~12\)))) # (GND)
-- \y_out[9]~14\ = CARRY((\Add5~6_combout\ & ((\Add7~4_combout\) # (!\y_out[8]~12\))) # (!\Add5~6_combout\ & (\Add7~4_combout\ & !\y_out[8]~12\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~6_combout\,
	datab => \Add7~4_combout\,
	datad => VCC,
	cin => \y_out[8]~12\,
	combout => \y_out[9]~13_combout\,
	cout => \y_out[9]~14\);

-- Location: FF_X30_Y19_N13
\y_out[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[9]~reg0_q\);

-- Location: FF_X28_Y19_N13
\tdl[5][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[4][5]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][5]~q\);

-- Location: FF_X24_Y19_N13
\tdl[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[3][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][6]~q\);

-- Location: LCCOMB_X22_Y19_N26
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = \tdl[2][7]~q\ $ (\Add1~15\ $ (!\Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[2][7]~q\,
	datad => \Add0~16_combout\,
	cin => \Add1~15\,
	combout => \Add1~16_combout\);

-- Location: LCCOMB_X23_Y19_N6
\tdl[3][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[3][7]~feeder_combout\ = \tdl[2][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[2][7]~q\,
	combout => \tdl[3][7]~feeder_combout\);

-- Location: FF_X23_Y19_N7
\tdl[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[3][7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[3][7]~q\);

-- Location: LCCOMB_X23_Y19_N24
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (\Add1~16_combout\ & ((\tdl[3][7]~q\ & (\Add2~13\ & VCC)) # (!\tdl[3][7]~q\ & (!\Add2~13\)))) # (!\Add1~16_combout\ & ((\tdl[3][7]~q\ & (!\Add2~13\)) # (!\tdl[3][7]~q\ & ((\Add2~13\) # (GND)))))
-- \Add2~15\ = CARRY((\Add1~16_combout\ & (!\tdl[3][7]~q\ & !\Add2~13\)) # (!\Add1~16_combout\ & ((!\Add2~13\) # (!\tdl[3][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~16_combout\,
	datab => \tdl[3][7]~q\,
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X24_Y19_N12
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = ((\tdl[4][6]~q\ $ (\Add2~14_combout\ $ (!\Add3~11\)))) # (GND)
-- \Add3~13\ = CARRY((\tdl[4][6]~q\ & ((\Add2~14_combout\) # (!\Add3~11\))) # (!\tdl[4][6]~q\ & (\Add2~14_combout\ & !\Add3~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[4][6]~q\,
	datab => \Add2~14_combout\,
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X28_Y19_N12
\Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = (\tdl[5][5]~q\ & ((\Add3~12_combout\ & (\Add4~9\ & VCC)) # (!\Add3~12_combout\ & (!\Add4~9\)))) # (!\tdl[5][5]~q\ & ((\Add3~12_combout\ & (!\Add4~9\)) # (!\Add3~12_combout\ & ((\Add4~9\) # (GND)))))
-- \Add4~11\ = CARRY((\tdl[5][5]~q\ & (!\Add3~12_combout\ & !\Add4~9\)) # (!\tdl[5][5]~q\ & ((!\Add4~9\) # (!\Add3~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[5][5]~q\,
	datab => \Add3~12_combout\,
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

-- Location: FF_X29_Y19_N11
\tdl[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[5][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][4]~q\);

-- Location: LCCOMB_X29_Y19_N10
\Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~8_combout\ = ((\Add4~10_combout\ $ (\tdl[6][4]~q\ $ (!\Add5~7\)))) # (GND)
-- \Add5~9\ = CARRY((\Add4~10_combout\ & ((\tdl[6][4]~q\) # (!\Add5~7\))) # (!\Add4~10_combout\ & (\tdl[6][4]~q\ & !\Add5~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~10_combout\,
	datab => \tdl[6][4]~q\,
	datad => VCC,
	cin => \Add5~7\,
	combout => \Add5~8_combout\,
	cout => \Add5~9\);

-- Location: FF_X31_Y19_N15
\tdl[7][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][3]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][3]~q\);

-- Location: LCCOMB_X31_Y19_N14
\Add7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~6_combout\ = (\tdl[7][3]~q\ & ((\Add7~5\) # (GND))) # (!\tdl[7][3]~q\ & (!\Add7~5\))
-- \Add7~7\ = CARRY((\tdl[7][3]~q\) # (!\Add7~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[7][3]~q\,
	datad => VCC,
	cin => \Add7~5\,
	combout => \Add7~6_combout\,
	cout => \Add7~7\);

-- Location: LCCOMB_X30_Y19_N14
\y_out[10]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[10]~15_combout\ = (\Add5~8_combout\ & ((\Add7~6_combout\ & (\y_out[9]~14\ & VCC)) # (!\Add7~6_combout\ & (!\y_out[9]~14\)))) # (!\Add5~8_combout\ & ((\Add7~6_combout\ & (!\y_out[9]~14\)) # (!\Add7~6_combout\ & ((\y_out[9]~14\) # (GND)))))
-- \y_out[10]~16\ = CARRY((\Add5~8_combout\ & (!\Add7~6_combout\ & !\y_out[9]~14\)) # (!\Add5~8_combout\ & ((!\y_out[9]~14\) # (!\Add7~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~8_combout\,
	datab => \Add7~6_combout\,
	datad => VCC,
	cin => \y_out[9]~14\,
	combout => \y_out[10]~15_combout\,
	cout => \y_out[10]~16\);

-- Location: FF_X30_Y19_N15
\y_out[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[10]~reg0_q\);

-- Location: LCCOMB_X23_Y19_N26
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = \Add1~16_combout\ $ (\Add2~15\ $ (!\tdl[3][7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~16_combout\,
	datad => \tdl[3][7]~q\,
	cin => \Add2~15\,
	combout => \Add2~16_combout\);

-- Location: LCCOMB_X24_Y19_N26
\tdl[4][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[4][7]~feeder_combout\ = \tdl[3][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[3][7]~q\,
	combout => \tdl[4][7]~feeder_combout\);

-- Location: FF_X24_Y19_N27
\tdl[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[4][7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[4][7]~q\);

-- Location: LCCOMB_X24_Y19_N14
\Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (\Add2~16_combout\ & ((\tdl[4][7]~q\ & (\Add3~13\ & VCC)) # (!\tdl[4][7]~q\ & (!\Add3~13\)))) # (!\Add2~16_combout\ & ((\tdl[4][7]~q\ & (!\Add3~13\)) # (!\tdl[4][7]~q\ & ((\Add3~13\) # (GND)))))
-- \Add3~15\ = CARRY((\Add2~16_combout\ & (!\tdl[4][7]~q\ & !\Add3~13\)) # (!\Add2~16_combout\ & ((!\Add3~13\) # (!\tdl[4][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~16_combout\,
	datab => \tdl[4][7]~q\,
	datad => VCC,
	cin => \Add3~13\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: FF_X28_Y19_N15
\tdl[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[4][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][6]~q\);

-- Location: LCCOMB_X28_Y19_N14
\Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = ((\Add3~14_combout\ $ (\tdl[5][6]~q\ $ (!\Add4~11\)))) # (GND)
-- \Add4~13\ = CARRY((\Add3~14_combout\ & ((\tdl[5][6]~q\) # (!\Add4~11\))) # (!\Add3~14_combout\ & (\tdl[5][6]~q\ & !\Add4~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~14_combout\,
	datab => \tdl[5][6]~q\,
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

-- Location: FF_X29_Y19_N13
\tdl[6][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[5][5]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][5]~q\);

-- Location: LCCOMB_X29_Y19_N12
\Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~10_combout\ = (\Add4~12_combout\ & ((\tdl[6][5]~q\ & (\Add5~9\ & VCC)) # (!\tdl[6][5]~q\ & (!\Add5~9\)))) # (!\Add4~12_combout\ & ((\tdl[6][5]~q\ & (!\Add5~9\)) # (!\tdl[6][5]~q\ & ((\Add5~9\) # (GND)))))
-- \Add5~11\ = CARRY((\Add4~12_combout\ & (!\tdl[6][5]~q\ & !\Add5~9\)) # (!\Add4~12_combout\ & ((!\Add5~9\) # (!\tdl[6][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~12_combout\,
	datab => \tdl[6][5]~q\,
	datad => VCC,
	cin => \Add5~9\,
	combout => \Add5~10_combout\,
	cout => \Add5~11\);

-- Location: FF_X31_Y19_N17
\tdl[7][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][4]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][4]~q\);

-- Location: LCCOMB_X31_Y19_N16
\Add7~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~8_combout\ = (\tdl[7][4]~q\ & (!\Add7~7\ & VCC)) # (!\tdl[7][4]~q\ & (\Add7~7\ $ (GND)))
-- \Add7~9\ = CARRY((!\tdl[7][4]~q\ & !\Add7~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[7][4]~q\,
	datad => VCC,
	cin => \Add7~7\,
	combout => \Add7~8_combout\,
	cout => \Add7~9\);

-- Location: LCCOMB_X30_Y19_N16
\y_out[11]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[11]~17_combout\ = ((\Add5~10_combout\ $ (\Add7~8_combout\ $ (!\y_out[10]~16\)))) # (GND)
-- \y_out[11]~18\ = CARRY((\Add5~10_combout\ & ((\Add7~8_combout\) # (!\y_out[10]~16\))) # (!\Add5~10_combout\ & (\Add7~8_combout\ & !\y_out[10]~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~10_combout\,
	datab => \Add7~8_combout\,
	datad => VCC,
	cin => \y_out[10]~16\,
	combout => \y_out[11]~17_combout\,
	cout => \y_out[11]~18\);

-- Location: FF_X30_Y19_N17
\y_out[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[11]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[11]~reg0_q\);

-- Location: LCCOMB_X28_Y19_N24
\tdl[5][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[5][7]~feeder_combout\ = \tdl[4][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[4][7]~q\,
	combout => \tdl[5][7]~feeder_combout\);

-- Location: FF_X28_Y19_N25
\tdl[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[5][7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[5][7]~q\);

-- Location: LCCOMB_X24_Y19_N16
\Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = \Add2~16_combout\ $ (\Add3~15\ $ (!\tdl[4][7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~16_combout\,
	datad => \tdl[4][7]~q\,
	cin => \Add3~15\,
	combout => \Add3~16_combout\);

-- Location: LCCOMB_X28_Y19_N16
\Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = (\tdl[5][7]~q\ & ((\Add3~16_combout\ & (\Add4~13\ & VCC)) # (!\Add3~16_combout\ & (!\Add4~13\)))) # (!\tdl[5][7]~q\ & ((\Add3~16_combout\ & (!\Add4~13\)) # (!\Add3~16_combout\ & ((\Add4~13\) # (GND)))))
-- \Add4~15\ = CARRY((\tdl[5][7]~q\ & (!\Add3~16_combout\ & !\Add4~13\)) # (!\tdl[5][7]~q\ & ((!\Add4~13\) # (!\Add3~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[5][7]~q\,
	datab => \Add3~16_combout\,
	datad => VCC,
	cin => \Add4~13\,
	combout => \Add4~14_combout\,
	cout => \Add4~15\);

-- Location: FF_X29_Y19_N15
\tdl[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[5][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][6]~q\);

-- Location: LCCOMB_X29_Y19_N14
\Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~12_combout\ = ((\Add4~14_combout\ $ (\tdl[6][6]~q\ $ (!\Add5~11\)))) # (GND)
-- \Add5~13\ = CARRY((\Add4~14_combout\ & ((\tdl[6][6]~q\) # (!\Add5~11\))) # (!\Add4~14_combout\ & (\tdl[6][6]~q\ & !\Add5~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~14_combout\,
	datab => \tdl[6][6]~q\,
	datad => VCC,
	cin => \Add5~11\,
	combout => \Add5~12_combout\,
	cout => \Add5~13\);

-- Location: FF_X31_Y19_N19
\tdl[7][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][5]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][5]~q\);

-- Location: LCCOMB_X31_Y19_N18
\Add7~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~10_combout\ = (\tdl[7][5]~q\ & ((\Add7~9\) # (GND))) # (!\tdl[7][5]~q\ & (!\Add7~9\))
-- \Add7~11\ = CARRY((\tdl[7][5]~q\) # (!\Add7~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[7][5]~q\,
	datad => VCC,
	cin => \Add7~9\,
	combout => \Add7~10_combout\,
	cout => \Add7~11\);

-- Location: LCCOMB_X30_Y19_N18
\y_out[12]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[12]~19_combout\ = (\Add5~12_combout\ & ((\Add7~10_combout\ & (\y_out[11]~18\ & VCC)) # (!\Add7~10_combout\ & (!\y_out[11]~18\)))) # (!\Add5~12_combout\ & ((\Add7~10_combout\ & (!\y_out[11]~18\)) # (!\Add7~10_combout\ & ((\y_out[11]~18\) # (GND)))))
-- \y_out[12]~20\ = CARRY((\Add5~12_combout\ & (!\Add7~10_combout\ & !\y_out[11]~18\)) # (!\Add5~12_combout\ & ((!\y_out[11]~18\) # (!\Add7~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~12_combout\,
	datab => \Add7~10_combout\,
	datad => VCC,
	cin => \y_out[11]~18\,
	combout => \y_out[12]~19_combout\,
	cout => \y_out[12]~20\);

-- Location: FF_X30_Y19_N19
\y_out[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[12]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[12]~reg0_q\);

-- Location: LCCOMB_X29_Y19_N24
\tdl[6][7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \tdl[6][7]~feeder_combout\ = \tdl[5][7]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tdl[5][7]~q\,
	combout => \tdl[6][7]~feeder_combout\);

-- Location: FF_X29_Y19_N25
\tdl[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tdl[6][7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[6][7]~q\);

-- Location: LCCOMB_X28_Y19_N18
\Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~16_combout\ = \tdl[5][7]~q\ $ (\Add4~15\ $ (!\Add3~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[5][7]~q\,
	datad => \Add3~16_combout\,
	cin => \Add4~15\,
	combout => \Add4~16_combout\);

-- Location: LCCOMB_X29_Y19_N16
\Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~14_combout\ = (\tdl[6][7]~q\ & ((\Add4~16_combout\ & (\Add5~13\ & VCC)) # (!\Add4~16_combout\ & (!\Add5~13\)))) # (!\tdl[6][7]~q\ & ((\Add4~16_combout\ & (!\Add5~13\)) # (!\Add4~16_combout\ & ((\Add5~13\) # (GND)))))
-- \Add5~15\ = CARRY((\tdl[6][7]~q\ & (!\Add4~16_combout\ & !\Add5~13\)) # (!\tdl[6][7]~q\ & ((!\Add5~13\) # (!\Add4~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[6][7]~q\,
	datab => \Add4~16_combout\,
	datad => VCC,
	cin => \Add5~13\,
	combout => \Add5~14_combout\,
	cout => \Add5~15\);

-- Location: FF_X31_Y19_N21
\tdl[7][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][6]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][6]~q\);

-- Location: LCCOMB_X31_Y19_N20
\Add7~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~12_combout\ = (\tdl[7][6]~q\ & (!\Add7~11\ & VCC)) # (!\tdl[7][6]~q\ & (\Add7~11\ $ (GND)))
-- \Add7~13\ = CARRY((!\tdl[7][6]~q\ & !\Add7~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[7][6]~q\,
	datad => VCC,
	cin => \Add7~11\,
	combout => \Add7~12_combout\,
	cout => \Add7~13\);

-- Location: LCCOMB_X30_Y19_N20
\y_out[13]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[13]~21_combout\ = ((\Add5~14_combout\ $ (\Add7~12_combout\ $ (!\y_out[12]~20\)))) # (GND)
-- \y_out[13]~22\ = CARRY((\Add5~14_combout\ & ((\Add7~12_combout\) # (!\y_out[12]~20\))) # (!\Add5~14_combout\ & (\Add7~12_combout\ & !\y_out[12]~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~14_combout\,
	datab => \Add7~12_combout\,
	datad => VCC,
	cin => \y_out[12]~20\,
	combout => \y_out[13]~21_combout\,
	cout => \y_out[13]~22\);

-- Location: FF_X30_Y19_N21
\y_out[13]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[13]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[13]~reg0_q\);

-- Location: FF_X31_Y19_N23
\tdl[7][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tdl[6][7]~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tdl[7][7]~q\);

-- Location: LCCOMB_X31_Y19_N22
\Add7~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~14_combout\ = (\tdl[7][7]~q\ & ((\Add7~13\) # (GND))) # (!\tdl[7][7]~q\ & (!\Add7~13\))
-- \Add7~15\ = CARRY((\tdl[7][7]~q\) # (!\Add7~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[7][7]~q\,
	datad => VCC,
	cin => \Add7~13\,
	combout => \Add7~14_combout\,
	cout => \Add7~15\);

-- Location: LCCOMB_X29_Y19_N18
\Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~16_combout\ = \tdl[6][7]~q\ $ (\Add5~15\ $ (!\Add4~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tdl[6][7]~q\,
	datad => \Add4~16_combout\,
	cin => \Add5~15\,
	combout => \Add5~16_combout\);

-- Location: LCCOMB_X30_Y19_N22
\y_out[14]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[14]~23_combout\ = (\Add7~14_combout\ & ((\Add5~16_combout\ & (\y_out[13]~22\ & VCC)) # (!\Add5~16_combout\ & (!\y_out[13]~22\)))) # (!\Add7~14_combout\ & ((\Add5~16_combout\ & (!\y_out[13]~22\)) # (!\Add5~16_combout\ & ((\y_out[13]~22\) # (GND)))))
-- \y_out[14]~24\ = CARRY((\Add7~14_combout\ & (!\Add5~16_combout\ & !\y_out[13]~22\)) # (!\Add7~14_combout\ & ((!\y_out[13]~22\) # (!\Add5~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~14_combout\,
	datab => \Add5~16_combout\,
	datad => VCC,
	cin => \y_out[13]~22\,
	combout => \y_out[14]~23_combout\,
	cout => \y_out[14]~24\);

-- Location: FF_X30_Y19_N23
\y_out[14]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[14]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[14]~reg0_q\);

-- Location: LCCOMB_X31_Y19_N24
\Add7~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~16_combout\ = \tdl[7][7]~q\ $ (\Add7~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tdl[7][7]~q\,
	cin => \Add7~15\,
	combout => \Add7~16_combout\);

-- Location: LCCOMB_X30_Y19_N24
\y_out[15]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \y_out[15]~25_combout\ = \Add7~16_combout\ $ (\y_out[14]~24\ $ (!\Add5~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add7~16_combout\,
	datad => \Add5~16_combout\,
	cin => \y_out[14]~24\,
	combout => \y_out[15]~25_combout\);

-- Location: FF_X30_Y19_N25
\y_out[15]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \y_out[15]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_out[15]~reg0_q\);

ww_y_out(0) <= \y_out[0]~output_o\;

ww_y_out(1) <= \y_out[1]~output_o\;

ww_y_out(2) <= \y_out[2]~output_o\;

ww_y_out(3) <= \y_out[3]~output_o\;

ww_y_out(4) <= \y_out[4]~output_o\;

ww_y_out(5) <= \y_out[5]~output_o\;

ww_y_out(6) <= \y_out[6]~output_o\;

ww_y_out(7) <= \y_out[7]~output_o\;

ww_y_out(8) <= \y_out[8]~output_o\;

ww_y_out(9) <= \y_out[9]~output_o\;

ww_y_out(10) <= \y_out[10]~output_o\;

ww_y_out(11) <= \y_out[11]~output_o\;

ww_y_out(12) <= \y_out[12]~output_o\;

ww_y_out(13) <= \y_out[13]~output_o\;

ww_y_out(14) <= \y_out[14]~output_o\;

ww_y_out(15) <= \y_out[15]~output_o\;
END structure;


