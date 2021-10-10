-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Tood\OneDrive - UTS\Uni\2021 Spring\Embedded Studio A\HDL CODER MATLAB\HDL Output with testbench\FFT_DUT\RADIX22FFT_SDF1_3.vhd
-- Created: 2021-10-10 15:49:27
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDF1_3
-- Source Path: FFT_DUT/HDL_DUT/FFT HDL Optimized/RADIX22FFT_SDF1_3
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDF1_3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_3_re_dly                      :   IN    signed(17 DOWNTO 0);  -- sfix18
        din_3_im_dly                      :   IN    signed(17 DOWNTO 0);  -- sfix18
        din_3_vld_dly                     :   IN    std_logic;
        rd_3_Addr                         :   IN    std_logic;
        rd_3_Enb_dly                      :   IN    std_logic;
        twdl_3_re                         :   IN    signed(15 DOWNTO 0);  -- sfix16_En14
        twdl_3_im                         :   IN    signed(15 DOWNTO 0);  -- sfix16_En14
        proc_3_enb                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_3_re                         :   OUT   signed(18 DOWNTO 0);  -- sfix19
        dout_3_im                         :   OUT   signed(18 DOWNTO 0);  -- sfix19
        dout_3_vld                        :   OUT   std_logic;
        dinXTwdl_3_vld                    :   OUT   std_logic
        );
END RADIX22FFT_SDF1_3;


ARCHITECTURE rtl OF RADIX22FFT_SDF1_3 IS

  -- Component Declarations
  COMPONENT Complex3Multiply
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_re                          :   IN    signed(18 DOWNTO 0);  -- sfix19
          din_im                          :   IN    signed(18 DOWNTO 0);  -- sfix19
          din_3_vld_dly                   :   IN    std_logic;
          twdl_3_re                       :   IN    signed(15 DOWNTO 0);  -- sfix16_En14
          twdl_3_im                       :   IN    signed(15 DOWNTO 0);  -- sfix16_En14
          softReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   signed(18 DOWNTO 0);  -- sfix19
          dinXTwdl_im                     :   OUT   signed(18 DOWNTO 0);  -- sfix19
          dinXTwdl_3_vld                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SDFCommutator3
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_3_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    signed(18 DOWNTO 0);  -- sfix19
          xf_im                           :   IN    signed(18 DOWNTO 0);  -- sfix19
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    signed(18 DOWNTO 0);  -- sfix19
          dinXTwdlf_im                    :   IN    signed(18 DOWNTO 0);  -- sfix19
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    signed(18 DOWNTO 0);  -- sfix19
          btf1_im                         :   IN    signed(18 DOWNTO 0);  -- sfix19
          btf2_re                         :   IN    signed(18 DOWNTO 0);  -- sfix19
          btf2_im                         :   IN    signed(18 DOWNTO 0);  -- sfix19
          btf_vld                         :   IN    std_logic;
          wrData_re                       :   OUT   signed(18 DOWNTO 0);  -- sfix19
          wrData_im                       :   OUT   signed(18 DOWNTO 0);  -- sfix19
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_3_re                       :   OUT   signed(18 DOWNTO 0);  -- sfix19
          dout_3_im                       :   OUT   signed(18 DOWNTO 0);  -- sfix19
          dout_3_vld                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Complex3Multiply
    USE ENTITY work.Complex3Multiply(rtl);

  FOR ALL : SDFCommutator3
    USE ENTITY work.SDFCommutator3(rtl);

  -- Signals
  SIGNAL din_re                           : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL din_im                           : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL dinXTwdl_re                      : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL dinXTwdl_im                      : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL dinXTwdl_3_vld_1                 : std_logic;
  SIGNAL x_vld                            : std_logic;
  SIGNAL wrData_re                        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL wrData_im                        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL x_re                             : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL x_im                             : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(19 DOWNTO 0);  -- sfix20
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(19 DOWNTO 0);  -- sfix20
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(19 DOWNTO 0);  -- sfix20
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(19 DOWNTO 0);  -- sfix20
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL xf_re                            : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL xf_im                            : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinXTwdlf_re                     : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL dinXTwdlf_im                     : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf1_re                          : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL btf1_im                          : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL btf2_re                          : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL btf2_im                          : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL btf_vld                          : std_logic;

