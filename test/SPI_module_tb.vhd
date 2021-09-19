library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SPI_module_tb is
end entity;

architecture test of SPI_module_tb is
	component SPI_module is 
		generic(
			frame_size: positive := 8
		);
		port (
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
			tx_empty: out std_logic := '1'
		);
	end component;
	
	signal global_clk : std_logic := '0';
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
	SPI: SPI_module port map (global_clk, sck, mosi, miso, cs, 
											input_shiftreg, output_shiftreg, out_data_ready,
											in_data_ready, indicate_read, tx_empty);
	-- Clock generation
	-- This runs in parallel with the p_main_test
	p_clock : process is
	begin
		wait for CLK_PERIOD/2;
		global_clk <= not global_clk;
	end process p_clock;

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
	begin
		--------------
		-- test MOSI
		--------------
		
		-- In this test the testbench acts as a master transmitting to the slave
		
		wait for CLK_PERIOD*4;

		-- cycle through different test values
		while tx_val <= 255 loop
			tx_signal := std_logic_vector(tx_val); -- convert tx_val to logic vector
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
			
			cs <='1';
			
			wait for CLK_PERIOD*4;
			
			-- Check the module is indicating data has been received
			if in_data_ready = '0' then
				report LF
				  & "FAIL!" & LF
				  & "in_data_ready failed to assert" & LF
				  & "----------------"
				  severity failure;
			end if;
						
			-- Check the data received is correct
			if reverse_vector(input_shiftreg(7 downto 0)) /= tx_signal(7 downto 0) then
				report LF
				  & "FAIL!" & LF
				  & "input_shiftreg has incorrect value" & LF
				  & "----------------"
				  severity failure;
			end if;
			
			-- Now indicate we have read this value
			indicate_read <= '1';
			
			wait for CLK_PERIOD*2;
			
			indicate_read <= '0';
			

			wait for CLK_PERIOD*8;
			
			if tx_val = 255 then -- We need this condition because of integer wrap
				exit;
			end if;
			
			tx_val := tx_val + 1;
		end loop;
		
		--------------
		-- test MISO
		--------------
		
		
		while rx_val <= 255 loop
			wait for CLK_PERIOD*2;
			-- Load data in to SPI
			rx_signal := std_logic_vector(rx_val); -- convert incrementer to logic vector
			output_shiftreg <= rx_signal;
			
			wait for CLK_PERIOD*2;
			out_data_ready <= '1'; -- Indicate data is ready
			wait for CLK_PERIOD*2; -- Wait to load data into internal register
			out_data_ready <= '0';
			
			wait for CLK_PERIOD*2;
			cs <= '0';
			wait for CLK_PERIOD*4;
			
			-- We now test each bit output from the module
			-- to ensure it is the value we expect
			bit_count := 7;
			while bit_count >= 0 loop
				sck <= '1';
				wait for SCK_PERIOD/2;
				
				-- Check miso pin has correct value
				if miso /= rx_signal(bit_count) then
					report LF
					  & "FAIL!" & LF
					  & "miso has incorrect value" & LF
					  & "----------------"
					  severity failure;
				end if;
				
				sck<='0';
				wait for SCK_PERIOD/2;
				
				
				if bit_count = 0 then
					exit;
				end if;
				bit_count := bit_count - 1;
			end loop;
			
			wait for CLK_PERIOD*4;
			cs <= '1';
			
			if rx_val = 255 then
				exit;
			end if;
			
			rx_val := rx_val + 1;
		end loop;
		
		
		-- Success
		
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;

		-- Stop the simulation
		stop;

	end process p_main_test;

end architecture test; -- of tb_ssd_decoder