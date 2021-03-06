-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Tood\OneDrive - UTS\Uni\2021 Spring\Embedded Studio A\HDL CODER MATLAB\HDL Output with testbench\FFT_DUT\SimpleDualPortRAM_generic.vhd
-- Created: 2021-10-10 15:49:27
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SimpleDualPortRAM_generic
-- Source Path: FFT_DUT/HDL_DUT/FFT HDL Optimized/RADIX22FFT_SDF1_1/SimpleDualPortRAM_generic
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SimpleDualPortRAM_generic IS
  GENERIC( AddrWidth                      : integer := 1;
           DataWidth                      : integer := 1
           );
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        wr_din                            :   IN    signed(DataWidth - 1 DOWNTO 0);  -- generic width
        wr_addr                           :   IN    unsigned(AddrWidth - 1 DOWNTO 0);  -- generic width
        wr_en                             :   IN    std_logic;  -- ufix1
        rd_addr                           :   IN    unsigned(AddrWidth - 1 DOWNTO 0);  -- generic width
        rd_dout                           :   OUT   signed(DataWidth - 1 DOWNTO 0)  -- generic width
        );
END SimpleDualPortRAM_generic;


ARCHITECTURE rtl OF SimpleDualPortRAM_generic IS

  -- Local Type Definitions
  TYPE ram_type IS ARRAY (2**AddrWidth - 1 DOWNTO 0) of std_logic_vector(DataWidth - 1 DOWNTO 0);

  -- Signals
  SIGNAL ram                              : ram_type := (OTHERS => (OTHERS => '0'));
  SIGNAL data_int                         : std_logic_vector(DataWidth - 1 DOWNTO 0) := (OTHERS => '0');

BEGIN
  SimpleDualPortRAM_generic_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        IF wr_en = '1' THEN
          ram(to_integer(wr_addr)) <= std_logic_vector(wr_din);
        END IF;
        data_int <= ram(to_integer(rd_addr));
      END IF;
    END IF;
  END PROCESS SimpleDualPortRAM_generic_process;

  rd_dout <= signed(data_int);

END rtl;

