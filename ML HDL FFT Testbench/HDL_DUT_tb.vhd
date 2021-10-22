-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\Tood\OneDrive - UTS\Uni\2021 Spring\Embedded Studio A\HDL CODER MATLAB\HDL Output with testbench\FFT_DUT\HDL_DUT_tb.vhd
-- Created: 2021-10-10 15:49:35
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
-- Module: HDL_DUT_tb
-- Source Path: 
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_textio.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY STD;
USE STD.textio.ALL;
LIBRARY work;
USE work.HDL_DUT_pkg.ALL;
USE work.HDL_DUT_tb_pkg.ALL;

ENTITY HDL_DUT_tb IS
END HDL_DUT_tb;


ARCHITECTURE rtl OF HDL_DUT_tb IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT HDL_DUT
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          fftIn_re                        :   IN    signed(15 DOWNTO 0);  -- int16
          fftIn_im                        :   IN    signed(15 DOWNTO 0);  -- int16
          fftValidIn                      :   IN    std_logic;
          ce_out                          :   OUT   std_logic;
          fftOut_re                       :   OUT   signed(18 DOWNTO 0);  -- sfix19
          fftOut_im                       :   OUT   signed(18 DOWNTO 0);  -- sfix19
          fftValidOut                     :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : HDL_DUT
    USE ENTITY work.HDL_DUT(rtl);

  -- Signals
  SIGNAL clk                              : std_logic;
  SIGNAL reset                            : std_logic;
  SIGNAL clk_enable                       : std_logic;
  SIGNAL fftValidOut_done                 : std_logic;  -- ufix1
  SIGNAL rdEnb                            : std_logic;
  SIGNAL fftValidOut_done_enb             : std_logic;  -- ufix1
  SIGNAL fftOut_re_addr                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL fftValidOut_lastAddr             : std_logic;  -- ufix1
  SIGNAL resetn                           : std_logic;
  SIGNAL check2_done                      : std_logic;  -- ufix1
  SIGNAL fftOut_re_done                   : std_logic;  -- ufix1
  SIGNAL fftOut_re_done_enb               : std_logic;  -- ufix1
  SIGNAL fftOut_re_active                 : std_logic;  -- ufix1
  SIGNAL rawData_fftValidIn               : std_logic;
  SIGNAL holdData_fftValidIn              : std_logic;
  SIGNAL tb_enb_delay                     : std_logic;
  SIGNAL fftValidIn_offset                : std_logic;
  SIGNAL fftValidIn                       : std_logic;
  SIGNAL Signal_From_Workspace_out1_addr_delay : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL fftIn_imraw                      : signed(15 DOWNTO 0);  -- int16
  SIGNAL rawData_fftIn_im                 : signed(15 DOWNTO 0);  -- int16
  SIGNAL holdData_fftIn_im                : signed(15 DOWNTO 0);  -- int16
  SIGNAL fftIn_im_offset                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL fftIn_im                         : signed(15 DOWNTO 0);  -- int16
  SIGNAL Signal_From_Workspace_out1_addr  : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Signal_From_Workspace_out1_active : std_logic;  -- ufix1
  SIGNAL Signal_From_Workspace_out1_enb   : std_logic;  -- ufix1
  SIGNAL fftIn_reraw                      : signed(15 DOWNTO 0);  -- int16
  SIGNAL rawData_fftIn_re                 : signed(15 DOWNTO 0);  -- int16
  SIGNAL holdData_fftIn_re                : signed(15 DOWNTO 0);  -- int16
  SIGNAL fftIn_re_offset                  : signed(15 DOWNTO 0);  -- int16
  SIGNAL fftIn_re                         : signed(15 DOWNTO 0);  -- int16
  SIGNAL snkDone                          : std_logic;
  SIGNAL snkDonen                         : std_logic;
  SIGNAL tb_enb                           : std_logic;
  SIGNAL ce_out                           : std_logic;
  SIGNAL fftOut_re                        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL fftOut_im                        : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL fftValidOut                      : std_logic;
  SIGNAL fftOut_re_enb                    : std_logic;  -- ufix1
  SIGNAL fftOut_re_lastAddr               : std_logic;  -- ufix1
  SIGNAL check1_done                      : std_logic;  -- ufix1
  SIGNAL fftOut_re_addr_delay_1           : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL fftOut_re_expected               : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL fftOut_re_ref                    : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL fftOut_re_testFailure            : std_logic;  -- ufix1
  SIGNAL fftOut_im_expected               : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL fftOut_im_ref                    : signed(18 DOWNTO 0);  -- sfix19
  SIGNAL fftOut_im_testFailure            : std_logic;  -- ufix1
  SIGNAL fftValidOut_addr_delay_1         : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL fftValidOut_expected             : std_logic;
  SIGNAL fftValidOut_ref                  : std_logic;
  SIGNAL fftValidOut_testFailure          : std_logic;  -- ufix1
  SIGNAL testFailure                      : std_logic;  -- ufix1

