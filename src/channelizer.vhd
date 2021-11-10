library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
use work.filterDef.all;

entity channelizer is
	port(
		clk: in std_logic;
		n_rst: in std_logic;
		
		x_re: in sample;
		x_im: in sample;
		write_ready: out std_logic;
		write_en: in std_logic;
		
		y_re: out sample;
		y_im: out sample;
		read_ready: out std_logic;
		read_en: in std_logic
		
	);
end entity;


architecture arc_channelizer of channelizer is
	component serial_PFB is
		port (
			clk: in std_logic;
			n_rst: in std_logic;
			
			x_n : in sample;
			write_en : in std_logic;
			write_ready: out std_logic := '1';
			
			y_k : out filtOutput;
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
	
	component FIFO is 
    generic ( 
        data_width : natural := 8; 
        -- fifo_depth minimum required for almost_full and almsot_empty thresholds 
        fifo_depth : natural range 16 to 8192 := 32 
    ); 
    port( 
			clk  : in std_logic; 
        -- Write Side 
        
        wr_enable : in std_logic;  
        wr_data : in std_logic_vector(data_width-1 downto 0); 
        full    : out std_logic; 
        almost_full : out std_logic; 
         
        -- Read side 
        rd_enable : in std_logic;  
        rd_data : out std_logic_vector(data_width-1 downto 0); 
        empty   : out std_logic; 
        almost_empty : out std_logic  
    ); 
	end component; 

	signal PFB_write_en: std_logic;
	signal PFB_read_en: std_logic;
	signal PFB_re_write_ready: std_logic;
	signal PFB_im_write_ready: std_logic;
	signal y_k_re: filtOutput;
	signal y_k_im: filtOutput;
	signal PFB_re_read_ready: std_logic;
	signal PFB_im_read_ready: std_logic;
	
	signal reset: std_logic := '0';
	signal clk_enable: std_logic;
	signal fftIn_re: signed(15 DOWNTO 0);
	signal fftIn_im: signed(15 DOWNTO 0);
	signal fftValidIn: std_logic;
	signal ce_out: std_logic;
	signal fftOut_re: signed(18 DOWNTO 0);
	signal fftOut_im: signed(18 DOWNTO 0);
	signal fftValidOut: std_logic;
	
	signal FIFO_wr_enable: std_logic;
	signal FIFO_wr_data: std_logic_vector(sampleWidth*2-1 downto 0);
	signal FIFO_full: std_logic;
	signal FIFO_almost_full: std_logic;
	
	signal FIFO_rd_enable: std_logic;  
	signal FIFO_rd_data : std_logic_vector(sampleWidth*2-1 downto 0); 
	signal FIFO_empty   : std_logic; 
	signal FIFO_almost_empty : std_logic;

	signal FIFO_re_vec: std_logic_vector(18 downto 0);
	signal FIFO_im_vec: std_logic_vector(18 downto 0);
	
begin
	pfb_re: serial_pfb port map (clk, n_rst, x_re, PFB_write_en, PFB_re_write_ready,
							y_k_re, PFB_read_en, PFB_re_read_ready);
							
	pfb_im: serial_pfb port map (clk, n_rst, x_im, PFB_write_en, PFB_im_write_ready,
							y_k_im, PFB_read_en, PFB_im_read_ready);
	
	fft: HDL_DUT port map (clk, reset, 
									clk_enable, fftIn_re, fftIn_im, fftValidIn, ce_out,
									fftOut_re, fftOut_im, fftValidOut);
	fifo_module: fifo generic map (sampleWidth*2, phaseCount*2) port map (clk, FIFO_wr_enable, FIFO_wr_data,
																	FIFO_full, FIFO_almost_full,
																	FIFO_rd_enable, FIFO_rd_data,
																	FIFO_empty, FIFO_almost_empty);
	-- Input to pfb
	PFB_write_en <= write_en;
	write_ready <= PFB_re_write_ready and PFB_im_write_ready;
	
	-- PFB to FFT
	fftValidIn <= PFB_re_read_ready and PFB_im_read_ready;
	PFB_read_en <= fftValidIn;
	fftIn_re <= y_k_re;
	fftIn_im <= y_k_im;
	
	-- FFT to FIFO
	FIFO_wr_enable <= fftValidOut;
	FIFO_re_vec <= std_logic_vector(fftOut_re);
	FIFO_im_vec <= std_logic_vector(fftOut_im);
	-- Pack the complex number into the FIFO with MSB real, LSB imaginary
	FIFO_wr_data <= FIFO_re_vec(15 downto 8) & FIFO_im_vec(15 downto 8);
	
	
	-- FIFO to out
	FIFO_rd_enable <= read_en and not FIFO_empty;
	read_ready <= not FIFO_empty;
	
	y_re <= signed(FIFO_rd_data(15 downto 8));
	y_im <= signed(FIFO_rd_data(7 downto 0));
	
	-- reset <= not n_rst when ;
	clk_enable <= not reset;

	startup : process(clk)
		variable count : integer := 0;
	begin
		if rising_edge(clk) then
			count := count + 1;
			if count > 5 then
				reset <= '0';
			else
				reset <= '1';
			end if;
		end if;
	end process;
	
	
end architecture;
		