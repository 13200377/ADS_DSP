library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.filter_types.all;

entity ADS_project is 
	port(
		miso: out std_logic;
		mosi: in std_logic;
		cs: in std_logic;
		sck: in std_logic;
		
		clk_50MHz: in std_logic
		--clk_16MHz : in std_logic

		
		-- seg_select: out std_logic_vector(3 downto 0);
		-- segments: out std_logic_vector(7 downto 0);
		
		-- vals: out std_logic_vector(3 downto 0)
		
	);
end entity;

architecture ADS of ADS_project is
	
	component SPI_continuous is
		generic(
			frame_size: positive := 8
		);
		port(
		clk: in std_logic;
		sck: in std_logic;
		mosi: in std_logic;
		miso: out std_logic;
		cs: in std_logic;
		input_shiftreg: out std_logic_vector(7 downto 0);
		output_shiftreg: in std_logic_vector(7 downto 0);
		out_data_ready: in std_logic;
		in_data_ready: out std_logic := '0';
		indicate_read: in std_logic;
		tx_empty: out std_logic
		);
	end component;

	component shift_register is
		generic(data_width: positive := 8;
			  depth: positive);
		port(sr_in : in std_logic_vector(data_width-1 downto 0);
			  sr_out: out std_logic_vector(data_width-1 downto 0);
			  data: out std_logic_vector(data_width*depth-1 downto 0);
			  clk     : in std_logic := '0';
			  read_en: in std_logic := '0';
			  write_en: in std_logic := '0';
			  is_full : out std_logic;
			  is_empty: out std_logic
			  );
	end component;
	
	component leds is
		port( BYTE : in std_logic_vector(7 downto 0);
			CLK : in std_logic;
			VALS : out std_logic_vector(3 downto 0) );
	end component;

	component channelizer is
		port(
		clk: in std_logic;
		n_rst: in std_logic;
		
		x_re: in fi_7Q8;
		x_im: in fi_7Q8;
		write_ready: out std_logic;
		write_en: in std_logic;
		
		y_re: out fi_7Q8;
		y_im: out fi_7Q8;
		read_ready: out std_logic;
		read_en: in std_logic
		
	);
	end component;

	component PISO_arr is
		generic (
			arrSize: positive;
			dataWidth: positive;
			outputFromStart: boolean := true
		);
		port(
			clk: in std_logic;
			n_rst: in std_logic;
			
			parallel_in: in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
			write_en: in std_logic;
			write_ready: out std_logic := '1';
			
			serial_out: out signed(dataWidth-1 downto 0);
			read_en: in std_logic;
			read_ready: out std_logic := '0'
		);
	end component;

	component Filt_CLK IS
	port 
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
	end component;

	-- SPI signals
	signal input_shiftreg: std_logic_vector(7 downto 0);
	signal output_shiftreg: std_logic_vector(7 downto 0) := "00000000";
	signal out_data_ready: std_logic := '0';
	signal in_data_ready: std_logic := '0';
	signal indicate_read: std_logic := '0';
	signal tx_empty: std_logic;
	
	--constant DATA_DEPTH : integer := 4;
	--constant DATA_WIDTH : integer := 8;
	
	-- tx shiftreg
	signal tx_sr_in: std_logic_vector(sampleWidth-1 downto 0);
	signal tx_sr_val: std_logic_vector(sampleWidth-1 downto 0)  := (others => '0');
	signal tx_sr_data: std_logic_vector(sampleWidth-1 downto 0);
	signal tx_sr_clk: std_logic;
	signal tx_sr_read_en: std_logic := '0';
	signal tx_sr_write_en: std_logic := '1';
	signal tx_sr_is_full: std_logic;
	signal tx_sr_is_empty: std_logic;

	-- rx shiftreg
	-- signal rx_sr_in: std_logic_vector(sampleWidth-1 downto 0);
	-- signal rx_sr_val: std_logic_vector(sampleWidth-1 downto 0) := (others => '0');
	-- signal rx_sr_data: std_logic_vector(sampleWidth*2-1 downto 0);
	-- signal rx_sr_clk: std_logic;
	-- signal rx_sr_read_en: std_logic := '0';
	-- signal rx_sr_write_en: std_logic := '1';
	-- signal rx_sr_is_full: std_logic;
	-- signal rx_sr_is_empty: std_logic;

	
	-- LED bar
	-- signal byte: std_logic_vector(7 downto 0);
	-- signal led_clk: std_logic := '0';
	
	-- PFB signals
	signal n_rst : std_logic := '1';
	signal x_re: fi_7Q8;
	signal x_im: fi_7Q8;
	signal pfb_wr_ready : std_logic;
	signal pfb_wr_en : std_logic := '0';

	signal y_re : fi_7Q8;
	signal y_im : fi_7Q8;
	signal pfb_rd_ready : std_logic;
	signal pfb_rd_en : std_logic :='0';

	-- Signal that 2 samples have been recieved
	signal IQ_in_ready : std_logic := '0';

	-- PISO Arr
	signal piso_in : int_arr(0 to 1)(sampleWidth-1 downto 0);
	signal piso_wr_en : std_logic;
	signal piso_wr_ready : std_logic;
	signal piso_ser_out : signed(sampleWidth-1 downto 0);
	signal piso_rd_en : std_logic;
	signal piso_rd_ready : std_logic;

	-- pll
    signal clk_8MHz : std_logic;
	signal clk_16MHz : std_logic;
	signal pll_reset : std_logic; -- active high reset
	signal pll_locked : std_logic; -- high when locked

	signal spi_in_buff : integer_arr(0 to 1);


