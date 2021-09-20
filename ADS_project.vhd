-- library IEEE;
-- use IEEE.std_logic_1164.all;
-- use work.filter_types.all;

-- entity ADS_project is 
-- 	port(
-- 		miso: out std_logic;
-- 		mosi: in std_logic;
-- 		cs: in std_logic;
-- 		sck: in std_logic;
		
-- 		clk: in std_logic;
		
-- 		seg_select: out std_logic_vector(3 downto 0);
-- 		segments: out std_logic_vector(7 downto 0);
		
-- 		vals: out std_logic_vector(3 downto 0)
		
-- 	);
-- end entity;

-- architecture ADS of ADS_project is
-- 	component seven_seg_display is
-- 		port( clk : in std_logic;
-- 				num : in std_logic_vector(15 downto 0);
-- 				dig: out std_logic_vector(3 downto 0);
-- 				seg: out std_logic_vector(7 downto 0));
-- 	end component;
	
-- 	component counter
-- 	PORT
-- 		(
-- 			clock		: IN STD_LOGIC ;
-- 			q		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0)
-- 		);
-- 	end component;
	
-- 	component SPI_module is
-- 		generic(
-- 			frame_size: positive := 8
-- 		);
-- 		port(
-- 		clk: in std_logic;
-- 		sck: in std_logic;
-- 		mosi: in std_logic;
-- 		miso: out std_logic;
-- 		cs: in std_logic;
-- 		input_shiftreg: out std_logic_vector(7 downto 0);
-- 		output_shiftreg: in std_logic_vector(7 downto 0);
-- 		out_data_ready: in std_logic;
-- 		in_data_ready: out std_logic;
-- 		tx_empty: out std_logic
-- 		);
-- 	end component;
	
-- 	component FIFO is 
-- 		generic(data_width: positive := 8;
-- 				  depth: positive);
-- 		port(fifo_in : in std_logic_vector(data_width-1 downto 0);
-- 			  fifo_out: out std_logic_vector(data_width-1 downto 0);
-- 			  clk     : in std_logic;
-- 			  read_en : in std_logic;
-- 			  write_en: in std_logic;
-- 			  is_full : out std_logic;
-- 			  is_empty: out std_logic);
-- 	end component;
	
-- 	component shift_register is
-- 		generic(data_width: positive := 8;
-- 			  depth: positive);
-- 		port(sr_in : in std_logic_vector(data_width-1 downto 0);
-- 			  sr_out: out std_logic_vector(data_width-1 downto 0);
-- 			  data: out std_logic_vector(data_width*depth-1 downto 0);
-- 			  clk     : in std_logic := '0';
-- 			  read_en: in std_logic := '0';
-- 			  write_en: in std_logic := '0';
-- 			  is_full : out std_logic;
-- 			  is_empty: out std_logic
-- 			  );
-- 	end component;
	
-- 	component leds is
-- 		port( BYTE : in std_logic_vector(7 downto 0);
-- 			CLK : in std_logic;
-- 			VALS : out std_logic_vector(3 downto 0) );
-- 	end component;
	
-- 	component PFB is
-- 		generic(
-- 			dataWidth: integer := 8;
-- 			phaseCount: integer;
-- 			tapCount: integer
-- 		);
-- 		port (
-- 			x_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
-- 			h_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
-- 			y_k : out int_arr(0 to phaseCount-1)(dataWidth-1 downto 0)
-- 		);
-- 	end component;
	
-- 	component PFB2 is
-- 		generic(
-- 			dataWidth: integer := 8;
-- 			phaseCount: integer;
-- 			tapCount: integer
-- 		);
-- 		port (
-- 			x_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
-- 			h_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
-- 			clk: in std_logic;
-- 			y_k : out int_arr(0 to phaseCount-1)(dataWidth-1 downto 0)
-- 		);
-- 	end component;

	
-- 	signal q: std_logic_vector(25 downto 0);
	
-- 	signal display_num: std_logic_vector(15 downto 0);
-- 	signal display_clk: std_logic;
	
-- 	signal input_shiftreg: std_logic_vector(7 downto 0);
-- 	signal output_shiftreg: std_logic_vector(7 downto 0) := "00000000";
-- 	signal out_data_ready: std_logic := '0';
-- 	signal in_data_ready: std_logic := '0';
-- 	signal tx_empty: std_logic;
	
-- 	signal prev_data_ready: std_logic := '0';
	
