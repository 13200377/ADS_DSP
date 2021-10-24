library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
use work.filterDef.all;

entity channelizer is
	port(
		clk: in std_logic;
		n_rst: in std_logic;
		
		x_n: in fi_7Q8;
		write_ready: out std_logic;
		write_en: in std_logic;
		
		y_n: out fi_15Q16;
		read_ready: out std_logic;
		read_en: in std_logic
		
	);
end entity;


architecture arc_channelizer of channelizer is
	component serial_PFB is
		port (
			clk: in std_logic;
			n_rst: in std_logic;
			
			x_n : in fi_7Q8;
			write_en : in std_logic;
			write_ready: out std_logic := '1';
			
			y_k : out fi_15Q16;
			read_en : in std_logic;
			read_ready: out std_logic := '0'
		);
	end component;
	
	component HDL_DUT IS
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
	END component;
	
	signal PFB_write_en: std_logic;
	signal PFB_write_ready: std_logic;
	signal y_k: fi_15Q16;
	signal PFB_read_en: std_logic;
	signal PFB_read_ready: std_logic;
	
	signal reset: std_logic := '0';
	signal clk_enable: std_logic;
	signal fftIn_re: signed(15 DOWNTO 0);
	signal fftIn_im: signed(15 DOWNTO 0);
	signal fftValidIn: std_logic;
	signal ce_out: std_logic;
	signal fftOut_re: signed(18 DOWNTO 0);
	signal fftOut_im: signed(18 DOWNTO 0);
	signal fftValidOut: std_logic;
	
begin
	s_pfb: serial_pfb port map (clk, n_rst, x_n, PFB_write_en, PFB_write_ready,
							y_k, PFB_read_en, PFB_read_ready);
	
	fft: HDL_DUT port map (clk, reset, 
									clk_enable, fftIn_re, fftIn_im, fftValidIn, ce_out,
									fftOut_re, fftOut_im, fftValidOut);
	-- Input to pfb
	PFB_write_en <= PFB_write_ready and write_ready;
	write_ready <= PFB_write_ready;
	
	-- PFB to FFT
	fftValidIn <= PFB_read_ready;
	PFB_read_en <= PFB_read_ready;
	
	-- FFT to output
	read_ready <= fftValidOut;
	
	
	-- WARNING: CANNOT DECIDE WHEN TO READ FROM FFT EXCEPT FOR CLK_EN
	
	reset <= not n_rst;
	clk_enable <= '1';
end architecture;
		