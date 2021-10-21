library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
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
	
	component Polyphase_decimator is
		port (
			x_n : in fi_7Q8;
			clk: in std_logic;
			y_m : out signed(sampleWidth-1 downto 0)
		);
	end component;

	-- SPI signals
	signal input_shiftreg: std_logic_vector(7 downto 0);
	signal output_shiftreg: std_logic_vector(7 downto 0) := "00000000";
	signal out_data_ready: std_logic := '0';
	signal in_data_ready: std_logic := '0';
	signal tx_empty: std_logic;
	signal indicate_read: std_logic;

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
	signal rx_sr_in: std_logic_vector(sampleWidth-1 downto 0);
	signal rx_sr_val: std_logic_vector(sampleWidth-1 downto 0) := (others => '0');
	signal rx_sr_data: std_logic_vector(sampleWidth-1 downto 0);
	signal rx_sr_clk: std_logic;
	signal rx_sr_read_en: std_logic := '0';
	signal rx_sr_write_en: std_logic := '1';
	signal rx_sr_is_full: std_logic;
	signal rx_sr_is_empty: std_logic;
	
	-- led status
	signal byte: std_logic_vector(7 downto 0);
	signal led_clk: std_logic := '0';

	-- Filter IO signals
	signal x_n : fi_7Q8;
	signal filt_clk : std_logic := '1';
--	signal count : integer := 0;
	signal y_k : signed(sampleWidth-1 downto 0);

begin
	spi: SPI_module port map (clk, sck, mosi, miso, cs, input_shiftreg, output_shiftreg, out_data_ready, in_data_ready, indicate_read, tx_empty);
	tx_sr:  shift_register generic map (sampleWidth, 1) port map (tx_sr_in, tx_sr_val, tx_sr_data, tx_sr_clk, tx_sr_read_en, tx_sr_write_en, tx_sr_is_full, tx_sr_is_empty);
	rx_sr:  shift_register generic map (sampleWidth, 1) port map (rx_sr_in, rx_sr_val, rx_sr_data, rx_sr_clk, rx_sr_read_en, rx_sr_write_en, rx_sr_is_full, rx_sr_is_empty);
	led_bar: leds port map (byte, led_clk, vals);
	filter: Polyphase_decimator port map (x_n,filt_clk,y_k);

	-- display on LED's
	byte(0) <= not tx_empty;
	-- byte(1) <= not tx_mode_active;
	byte(2) <= not out_data_ready;--sr_is_empty;
	byte(3) <= not sck;--sr_clk;

	-- Move filter output to onto SPI
	output_shiftreg <= std_logic_vector(y_k);

	-- Move SPI byte onto filter input 
	x_n <= to_fi_7Q8(to_integer(signed(rx_sr_val)),'0');

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

	-- Filter Clock
	-- sck_div : process(sck)
	-- variable count : integer := 0;
	-- begin
	-- 	if rising_edge(sck) then
	-- 		count := count + 1;
	-- 		if count > 7 then --AND in_data_ready = '1' then
	-- 			filt_clk <= NOT filt_clk;
	-- 			count := 0;
	-- 		end if;
	-- 	end if;
	-- 	-- if (count > 7) AND (in_data_ready = '1') then
	-- 	-- 	filt_clk <= NOT filt_clk;
	-- 	-- 	count := 0;
	-- 	-- end if;
	-- end process;

	sck_div : process(indicate_read)
	begin
		if rising_edge(indicate_read) then
		 	filt_clk <= NOT filt_clk;
		end if;
	end process;

end architecture;