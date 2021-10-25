library IEEE;
use IEEE.std_logic_1164.all;
use work.filter_types.all;
use work.filterDef.all;

entity ADS_project is 
	port(
		miso: out std_logic;
		mosi: in std_logic;
		cs: in std_logic;
		sck: in std_logic;
		
		clk: in std_logic;
		
		seg_select: out std_logic_vector(3 downto 0);
		segments: out std_logic_vector(7 downto 0);
		
		vals: out std_logic_vector(3 downto 0)
		
	);
end entity;

architecture ADS of ADS_project is
	component seven_seg_display is
		port( clk : in std_logic;
				num : in std_logic_vector(15 downto 0);
				dig: out std_logic_vector(3 downto 0);
				seg: out std_logic_vector(7 downto 0));
	end component;
	
	component counter
	PORT
		(
			clock		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0)
		);
	end component;
	
	component SPI_module is
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
	
	component channelizer is
		port(
			clk: in std_logic;
			n_rst: in std_logic;
			
			x_n: in fi_7Q8;
			write_ready: out std_logic;
			write_en: in std_logic;
			
			y_n: out fi_7Q8;
			read_ready: out std_logic;
			read_en: in std_logic
			
		);
	end component;

	
	-- Reset
	signal n_rst: std_logic := '1';
	
	-- Counter
	signal q: std_logic_vector(25 downto 0);
	
	-- 7 seg display
	signal display_num: std_logic_vector(15 downto 0);
	signal display_clk: std_logic;
	
	-- SPI signals
	signal input_shiftreg: std_logic_vector(7 downto 0);
	signal output_shiftreg: std_logic_vector(7 downto 0) := "00000000";
	signal out_data_ready: std_logic := '0';
	signal in_data_ready: std_logic := '0';
	signal indicate_read: std_logic := '0';
	signal tx_empty: std_logic;
	
	constant DATA_DEPTH : integer := 4;
	constant DATA_WIDTH : integer := 8;
	
	-- Channelizer signals
	signal x_n: fi_7Q8;
	signal write_ready: std_logic;
	signal write_en: std_logic;
	
	signal y_n: fi_7Q8;
	signal read_ready: std_logic;
	signal read_en: std_logic;
	
begin

	display: seven_seg_display port map(display_clk, display_num, seg_select, segments);
	clocking: counter port map(clk, q);
	spi: SPI_module generic map (8) port map (clk, sck, mosi, miso, cs, input_shiftreg, output_shiftreg, out_data_ready, in_data_ready, indicate_read, tx_empty);
	chan: channelizer port map (clk, n_rst,
										 x_n, write_ready, write_en,
										 y_n, read_ready, read_en);
	
	display_num(7 downto 0) <= input_shiftreg;
	display_clk <= q(15);
	
	-- SPI to channelizer
	x_n <= signed(input_shiftreg);
	write_en <= write_ready and in_data_ready;
	indicate_read <= write_en;
	
	-- channelizer so SPI
	output_shiftreg <= std_logic_vector(y_n);
	read_en <= read_ready tx_empty;
	indicate_write <= read_en;
	

	n_rst <= '1';
end architecture;
		