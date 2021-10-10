--library std;
--use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--use std.textio.all;
--use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
library FFT_8port;
use FFT_8port.all;

entity FFT_tb is
	port(
		clk: in std_logic
	);
end entity;

architecture FFT_testbench of FFT_TB is
	component FFT_8port is
		port (
			clk          : in  std_logic                     := 'X';             -- clk
			reset_n      : in  std_logic                     := 'X';             -- reset_n
			sink_valid   : in  std_logic                     := 'X';             -- sink_valid
			sink_ready   : out std_logic;                                        -- sink_ready
			sink_error   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- sink_error
			sink_sop     : in  std_logic                     := 'X';             -- sink_sop
			sink_eop     : in  std_logic                     := 'X';             -- sink_eop
			sink_real    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- sink_real
			sink_imag    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- sink_imag
			fftpts_in    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- fftpts_in
			inverse      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- inverse
			source_valid : out std_logic;                                        -- source_valid
			source_ready : in  std_logic                     := 'X';             -- source_ready
			source_error : out std_logic_vector(1 downto 0);                     -- source_error
			source_sop   : out std_logic;                                        -- source_sop
			source_eop   : out std_logic;                                        -- source_eop
			source_real  : out std_logic_vector(19 downto 0);                    -- source_real
			source_imag  : out std_logic_vector(19 downto 0);                    -- source_imag
			fftpts_out   : out std_logic_vector(3 downto 0)                      -- fftpts_out
		);
	end component FFT_8port;
	
	-- FFT signals
	--signal clk          : std_logic := '0';
	signal reset_n      : std_logic := '1';                   
	signal sink_valid   : std_logic := '0';                   
	signal sink_ready   : std_logic;                                        -- sink_ready
	signal sink_error   : std_logic_vector(1 downto 0) := "00";  
	signal sink_sop     : std_logic := '0';                     
	signal sink_eop     : std_logic := '0';                    
	signal sink_real    : std_logic_vector(15 downto 0) := (others => '0'); 
	signal sink_imag    : std_logic_vector(15 downto 0) := (others => '0'); 
	signal fftpts_in    : std_logic_vector(3 downto 0) := "0100";  
	signal inverse      : std_logic_vector(0 downto 0) := "0";  
	signal source_valid : std_logic;                    
	signal source_ready : std_logic := '0';                     
	signal source_error : std_logic_vector(1 downto 0);                     -- source_error
	signal source_sop   : std_logic;                                        -- source_sop
	signal source_eop   : std_logic;                                        -- source_eop
	signal source_real  : std_logic_vector(19 downto 0);                    -- source_real
	signal source_imag  : std_logic_vector(19 downto 0);                    -- source_imag
	signal fftpts_out   : std_logic_vector(3 downto 0);
	
	constant clk_period : time := 20 ps; -- 50 MHz
	constant num_samples: integer := 24;
	constant fft_size: integer := 8;
	constant sampleWidth: integer := 16;
	function int(num: integer; bit_count: integer) return signed is
	begin
        return to_signed(num, bit_count);
	end function;
	
	
	constant test_re : int_arr(0 to num_Samples-1)(sampleWidth-1 downto 0)
						 := (
								int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
								 int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
								 int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
								 int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth),
								 
								  int(-1,sampleWidth), int(-1,sampleWidth), int(-1,sampleWidth), 
								  int(-1,sampleWidth),  int(-1,sampleWidth),int(-1,sampleWidth), 
								  int(-1,sampleWidth), int(-1,sampleWidth), int(-1,sampleWidth),  
								  int(-1,sampleWidth),  int(-1,sampleWidth), int(-1,sampleWidth)
							 );
	constant test_im : int_arr(0 to num_Samples-1)(sampleWidth-1 downto 0)
						 := (
								int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
								 int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
								 int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
								 int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth),
								 
								  int(-1,sampleWidth), int(-1,sampleWidth), int(-1,sampleWidth), 
								  int(-1,sampleWidth),  int(-1,sampleWidth),int(-1,sampleWidth), 
								  int(-1,sampleWidth), int(-1,sampleWidth), int(-1,sampleWidth),  
								  int(-1,sampleWidth),  int(-1,sampleWidth), int(-1,sampleWidth)
							 );
begin
	fft : FFT_8port port map (clk, reset_n, sink_valid, sink_ready,
									  sink_error, sink_sop, sink_eop, sink_real,
									  sink_imag, fftpts_in, inverse, source_valid,
									  source_ready, source_error, source_sop, 
									  source_eop, source_real, source_imag, fftpts_out);
--	create_clk: process
--	begin
--		wait for clk_period/2;
--		clk <= not clk;
--	end process;
	
	testbench: process(clk)
	variable clkCount  : integer := 0;
	begin
	if rising_edge(clk) then
		
		if clkCount < 8 then
			clkCount := clkCount + 1;
		else
		
			reset_n <= '0';
			
			--wait for CLK_PERIOD * 8;
			
			sink_valid <= '1';
			sink_sop <= '1';
			sink_real <= std_logic_vector(test_re(0));
			sink_imag <= std_logic_vector(test_im(0));
			
			--wait for CLK_PERIOD * 4;
			
	--		report LF
	--		  & "SUCCESS!" & LF
	--		  & "----------------"
	--		  severity note;
	--	  stop;
		end if;
	end if;
	end process;
	

end architecture;