library IEEE;
use IEEE.std_logic_1164.all;
use work.filter_types.all;

entity ADS_project_echo is 
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

architecture ADS of ADS_project_echo is
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
		in_data_ready: out std_logic;
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

		signal q: std_logic_vector(25 downto 0);
	
	signal display_num: std_logic_vector(15 downto 0);
	signal display_clk: std_logic;
	
	signal input_shiftreg: std_logic_vector(7 downto 0);
	signal output_shiftreg: std_logic_vector(7 downto 0) := "00000000";
	signal out_data_ready: std_logic := '0';
	signal in_data_ready: std_logic := '0';
	signal tx_empty: std_logic;
	signal indicate_read: std_logic;
	
	signal prev_data_ready: std_logic := '0';
	
	constant DATA_DEPTH : integer := 1;
	constant DATA_WIDTH : integer := 8;
	
	signal tx_sr_in: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal tx_sr_val: std_logic_vector(DATA_WIDTH-1 downto 0)  := (others => '0');
	signal tx_sr_data: std_logic_vector(DATA_WIDTH*DATA_DEPTH-1 downto 0);
	signal tx_sr_clk: std_logic;
	signal tx_sr_read_en: std_logic := '0';
	signal tx_sr_write_en: std_logic := '1';
	signal tx_sr_is_full: std_logic;
	signal tx_sr_is_empty: std_logic;

	signal rx_sr_in: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal rx_sr_val: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	signal rx_sr_data: std_logic_vector(DATA_WIDTH*DATA_DEPTH-1 downto 0);
	signal rx_sr_clk: std_logic;
	signal rx_sr_read_en: std_logic := '0';
	signal rx_sr_write_en: std_logic := '1';
	signal rx_sr_is_full: std_logic;
	signal rx_sr_is_empty: std_logic;
	
	signal tx_mode_active: std_logic := '0';
	
	signal byte: std_logic_vector(7 downto 0);
	signal led_clk: std_logic := '0';

	signal x_prev: std_logic_vector(7 downto 0);
	
	constant phaseCount: integer := 3;
	constant tapCount: integer := 4;
	signal x_n: int_arr(0 to phaseCount*tapCount-1)(7 downto 0);
	signal h_n: int_arr(0 to phaseCount*tapCount-1)(7 downto 0);
	signal y_k : int_arr(0 to phaseCount-1)(7 downto 0);
begin
	display: seven_seg_display port map(display_clk, display_num, seg_select, segments);
	clocking: counter port map(clk, q);
	spi: SPI_module port map (clk, sck, mosi, miso, cs, input_shiftreg, output_shiftreg, out_data_ready, in_data_ready, indicate_read, tx_empty);
	tx_sr:  shift_register generic map (DATA_WIDTH, DATA_DEPTH) port map (tx_sr_in, tx_sr_val, tx_sr_data, tx_sr_clk, tx_sr_read_en, tx_sr_write_en, tx_sr_is_full, tx_sr_is_empty);
	rx_sr:  shift_register generic map (DATA_WIDTH, DATA_DEPTH) port map (rx_sr_in, rx_sr_val, rx_sr_data, rx_sr_clk, rx_sr_read_en, rx_sr_write_en, rx_sr_is_full, rx_sr_is_empty);
	display_clk <= q(16);
	
	display_num(15 downto 0) <= rx_sr_data(7 downto 0) & rx_sr_data(7 downto 0);
	
	-- check_end_tx: process(clk)
	-- begin
	-- 	if rising_edge(clk) then
	-- 		--On rising edge we check to see if slave has received anything
	-- 		if in_data_ready = '1' then
	-- 			x_prev <= input_shiftreg;
	-- 			indicate_read <= '1';
	-- 		end if;

	-- 	elsif falling_edge(clk) then
	-- 		-- When a new byte has been read update the output shiftreg
	-- 		if indicate_read = '1' then
	-- 			output_shiftreg <= x_prev;
	-- 			out_data_ready <= '1';
	-- 		end if;
	-- 	end if;
	-- end process;

	-- next_output 
	output_shiftreg <= rx_sr_val;

	-- Move the SPI incoming byte to the rx shiftreg
	rx_sr_in <= input_shiftreg;

	-- SPI Rx
	SPI_Rx : process (clk)
	begin

		if rising_edge(clk) then
			-- If data is available from the SPI Module, in_data_ready will be high
			if in_data_ready = '1' then 
				rx_sr_clk <= '1';
				indicate_read <= '1';
			else
				rx_sr_clk <= '0';
				indicate_read <= '0';
			end if;

		elsif falling_edge(clk) then
			-- At the falling edge, we move from the shift register to somewhere useful...
		end if;
	end process;

	-- SPI Tx
	SPI_Tx : process(clk)
	begin
		if rising_edge(clk) then
			-- IF SPI is waiting to send then and tx_empty will be high
			if tx_empty = '1' then
				-- Next output has been loaded asynchronously,
				-- we just need to indicate we are ready to tx
				out_data_ready <= '1';
			else
				out_data_ready <= '0';
			end if;
		elsif falling_edge(clk) then
			-- 
		end if;
	end process;

	--todo: make 2 shift registers, one for rx and one for tx. It should hold 1 byte each 


end architecture;