-- 	constant DATA_DEPTH : integer := 4;
-- 	constant DATA_WIDTH : integer := 8;
	
-- 	signal sr_in: std_logic_vector(DATA_WIDTH-1 downto 0);
-- 	signal sr_out: std_logic_vector(DATA_WIDTH-1 downto 0);
-- 	signal sr_data: std_logic_vector(DATA_WIDTH*DATA_DEPTH-1 downto 0);
-- 	signal sr_clk: std_logic;
-- 	signal sr_read_en: std_logic := '0';
-- 	signal sr_write_en: std_logic := '1';
-- 	signal sr_is_full: std_logic;
-- 	signal sr_is_empty: std_logic;
	
-- 	signal tx_mode_active: std_logic := '0';
	
-- 	signal byte: std_logic_vector(7 downto 0);
-- 	signal led_clk: std_logic := '0';
	
-- 	constant phaseCount: integer := 3;
-- 	constant tapCount: integer := 4;
-- 	signal x_n: int_arr(0 to phaseCount*tapCount-1)(7 downto 0);
-- 	signal h_n: int_arr(0 to phaseCount*tapCount-1)(7 downto 0);
-- 	signal y_k : int_arr(0 to phaseCount-1)(7 downto 0);
-- begin
-- 	display: seven_seg_display port map(display_clk, display_num, seg_select, segments);
-- 	clocking: counter port map(clk, q);
-- 	spi: SPI_module port map (clk, sck, mosi, miso, cs, input_shiftreg, output_shiftreg, out_data_ready, in_data_ready, tx_empty);
-- 	--mem: FIFO generic map (8, 4) port map (fifo_in, fifo_out, fifo_clk, read_en, write_en, is_full, is_empty);
-- 	mem:  shift_register generic map (DATA_WIDTH, DATA_DEPTH) port map (sr_in, sr_out, sr_data, sr_clk, sr_read_en, sr_write_en, sr_is_full, sr_is_empty);
-- 	filter: pfb generic map (8, phaseCount,  tapCount) port map(x_n, h_n, y_k);
-- 	filter2: pfb2 generic map (8, phaseCount, tapCount) port map(x_n, h_n, clk);
-- 	led_bar: leds port map (byte, led_clk, vals);
-- 	display_clk <= q(16);
	
-- 	display_num(15 downto 0) <= sr_data(15 downto 0);
	
-- 	sr_in <= input_shiftreg;
	
-- --	sr_read_en <= '0';
-- --	sr_write_en <= '1';
	
	
-- 	output_shiftreg <= sr_out;
	
-- 	byte(0) <= not tx_empty;
-- 	byte(1) <= not tx_mode_active;
-- 	byte(2) <= not out_data_ready;--sr_is_empty;
-- 	byte(3) <= not sr_read_en;--sr_clk;
	
-- 	check_end_tx: process(clk)
-- 	begin
-- 	if rising_edge(clk) then
-- 		if tx_mode_active = '0' then
-- 			if in_data_ready = '1' then
-- 				sr_clk <= '1';
-- 			else
-- 				sr_clk <= '0';
-- 			end if;
-- 		else
-- 			if out_data_ready = '1' and tx_empty = '1' then
-- 				sr_clk <= '1';
-- 			else
-- 				sr_clk <= '0';
-- 			end if;
-- 		end if;
		
-- 	elsif falling_edge(clk) then
-- 		-- If just received a 0xFF
-- 		if sr_out = "11111111" and in_data_ready = '1' then
-- 			-- Toggle RW mode
-- 			if tx_mode_active = '0' then
-- 				sr_read_en <= '1';
-- 				sr_write_en <= '0';
-- 				tx_mode_active <= '1';
-- --			elsif tx_mode_active ='1' then
-- --				sr_read_en <= '0';
-- --				sr_write_en <= '1';
-- --				tx_mode_active <= '0';
-- 			end if;
-- 		end if;
		
-- 		if in_data_ready = '1' then
-- 			prev_data_ready <= '1';
-- 		elsif in_data_ready = '0' then
-- 			prev_data_ready <= '0';
-- 		end if;
										
-- 		if tx_mode_active = '1' and tx_empty = '1' then
-- 			out_data_ready <= '1';
-- 		else
-- 			out_data_ready <= '0';
-- 		end if;
-- 	end if;
-- 	end process;

-- end architecture;
		