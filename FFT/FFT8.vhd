-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Tood\OneDrive - UTS\Uni\2021 Spring\Embedded Studio A\HDL CODER MATLAB\HDL Output with testbench\FFT_DUT\HDL_DUT.vhd
-- Created: 2021-10-10 15:49:27
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1
-- Target subsystem base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- fftOut_re                     ce_out        1
-- fftOut_im                     ce_out        1
-- fftValidOut                   ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: FFT8
-- Source Path: FFT_DUT/FFT8
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FFT8 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        fftIn_re                          :   IN    signed(15 DOWNTO 0);  -- int16
        fftIn_im                          :   IN    signed(15 DOWNTO 0);  -- int16
        fftValidIn                        :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        fftOut_re                         :   OUT   signed(18 DOWNTO 0);  -- sfix19
        fftOut_im                         :   OUT   signed(18 DOWNTO 0);  -- sfix19
        fftValidOut                       :   OUT   std_logic
        );
END FFT8;


ARCHITECTURE rtl OF FFT8 IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT FFT_HDL_Optimized
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    signed(15 DOWNTO 0);  -- int16
          dataIn_im                       :   IN    signed(15 DOWNTO 0);  -- int16
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   signed(18 DOWNTO 0);  -- sfix19
          dataOut_im                      :   OUT   signed(18 DOWNTO 0);  -- sfix19
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : FFT_HDL_Optimized
    USE ENTITY work.FFT_HDL_Optimized(rtl);

BEGIN
  u_FFT_HDL_Optimized : FFT_HDL_Optimized
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              dataIn_re => fftIn_re,  -- int16
              dataIn_im => fftIn_im,  -- int16
              validIn => fftValidIn,
              dataOut_re => fftOut_re,  -- sfix19
              dataOut_im => fftOut_im,  -- sfix19
              validOut => fftValidOut
              );

  ce_out <= clk_enable;

END rtl;

