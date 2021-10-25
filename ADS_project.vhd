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
		
		clk: in std_logic;
		
		seg_select: out std_logic_vector(3 downto 0);
		segments: out std_logic_vector(7 downto 0);
		
		vals: out std_logic_vector(3 downto 0)
		
	);
end entity;

architecture ADS of ADS_project is
	-- component seven_seg_display is
	-- 	port( clk : in std_logic;
	-- 			num : in std_logic_vector(15 downto 0);
	-- 			dig: out std_logic_vector(3 downto 0);
	-- 			seg: out std_logic_vector(7 downto 0));
	-- end component;
	
	-- component counter
	-- PORT
	-- 	(
	-- 		clock		: IN STD_LOGIC ;
	-- 		q		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0)
	-- 	);
	-- end component;
	
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
	
	-- component FIFO is 
	-- 	generic(data_width: positive := 8;
	-- 			  depth: positive);
	-- 	port(fifo_in : in std_logic_vector(data_width-1 downto 0);
	-- 		  fifo_out: out std_logic_vector(data_width-1 downto 0);
	-- 		  clk     : in std_logic;
	-- 		  read_en : in std_logic;
	-- 		  write_en: in std_logic;
	-- 		  is_full : out std_logic;
	-- 		  is_empty: out std_logic);
	-- end component;
	
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

	
	-- component PFB2 is
	-- 	generic(
	-- 		dataWidth: integer := 8;
	-- 		phaseCount: integer;
	-- 		tapCount: integer
	-- 	);
	-- 	port (
	-- 		x_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
	-- 		h_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
	-- 		clk: in std_logic;
	-- 		y_k : out int_arr(0 to phaseCount-1)(dataWidth-1 downto 0)
	-- 	);
	-- end component;
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

	-- Counter
	-- signal q: std_logic_vector(25 downto 0);
	
	-- 7 seg display
	-- signal display_num: std_logic_vector(15 downto 0);
	-- signal display_clk: std_logic;
	
	-- SPI signals
	signal input_shiftreg: std_logic_vector(7 downto 0);
	signal output_shiftreg: std_logic_vector(7 downto 0) := "00000000";
	signal out_data_ready: std_logic := '0';
	signal in_data_ready: std_logic := '0';
	signal indicate_read: std_logic := '0';
	signal tx_empty: std_logic;
	
	constant DATA_DEPTH : integer := 4;
	constant DATA_WIDTH : integer := 8;
	
	-- rx shiftreg
	signal rx_sr_in: std_logic_vector(sampleWidth-1 downto 0);
	signal rx_sr_val: std_logic_vector(sampleWidth-1 downto 0) := (others => '0');
	signal rx_sr_data: std_logic_vector(sampleWidth-1 downto 0);
	signal rx_sr_clk: std_logic;
	signal rx_sr_read_en: std_logic := '0';
	signal rx_sr_write_en: std_logic := '1';
	signal rx_sr_is_full: std_logic;
	signal rx_sr_is_empty: std_logic;
	
	-- FSM
	-- signal tx_mode_active: std_logic := '0';
	
	-- LED bar
	signal byte: std_logic_vector(7 downto 0);
	signal led_clk: std_logic := '0';
	
	-- PFB signals
	signal pfb_reset : std_logic := '1';
	signal x_n: fi_7Q8;
	signal pfb_wr_en : std_logic := '0';
	signal pfb_wr_ready : std_logic;
	signal y_m : fi_15Q16;
	signal pfb_rd_en : std_logic :='0';
	signal pfb_rd_ready : std_logic;


begin
	-- display: seven_seg_display port map(display_clk, display_num, seg_select, segments);
	-- clocking: counter port map(clk, q);
	spi: SPI_continuous generic map (8) port map (clk, sck, mosi, miso, cs, input_shiftreg, output_shiftreg, out_data_ready, in_data_ready, indicate_read, tx_empty);
	-- rx_sr:  shift_register generic map (sampleWidth, 1) port map (rx_sr_in, rx_sr_val, rx_sr_data, rx_sr_clk, rx_sr_read_en, rx_sr_write_en, rx_sr_is_full, rx_sr_is_empty);
	led_bar: leds port map (byte, led_clk, vals);
	PPC: serial_PFB port map (clk, pfb_reset, x_n, pfb_wr_en, pfb_wr_ready, y_m, pfb_rd_en, pfb_rd_ready);
	-- display_clk <= q(16);
	
	--display_num(15 downto 0) <= sr_data(15 downto 0);
	-- display_num(7 downto 0) <= input_shiftreg;
	-- display_num(15 downto 8) <= sr_out;

	-- Move filter output to onto SPI
	output_shiftreg <= std_logic_vector(fi_filtsum_to_output(y_m));

	-- Move SPI byte onto filter input 
	x_n <= to_fi_7Q8(to_integer(signed(input_shiftreg)),'0');

	-- Move the SPI incoming byte to the rx shiftreg
	-- rx_sr_in <= input_shiftreg;

	-- sr_in <= input_shiftreg;
	-- output_shiftreg <= sr_out;
	
	-- byte(0) <= not tx_empty;
	-- byte(1) <= not tx_mode_active;
	-- byte(2) <= not in_data_ready;
	-- byte(3) <= not sr_read_en;
	
	-- SPI Rx
	SPI_Rx : process (clk)
	begin

		if rising_edge(clk) then
			-- If data is available from the SPI Module, in_data_ready will be high
			if in_data_ready = '1' AND pfb_wr_ready ='1' then 
				pfb_wr_en <= '1';
				indicate_read <= '1';
			else
				pfb_wr_en <= '0';
				indicate_read <= '0';
			end if;

		elsif falling_edge(clk) then
		end if;
	end process;

	-- SPI Tx
	SPI_Tx : process(clk)
	begin
		if rising_edge(clk) then
			-- IF SPI is waiting to send then tx_empty will be high
			-- If pfb has data waiting data pfb_rd_ready will be high
			if tx_empty = '1' AND pfb_rd_ready = '1' then
				-- Next output has been loaded asynchronously,
				-- we just need to indicate we are ready to tx
				out_data_ready <= '1';

				pfb_rd_en <= '1';
			else
				out_data_ready <= '0';
				pfb_rd_en <= '0';
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

	-- sck_div : process(indicate_read)
	-- begin
	-- 	if rising_edge(indicate_read) then
	-- 	 	filt_clk <= NOT filt_clk;
	-- 	end if;
	-- end process;


end architecture;
		