BEGIN
  u_HDL_DUT : HDL_DUT
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              fftIn_re => fftIn_re,  -- int16
              fftIn_im => fftIn_im,  -- int16
              fftValidIn => fftValidIn,
              ce_out => ce_out,
              fftOut_re => fftOut_re,  -- sfix19
              fftOut_im => fftOut_im,  -- sfix19
              fftValidOut => fftValidOut
              );

  fftValidOut_done_enb <= fftValidOut_done AND rdEnb;

  
  fftValidOut_lastAddr <= '1' WHEN fftOut_re_addr >= to_unsigned(16#36#, 6) ELSE
      '0';

  fftValidOut_done <= fftValidOut_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_2_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check2_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF fftValidOut_done_enb = '1' THEN
        check2_done <= fftValidOut_done;
      END IF;
    END IF;
  END PROCESS checkDone_2_process;

  fftOut_re_done_enb <= fftOut_re_done AND rdEnb;

  
  fftOut_re_active <= '1' WHEN fftOut_re_addr /= to_unsigned(16#36#, 6) ELSE
      '0';

  -- Data source for fftValidIn
  
  rawData_fftValidIn <= '0' WHEN rdEnb = '0' ELSE
      '1';

  -- holdData reg for Constant1_out1
  stimuli_Constant1_out1_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      holdData_fftValidIn <= '0';
    ELSIF clk'event AND clk = '1' THEN
      holdData_fftValidIn <= rawData_fftValidIn;
    END IF;
  END PROCESS stimuli_Constant1_out1_process;

  stimuli_Constant1_out1_1: PROCESS (rawData_fftValidIn, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      fftValidIn_offset <= '0';
    ELSIF rdEnb = '0' THEN
      fftValidIn_offset <= holdData_fftValidIn;
    ELSE
      fftValidIn_offset <= rawData_fftValidIn;
    END IF;
  END PROCESS stimuli_Constant1_out1_1;

  fftValidIn <= fftValidIn_offset AFTER 2 ns;

  -- Data source for fftIn_im
  fftIn_im_fileread: PROCESS (Signal_From_Workspace_out1_addr_delay, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "fftIn_im.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := (OTHERS => '0');
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    fftIn_imraw <= signed(read_data(15 DOWNTO 0));
  END PROCESS fftIn_im_fileread;

  
  rawData_fftIn_im <= to_signed(16#0000#, 16) WHEN rdEnb = '0' ELSE
      fftIn_imraw;

  -- holdData reg for Signal_From_Workspace_out1
  stimuli_Signal_From_Workspace_out1_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      holdData_fftIn_im <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      holdData_fftIn_im <= rawData_fftIn_im;
    END IF;
  END PROCESS stimuli_Signal_From_Workspace_out1_process;

  stimuli_Signal_From_Workspace_out1_1: PROCESS (rawData_fftIn_im, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      fftIn_im_offset <= (OTHERS => '0');
    ELSIF rdEnb = '0' THEN
      fftIn_im_offset <= holdData_fftIn_im;
    ELSE
      fftIn_im_offset <= rawData_fftIn_im;
    END IF;
  END PROCESS stimuli_Signal_From_Workspace_out1_1;

  fftIn_im <= fftIn_im_offset AFTER 2 ns;

  
  Signal_From_Workspace_out1_active <= '1' WHEN Signal_From_Workspace_out1_addr /= to_unsigned(16#36#, 6) ELSE
      '0';

  Signal_From_Workspace_out1_enb <= Signal_From_Workspace_out1_active AND (rdEnb AND tb_enb_delay);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 54
  SignalFromWorkspace_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Signal_From_Workspace_out1_addr <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF Signal_From_Workspace_out1_enb = '1' THEN
        IF Signal_From_Workspace_out1_addr >= to_unsigned(16#36#, 6) THEN 
          Signal_From_Workspace_out1_addr <= to_unsigned(16#00#, 6);
        ELSE 
          Signal_From_Workspace_out1_addr <= Signal_From_Workspace_out1_addr + to_unsigned(16#01#, 6);
        END IF;
      END IF;
    END IF;
  END PROCESS SignalFromWorkspace_process;


  Signal_From_Workspace_out1_addr_delay <= Signal_From_Workspace_out1_addr AFTER 1 ns;

  -- Data source for fftIn_re
  fftIn_re_fileread: PROCESS (Signal_From_Workspace_out1_addr_delay, tb_enb_delay, rdEnb)
    FILE fp: TEXT open READ_MODE is "fftIn_re.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(15 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := (OTHERS => '0');
    ELSIF rdEnb = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    fftIn_reraw <= signed(read_data(15 DOWNTO 0));
  END PROCESS fftIn_re_fileread;

  
  rawData_fftIn_re <= to_signed(16#0000#, 16) WHEN rdEnb = '0' ELSE
      fftIn_reraw;

  -- holdData reg for Signal_From_Workspace_out1
  stimuli_Signal_From_Workspace_out1_2_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      holdData_fftIn_re <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      holdData_fftIn_re <= rawData_fftIn_re;
    END IF;
  END PROCESS stimuli_Signal_From_Workspace_out1_2_process;

  stimuli_Signal_From_Workspace_out1_3: PROCESS (rawData_fftIn_re, rdEnb, tb_enb_delay)
  BEGIN
    IF tb_enb_delay = '0' THEN
      fftIn_re_offset <= (OTHERS => '0');
    ELSIF rdEnb = '0' THEN
      fftIn_re_offset <= holdData_fftIn_re;
    ELSE
      fftIn_re_offset <= rawData_fftIn_re;
    END IF;
  END PROCESS stimuli_Signal_From_Workspace_out1_3;

  fftIn_re <= fftIn_re_offset AFTER 2 ns;

  snkDonen <=  NOT snkDone;

  resetn <=  NOT reset;

  tb_enb <= resetn AND snkDonen;

  -- Delay inside enable generation: register depth 1
  u_enable_delay_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tb_enb_delay <= '0';
    ELSIF clk'event AND clk = '1' THEN
      tb_enb_delay <= tb_enb;
    END IF;
  END PROCESS u_enable_delay_process;

  
  rdEnb <= tb_enb_delay WHEN snkDone = '0' ELSE
      '0';

  clk_enable <= rdEnb AFTER 2 ns;

  reset_gen: PROCESS 
  BEGIN
    reset <= '1';
    WAIT FOR 40 ns;
    WAIT UNTIL clk'event AND clk = '1';
    WAIT FOR 2 ns;
    reset <= '0';
    WAIT;
  END PROCESS reset_gen;

  clk_gen: PROCESS 
  BEGIN
    clk <= '1';
    WAIT FOR 10 ns;
    clk <= '0';
    WAIT FOR 10 ns;
    IF snkDone = '1' THEN
      clk <= '1';
      WAIT FOR 10 ns;
      clk <= '0';
      WAIT FOR 10 ns;
      WAIT;
    END IF;
  END PROCESS clk_gen;

  fftOut_re_enb <= ce_out AND fftOut_re_active;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 54
  c_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fftOut_re_addr <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF fftOut_re_enb = '1' THEN
        IF fftOut_re_addr >= to_unsigned(16#36#, 6) THEN 
          fftOut_re_addr <= to_unsigned(16#00#, 6);
        ELSE 
          fftOut_re_addr <= fftOut_re_addr + to_unsigned(16#01#, 6);
        END IF;
      END IF;
    END IF;
  END PROCESS c_3_process;


  
  fftOut_re_lastAddr <= '1' WHEN fftOut_re_addr >= to_unsigned(16#36#, 6) ELSE
      '0';

  fftOut_re_done <= fftOut_re_lastAddr AND resetn;

  -- Delay to allow last sim cycle to complete
  checkDone_1_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      check1_done <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF fftOut_re_done_enb = '1' THEN
        check1_done <= fftOut_re_done;
      END IF;
    END IF;
  END PROCESS checkDone_1_process;

  snkDone <= check1_done AND check2_done;

  fftOut_re_addr_delay_1 <= fftOut_re_addr AFTER 1 ns;

  -- Data source for fftOut_re_expected
  fftOut_re_expected_fileread: PROCESS (fftOut_re_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "fftOut_re_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(19 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := (OTHERS => '0');
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    fftOut_re_expected <= signed(read_data(18 DOWNTO 0));
  END PROCESS fftOut_re_expected_fileread;

  fftOut_re_ref <= fftOut_re_expected;

  fftOut_re_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fftOut_re_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND fftOut_re /= fftOut_re_ref THEN
        fftOut_re_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in fftOut_re: Expected " & to_hex(fftOut_re_ref) & (" Actual " & to_hex(fftOut_re))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS fftOut_re_checker;

  -- Data source for fftOut_im_expected
  fftOut_im_expected_fileread: PROCESS (fftOut_re_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "fftOut_im_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic_vector(19 DOWNTO 0);

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := (OTHERS => '0');
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      HREAD(l, read_data);
    END IF;
    fftOut_im_expected <= signed(read_data(18 DOWNTO 0));
  END PROCESS fftOut_im_expected_fileread;

  fftOut_im_ref <= fftOut_im_expected;

  fftOut_im_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fftOut_im_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND fftOut_im /= fftOut_im_ref THEN
        fftOut_im_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in fftOut_im: Expected " & to_hex(fftOut_im_ref) & (" Actual " & to_hex(fftOut_im))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS fftOut_im_checker;

  fftValidOut_addr_delay_1 <= fftOut_re_addr AFTER 1 ns;

  -- Data source for fftValidOut_expected
  fftValidOut_expected_fileread: PROCESS (fftValidOut_addr_delay_1, tb_enb_delay, ce_out)
    FILE fp: TEXT open READ_MODE is "fftValidOut_expected.dat";
    VARIABLE l: LINE;
    VARIABLE read_data: std_logic;

  BEGIN
    IF tb_enb_delay /= '1' THEN
      read_data := '0';
    ELSIF ce_out = '1' AND NOT ENDFILE(fp) THEN
      READLINE(fp, l);
      READ(l, read_data);
    END IF;
    fftValidOut_expected <= read_data;
  END PROCESS fftValidOut_expected_fileread;

  fftValidOut_ref <= fftValidOut_expected;

  fftValidOut_checker: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fftValidOut_testFailure <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF ce_out = '1' AND fftValidOut /= fftValidOut_ref THEN
        fftValidOut_testFailure <= '1';
        ASSERT FALSE
          REPORT "Error in fftValidOut: Expected " & to_hex(fftValidOut_ref) & (" Actual " & to_hex(fftValidOut))
          SEVERITY ERROR;
      END IF;
    END IF;
  END PROCESS fftValidOut_checker;

  testFailure <= fftValidOut_testFailure OR (fftOut_re_testFailure OR fftOut_im_testFailure);

  completed_msg: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF snkDone = '1' THEN
        IF testFailure = '0' THEN
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (PASSED)**************"
            SEVERITY NOTE;
        ELSE
          ASSERT FALSE
            REPORT "**************TEST COMPLETED (FAILED)**************"
            SEVERITY NOTE;
        END IF;
      END IF;
    END IF;
  END PROCESS completed_msg;

END rtl;