BEGIN
  u_MUL3 : Complex3Multiply
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              din_re => din_re,  -- sfix19
              din_im => din_im,  -- sfix19
              din_3_vld_dly => din_3_vld_dly,
              twdl_3_re => twdl_3_re,  -- sfix16_En14
              twdl_3_im => twdl_3_im,  -- sfix16_En14
              softReset => softReset,
              dinXTwdl_re => dinXTwdl_re,  -- sfix19
              dinXTwdl_im => dinXTwdl_im,  -- sfix19
              dinXTwdl_3_vld => dinXTwdl_3_vld_1
              );

  u_SDFCOMMUTATOR_3 : SDFCommutator3
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              din_3_vld_dly => din_3_vld_dly,
              xf_re => xf_re,  -- sfix19
              xf_im => xf_im,  -- sfix19
              xf_vld => xf_vld,
              dinXTwdlf_re => dinXTwdlf_re,  -- sfix19
              dinXTwdlf_im => dinXTwdlf_im,  -- sfix19
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => btf1_re,  -- sfix19
              btf1_im => btf1_im,  -- sfix19
              btf2_re => btf2_re,  -- sfix19
              btf2_im => btf2_im,  -- sfix19
              btf_vld => btf_vld,
              wrData_re => wrData_re,  -- sfix19
              wrData_im => wrData_im,  -- sfix19
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_3_re => dout_3_re,  -- sfix19
              dout_3_im => dout_3_im,  -- sfix19
              dout_3_vld => dout_3_vld
              );

  din_re <= resize(din_3_re_dly, 19);

  din_im <= resize(din_3_im_dly, 19);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_vld <= rd_3_Enb_dly;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twoLocationReg_0_MEM_re_0 <= to_signed(16#00000#, 19);
      twoLocationReg_0_MEM_im_0 <= to_signed(16#00000#, 19);
      twoLocationReg_0_MEM_re_1 <= to_signed(16#00000#, 19);
      twoLocationReg_0_MEM_im_1 <= to_signed(16#00000#, 19);
      twoLocationReg_0_dout_re_reg <= to_signed(16#00000#, 19);
      twoLocationReg_0_dout_im_reg <= to_signed(16#00000#, 19);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
        twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
        twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
        twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
        twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
        twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
      END IF;
    END IF;
  END PROCESS twoLocationReg_0_process;

  twoLocationReg_0_output : PROCESS (rd_3_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im, wrData_re, wrEnb)
  BEGIN
    twoLocationReg_0_MEM_re_0_next <= twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next <= twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next <= twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next <= twoLocationReg_0_MEM_im_1;
    twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_dout_re_reg;
    twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_dout_im_reg;
    IF rd_3_Addr = '1' THEN 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_1;
    ELSE 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_0;
    END IF;
    IF wrEnb = '1' THEN 
      IF wrAddr = '1' THEN 
        twoLocationReg_0_MEM_re_1_next <= wrData_re;
        twoLocationReg_0_MEM_im_1_next <= wrData_im;
      ELSE 
        twoLocationReg_0_MEM_re_0_next <= wrData_re;
        twoLocationReg_0_MEM_im_0_next <= wrData_im;
      END IF;
    END IF;
    x_re <= twoLocationReg_0_dout_re_reg;
    x_im <= twoLocationReg_0_dout_im_reg;
  END PROCESS twoLocationReg_0_output;


  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(16#00000#, 20);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(16#00000#, 20);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(16#00000#, 20);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(16#00000#, 20);
      xf_re <= to_signed(16#00000#, 19);
      xf_im <= to_signed(16#00000#, 19);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#00000#, 19);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#00000#, 19);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#00000#, 19);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#00000#, 19);
      Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
      Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
      btf_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_btf1_re_reg <= resize(x_re, 20) + resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 20);
        Radix22ButterflyG1_btf2_re_reg <= resize(x_re, 20) - resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 20);
        Radix22ButterflyG1_btf1_im_reg <= resize(x_im, 20) + resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 20);
        Radix22ButterflyG1_btf2_im_reg <= resize(x_im, 20) - resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 20);
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im;
        xf_re <= x_re;
        xf_im <= x_im;
        xf_vld <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_3_enb AND dinXTwdl_3_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_3_enb) AND dinXTwdl_3_vld_1;
  dinXTwdlf_re <= dinXTwdl_re;
  dinXTwdlf_im <= dinXTwdl_im;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(18 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(18 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(18 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(18 DOWNTO 0);

  dinXTwdl_3_vld <= dinXTwdl_3_vld_1;

END rtl;

