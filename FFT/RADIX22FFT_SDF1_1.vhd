-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Tood\OneDrive - UTS\Uni\2021 Spring\Embedded Studio A\HDL CODER MATLAB\HDL Output with testbench\FFT_DUT\RADIX22FFT_SDF1_1.vhd
-- Created: 2021-10-10 15:49:27
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDF1_1
-- Source Path: FFT_DUT/HDL_DUT/FFT HDL Optimized/RADIX22FFT_SDF1_1
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDF1_1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_1_1_re_dly                    :   IN    signed(15 DOWNTO 0);  -- sfix16
        din_1_1_im_dly                    :   IN    signed(15 DOWNTO 0);  -- sfix16
        din_1_vld_dly                     :   IN    std_logic;
        rd_1_Addr                         :   IN    unsigned(1 DOWNTO 0);  -- ufix2
        rd_1_Enb                          :   IN    std_logic;
        proc_1_enb                        :   IN    std_logic;
        dout_1_1_re                       :   OUT   signed(16 DOWNTO 0);  -- sfix17
        dout_1_1_im                       :   OUT   signed(16 DOWNTO 0);  -- sfix17
        dout_1_1_vld                      :   OUT   std_logic;
        dinXTwdl_1_1_vld                  :   OUT   std_logic
        );
END RADIX22FFT_SDF1_1;


ARCHITECTURE rtl OF RADIX22FFT_SDF1_1 IS

  -- Component Declarations
  COMPONENT SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    signed(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    unsigned(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    unsigned(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   signed(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT SDFCommutator1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          din_1_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    signed(16 DOWNTO 0);  -- sfix17
          xf_im                           :   IN    signed(16 DOWNTO 0);  -- sfix17
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    signed(16 DOWNTO 0);  -- sfix17
          dinXTwdlf_im                    :   IN    signed(16 DOWNTO 0);  -- sfix17
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    signed(16 DOWNTO 0);  -- sfix17
          btf1_im                         :   IN    signed(16 DOWNTO 0);  -- sfix17
          btf2_re                         :   IN    signed(16 DOWNTO 0);  -- sfix17
          btf2_im                         :   IN    signed(16 DOWNTO 0);  -- sfix17
          btf_vld                         :   IN    std_logic;
          wrData_re                       :   OUT   signed(16 DOWNTO 0);  -- sfix17
          wrData_im                       :   OUT   signed(16 DOWNTO 0);  -- sfix17
          wrAddr                          :   OUT   unsigned(1 DOWNTO 0);  -- ufix2
          wrEnb                           :   OUT   std_logic;
          dout_1_1_re                     :   OUT   signed(16 DOWNTO 0);  -- sfix17
          dout_1_1_im                     :   OUT   signed(16 DOWNTO 0);  -- sfix17
          dout_1_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SimpleDualPortRAM_generic
    USE ENTITY work.SimpleDualPortRAM_generic(rtl);

  FOR ALL : SDFCommutator1
    USE ENTITY work.SDFCommutator1(rtl);

  -- Signals
  SIGNAL din_re                           : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL dinXTwdl_re                      : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL din_im                           : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL dinXTwdl_im                      : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL dinXTwdl_1_1_vld_1               : std_logic;
  SIGNAL x_vld                            : std_logic;
  SIGNAL wrData_im                        : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL wrAddr                           : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL wrEnb                            : std_logic;
  SIGNAL x_im                             : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL wrData_re                        : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL x_re                             : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL xf_re                            : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL xf_im                            : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinXTwdlf_re                     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL dinXTwdlf_im                     : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf1_re                          : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL btf1_im                          : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL btf2_re                          : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL btf2_im                          : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL btf_vld                          : std_logic;

BEGIN
  u_dataMEM_im_0_1 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 2,
                 DataWidth => 17
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => wrData_im,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_1_Addr,
              rd_dout => x_im
              );

  u_dataMEM_re_0_1_generic : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 2,
                 DataWidth => 17
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => wrData_re,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_1_Addr,
              rd_dout => x_re
              );

  u_SDFCOMMUTATOR_1 : SDFCommutator1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              din_1_vld_dly => din_1_vld_dly,
              xf_re => xf_re,  -- sfix17
              xf_im => xf_im,  -- sfix17
              xf_vld => xf_vld,
              dinXTwdlf_re => dinXTwdlf_re,  -- sfix17
              dinXTwdlf_im => dinXTwdlf_im,  -- sfix17
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => btf1_re,  -- sfix17
              btf1_im => btf1_im,  -- sfix17
              btf2_re => btf2_re,  -- sfix17
              btf2_im => btf2_im,  -- sfix17
              btf_vld => btf_vld,
              wrData_re => wrData_re,  -- sfix17
              wrData_im => wrData_im,  -- sfix17
              wrAddr => wrAddr,  -- ufix2
              wrEnb => wrEnb,
              dout_1_1_re => dout_1_1_re,  -- sfix17
              dout_1_1_im => dout_1_1_im,  -- sfix17
              dout_1_1_vld => dout_1_1_vld
              );

  din_re <= resize(din_1_1_re_dly, 17);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinXTwdl_re <= to_signed(16#00000#, 17);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dinXTwdl_re <= din_re;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  din_im <= resize(din_1_1_im_dly, 17);

  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinXTwdl_im <= to_signed(16#00000#, 17);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dinXTwdl_im <= din_im;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dinXTwdl_1_1_vld_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dinXTwdl_1_1_vld_1 <= din_1_vld_dly;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_vld <= rd_1_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(16#00000#, 18);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(16#00000#, 18);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(16#00000#, 18);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(16#00000#, 18);
      Radix22ButterflyG1_x_re_dly1 <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_x_im_dly1 <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_x_vld_dly1 <= '0';
      xf_re <= to_signed(16#00000#, 17);
      xf_im <= to_signed(16#00000#, 17);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
      Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
      btf_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        xf_re <= Radix22ButterflyG1_x_re_dly1;
        xf_im <= Radix22ButterflyG1_x_im_dly1;
        xf_vld <= Radix22ButterflyG1_x_vld_dly1;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_btf1_re_reg <= resize(Radix22ButterflyG1_x_re_dly1, 18) + resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 18);
        Radix22ButterflyG1_btf2_re_reg <= resize(Radix22ButterflyG1_x_re_dly1, 18) - resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 18);
        Radix22ButterflyG1_btf1_im_reg <= resize(Radix22ButterflyG1_x_im_dly1, 18) + resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 18);
        Radix22ButterflyG1_btf2_im_reg <= resize(Radix22ButterflyG1_x_im_dly1, 18) - resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 18);
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im;
        Radix22ButterflyG1_x_re_dly1 <= x_re;
        Radix22ButterflyG1_x_im_dly1 <= x_im;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_1_enb AND dinXTwdl_1_1_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_1_enb) AND dinXTwdl_1_1_vld_1;
  dinXTwdlf_re <= dinXTwdl_re;
  dinXTwdlf_im <= dinXTwdl_im;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(16 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(16 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(16 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(16 DOWNTO 0);

  dinXTwdl_1_1_vld <= dinXTwdl_1_1_vld_1;

END rtl;
