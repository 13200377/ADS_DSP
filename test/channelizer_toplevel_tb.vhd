library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.env.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.


use work.filter_types.all;


entity TOP_TEST is
end entity;

architecture test of TOP_TEST is
	component ADS_project is
        port(
            miso: out std_logic;
            mosi: in std_logic;
            cs: in std_logic;
            sck: in std_logic;
            
            clk_50MHz: in std_logic;
			clk_16MHz: in std_logic

            -- seg_select: out std_logic_vector(3 downto 0);
            -- segments: out std_logic_vector(7 downto 0);
            
            -- vals: out std_logic_vector(3 downto 0)
            
        );
        end component;
	
	signal global_clk : std_logic := '0';
	signal slow_clk : std_logic := '0';
	signal sck: std_logic := '0';
	signal mosi: std_logic := '0';
	signal miso: std_logic;
	signal cs: std_logic := '1';
	signal input_shiftreg: std_logic_vector(7 downto 0);
	signal output_shiftreg: std_logic_vector(7 downto 0);
	signal out_data_ready: std_logic := '0';
	signal in_data_ready: std_logic;
	signal indicate_read: std_logic := '0';
	signal tx_empty: std_logic;
	
	constant CLK_PERIOD: time := 20 ps;  -- 50MHz
	constant SCK_PERIOD: time := 200 ps; -- 5MHz

	constant SLOW_PERIOD: time := 6 ns;

	constant MAX_PROCESSING_TIME: integer := 100; -- maximum number of cycles for output to be received

	file input_re_file : text;
	file input_im_file : text;
	file expected_re_file : text;
	file expected_im_file : text;
	
	
	constant input_data_size: integer := 64; -- Input enough data to gain one set of outputs
	constant expected_data_size: integer := 128;
			
	
	function reverse_vector(a: in std_logic_vector)
	return std_logic_vector is
		variable result: std_logic_Vector(a'RANGE);
		alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
		begin
			for i in aa'RANGE loop
				result(i) := aa(i);
			end loop;
		return result;
	end;
begin
	-- SPI: SPI_module port map (global_clk, sck, mosi, miso, cs, 
	-- 										input_shiftreg, output_shiftreg, out_data_ready,
	-- 										in_data_ready, indicate_read, tx_empty);
    ADS: ADS_project port map(miso,mosi,cs,sck,global_clk,global_clk);
	-- Clock generation
	-- This runs in parallel with the p_main_test
	p_clock : process is
	begin
		wait for CLK_PERIOD/2;
		global_clk <= not global_clk;
	end process p_clock;

	slow_clock : process is
	begin
		wait for SLOW_PERIOD/2;
		slow_clk <= NOT slow_clk;
	end process;

	-- Main test process
	p_main_test : process is
		variable test_success: boolean := true;
		
		-- tx_val is the test number we will use for MOSI
		variable tx_val: unsigned(7 downto 0) := to_unsigned(0,8);
		-- tx_signal is tx_val, but as a logic vector
		variable tx_signal: std_logic_vector(7 downto 0);
		-- bit count is which bit we are up to in the byte (technically data frame)
		variable bit_count: integer := 0;
		
		-- rx_val is the test number we will use for MISO
		variable rx_val: unsigned(7 downto 0) := to_unsigned(0,8);
		-- rx_signal is rx_val as a logic vector
		variable rx_signal: std_logic_vector(7 downto 0);

		-- File variables
		variable f_in_line : line;
		variable f_in_int  : integer;
		variable f_exp_line: line;
		variable f_exp_int : integer;
		
		-- Test variables
		variable input_re: integer_arr(0 to input_data_size-1);
		variable input_im: integer_arr(0 to input_data_size-1);
		variable expected_re: integer_arr(0 to expected_data_size-1);
		variable expected_im: integer_arr(0 to expected_data_size-1);

	begin

			--------------------
		-- FIle loading
		--------------------
		file_open(input_re_file, "filtIn_re.dat", read_mode);
		
		
		for input_index in 0 to input_data_size-1 loop
			if not endfile(input_re_file) then
				readline(input_re_file, f_in_line);
				read(f_in_line, input_re(input_index));
			else
				-- If end of file has been reached before all data is loaded
				-- throw error
				report LF
				  & "FAIL!" & LF
				  & "not enough data inside filtIn_re.dat" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		
		file_open(input_im_file, "filtIn_im.dat", read_mode);
		for input_index in 0 to input_data_size-1 loop
			if not endfile(input_im_file) then
				readline(input_im_file, f_in_line);
				read(f_in_line, input_im(input_index));
			else
				-- If end of file has been reached before all data is loaded
				-- throw error
				report LF
				  & "FAIL!" & LF
				  & "not enough data inside filtIn_im.dat" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		
		-- Load expected value into array
		file_open(expected_re_file, "fftOut_re_expected.dat", read_mode);
		for expected_index in 0 to expected_data_size-1 loop
			if not endfile(expected_re_file) then
				readline(expected_re_file, f_exp_line);
				read(f_exp_line, expected_re(expected_index));
			else
				-- If end of file has been reached before all data is loaded
				-- throw error
				report LF
				  & "FAIL!" & LF
				  & "not enough data inside fftOut_re_expected.dat" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		
		-- Load expected value into array
		file_open(expected_im_file, "fftOut_im_expected.dat", read_mode);
		for expected_index in 0 to expected_data_size-1 loop
			if not endfile(expected_im_file) then
				readline(expected_im_file, f_exp_line);
				read(f_exp_line, expected_im(expected_index));
			else
				-- If end of file has been reached before all data is loaded
				-- throw error
				report LF
				  & "FAIL!" & LF
				  & "not enough data inside fftOut_im_expected.dat" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		
		
		
		-----------------------------
		

		--------------
		-- test MOSI
		--------------
		
		wait for CLK_PERIOD*8;
		-- In this test the testbench acts as a master transmitting to the slave
		cs <='1';
		wait for CLK_PERIOD*8;

		-- cycle through different test values
		for test_index in 0 to 63 loop
			-- Send a real value
			tx_signal := reverse_vector(std_logic_vector(to_signed(input_re(test_index),8))); -- convert test_index to logic vector
			cs <= '0';
			wait for CLK_PERIOD*8;
			-- begin transmitting bits
			bit_count := 0;
			while bit_count < 8 loop
				mosi <= tx_signal(bit_count);
				wait for SCK_PERIOD/2;
				sck <='1';
				wait for SCK_PERIOD/2;
				sck <= '0';
				if bit_count = 7 then
					exit;
				end if;
				bit_count := bit_count + 1;
			end loop;
			wait for CLK_PERIOD*8;
			-- Send an imaginary value
			tx_signal := reverse_vector(std_logic_vector(to_signed(input_im(test_index),8))); -- convert test_index to logic vector
			cs <= '0';
			wait for CLK_PERIOD*8;
			-- begin transmitting bits
			bit_count := 0;
			while bit_count < 8 loop
				mosi <= tx_signal(bit_count);
				wait for SCK_PERIOD/2;
				sck <='1';
				wait for SCK_PERIOD/2;
				sck <= '0';
				if bit_count = 7 then
					exit;
				end if;
				bit_count := bit_count + 1;
			end loop;
			wait for CLK_PERIOD*8;
			
		end loop;

		-- =====
		-- LET the FFT Finish 
		-- =====
		for i in 0 to MAX_PROCESSING_TIME loop
			wait until rising_edge(global_clk);
		end loop;

		-- =====
		-- Send 8 more values
		-- =====
		for test_index in 0 to 7 loop
			-- Send a real value
			tx_signal := reverse_vector(std_logic_vector(to_signed(input_re(test_index),8))); -- convert test_index to logic vector
			cs <= '0';
			wait for CLK_PERIOD*8;
			-- begin transmitting bits
			bit_count := 0;
			while bit_count < 8 loop
				mosi <= tx_signal(bit_count);
				wait for SCK_PERIOD/2;
				sck <='1';
				wait for SCK_PERIOD/2;
				sck <= '0';
				if bit_count = 7 then
					exit;
				end if;
				bit_count := bit_count + 1;
			end loop;
			wait for CLK_PERIOD*8;
			-- Send an imaginary value
			tx_signal := reverse_vector(std_logic_vector(to_signed(input_im(test_index),8))); -- convert test_index to logic vector
			cs <= '0';
			wait for CLK_PERIOD*8;
			-- begin transmitting bits
			bit_count := 0;
			while bit_count < 8 loop
				mosi <= tx_signal(bit_count);
				wait for SCK_PERIOD/2;
				sck <='1';
				wait for SCK_PERIOD/2;
				sck <= '0';
				if bit_count = 7 then
					exit;
				end if;
				bit_count := bit_count + 1;
			end loop;
			wait for CLK_PERIOD*8;
			
		end loop;

		for i in 0 to MAX_PROCESSING_TIME loop
			wait until rising_edge(global_clk);
		end loop;

	end process p_main_test;

end architecture test; -- of tb_ssd_decoder