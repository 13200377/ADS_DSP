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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "07/29/2021 21:25:44"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ADS_project
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ADS_project_vhd_vec_tst IS
END ADS_project_vhd_vec_tst;
ARCHITECTURE ADS_project_arch OF ADS_project_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cs : STD_LOGIC;
SIGNAL miso : STD_LOGIC;
SIGNAL mosi : STD_LOGIC;
SIGNAL sck : STD_LOGIC;
SIGNAL seg_select : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL segments : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT ADS_project
	PORT (
	clk : IN STD_LOGIC;
	cs : IN STD_LOGIC;
	miso : OUT STD_LOGIC;
	mosi : IN STD_LOGIC;
	sck : IN STD_LOGIC;
	seg_select : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ADS_project
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cs => cs,
	miso => miso,
	mosi => mosi,
	sck => sck,
	seg_select => seg_select,
	segments => segments
	);
END ADS_project_arch;