begin

	spi: SPI_continuous generic map (8) port map (clk_16MHz, sck, mosi, miso, cs, input_shiftreg, output_shiftreg, out_data_ready, in_data_ready, indicate_read, tx_empty);
	-- led_bar: leds port map (byte, led_clk, vals);

	-- tx_sr:  shift_register generic map (sampleWidth, 1) 
	-- 						port map (tx_sr_in, tx_sr_val, tx_sr_data, tx_sr_clk, tx_sr_read_en, tx_sr_write_en, tx_sr_is_full, tx_sr_is_empty);
	-- rx_sr:  shift_register generic map (sampleWidth, 2) 
	-- 						port map (rx_sr_in, rx_sr_val, rx_sr_data, rx_sr_clk, rx_sr_read_en, rx_sr_write_en, rx_sr_is_full, rx_sr_is_empty);
	PPC: channelizer port map(clk_16MHz, n_rst, x_re, x_im, pfb_wr_ready, pfb_wr_en, 
										  y_re, y_im, pfb_rd_ready, pfb_rd_en);

	piso : PISO_arr generic map(2,sampleWidth,true)
				port map(clk_16MHz, n_rst, piso_in, piso_wr_en, piso_wr_ready, piso_ser_out, piso_rd_en, piso_rd_ready);

	clk_div : Filt_CLK port map(pll_reset, clk_50MHz, clk_16MHz, clk_8MHz, pll_locked);

	pll_reset <= '0';
	n_rst <= '1' when pll_locked = '1' else '0';
	
	-- Move filter output to into PISO and then PISO onto spi
	piso_in(0) <= y_re(15 downto 8);
	piso_in(1) <=  y_im(15 downto 8);
	output_shiftreg <= std_logic_vector(piso_ser_out);

	-- Move SPI byte into shiftreg
	-- rx_sr_in <= input_shiftreg;
	-- Shiftreg will output 2 values, load them into filter at the same time
	-- x_re <= to_fi_7Q8(to_integer(signed(rx_sr_data(15 downto 8))),'0'); 
	-- x_im <= to_fi_7Q8(to_integer(signed(rx_sr_data(7 downto 0))),'0');
	x_re <= to_fi_7Q8(spi_in_buff(0),'0');
	x_im <= to_fi_7Q8(spi_in_buff(1),'0');

	pfb_wr_en <= '1' when (pfb_wr_ready = '1' AND IQ_in_ready ='1') else '0';


	-- SPI Rx
	SPI_Rx : process (clk_16MHz)
		variable I : integer := 0;
	begin

		if rising_edge(clk_16MHz) then
			
			-- If data is available from the SPI Module, in_data_ready will be high
			if in_data_ready = '1' then 
				-- rx_sr_clk <= '1';
				indicate_read <= '1';

				spi_in_buff(I) <= to_integer(signed(input_shiftreg));

				if I = 0 then
					I := 1;
					IQ_in_ready <= '0';
				else
					I := 0;
					IQ_in_ready <= '1';
				end if;

			else
				-- rx_sr_clk <= '0';
				indicate_read <= '0';
				IQ_in_ready <= '0';
			end if;
		elsif falling_edge(clk_16MHz) then
		end if;
	end process;

	-- SPI Tx
	SPI_Tx : process(clk_16MHz)
	begin
		if rising_edge(clk_16MHz) then

			-- IF SPI is waiting to send then tx_empty will be high
			if tx_empty = '1'  AND piso_rd_ready = '1' then
				-- Next output has been loaded asynchronously,
				-- we just need to indicate we are ready to tx
				out_data_ready <= '1';
				-- pfb_rd_en <= '1';
			else
				out_data_ready <= '0';
				-- pfb_rd_en <= '0';
			end if;

		elsif falling_edge(clk_16MHz) then
			-- If filter has completed we need to put data into piso_arr
			if pfb_rd_ready = '1' AND piso_wr_ready = '1' then
				pfb_rd_en <= '1';
				-- Put data into piso_arr
				piso_wr_en <= '1';
			else
				pfb_rd_en <= '0';
				piso_wr_en <= '1';
			end if;
		end if;
	end process;

end architecture;
		