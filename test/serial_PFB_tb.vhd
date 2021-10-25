library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library std;
use std.env.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.filterDef.all;

entity serial_PFB_tb is
end entity;


architecture serial_FB_test of serial_PFB_tb is
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
	
	signal clk: std_logic := '0';
	signal n_rst: std_logic := '1';
	
	signal x_n: fi_7q8;
	signal write_en : std_logic := '0';
	signal write_ready: std_logic;
	
	signal y_k: fi_15Q16;
	signal read_en: std_logic := '0';
	signal read_ready: std_logic;
	
	constant CLK_PERIOD: time := 20 ps; -- 50MHz
	
	file input_file : text;
	file expected_file : text;
	
	
	constant input_data_size: integer := filterOrder; -- Input enough data to gain one set of outputs
	constant expected_data_size: integer := phaseCount;
	
	constant MAX_PROCESSING_TIME: integer := 20; -- maximum number of cycles for output to be received
	
begin
	s_PFB: serial_PFB port map (clk, n_rst, x_n, write_en, write_ready,
											 y_k, read_en, read_ready);
	
	clocking: process
	begin
		wait for CLK_PERIOD/2;
		clk <= not clk;
	end process;
	
	test: process
		-- File variables
		variable f_in_line : line;
		variable f_in_int  : integer;
		variable f_exp_line: line;
		variable f_exp_int : integer;
		
		-- Test variables
		variable input_data: integer_arr(0 to input_data_size-1);
		variable expected_data: integer_arr(0 to expected_data_size-1);
	begin
		-- Load input data into array
		file_open(input_file, "serial_PFB_input.dat", read_mode);
		
		
		for input_index in 0 to input_data_size-1 loop
			if not endfile(input_file) then
				readline(input_file, f_in_line);
				read(f_in_line, input_data(input_index));
			else
				-- If end of file has been reached before all data is loaded
				-- throw error
				report LF
				  & "FAIL!" & LF
				  & "not enough data inside serial_PFB_input.dat" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		
		-- Load expected value into array
		file_open(expected_file, "serial_PFB_expected.dat", read_mode);
		for expected_index in 0 to expected_data_size-1 loop
			if not endfile(expected_file) then
				readline(expected_file, f_exp_line);
				read(f_exp_line, expected_data(expected_index));
			else
				-- If end of file has been reached before all data is loaded
				-- throw error
				report LF
				  & "FAIL!" & LF
				  & "not enough data inside serial_PFB_expected.dat" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		
		
		-- Begin loading in data to s_PFB
		wait until falling_edge(clk);
		
		
		for test_index in 0 to input_data_size-1 loop
			wait until falling_edge(clk);
			write_en <= '1';
			x_n <= to_signed(input_data(test_index), 16);
			wait until rising_edge(clk);
		end loop;
		
		write_en <= '0';
		
		---------------
		-- Test read_ready gets asserted
		---------------
		for i in 0 to MAX_PROCESSING_TIME loop
			if read_ready = '1' then
				report LF
				  & "Time to process: " & integer'image(i) & " clock cycles" & LF
				  & "----------------"
				  severity note;
				exit;
			end if;
			wait until rising_edge(clk);
		end loop;
		
		if not read_ready = '1' then
			report LF
				  & "FAIL!" & LF
				  & "read_ready failed to assert within MAX_PROCESSING TIME" & LF
				  & "----------------"
				  severity failure;
				  
			stop;
		end if;
		
		--------------
		-- Ensure output values are correct
		--------------
		
		wait until falling_edge(clk);
		read_en <= '1';
		
		for output_index in 0 to expected_data_size-1 loop
			wait until rising_edge(clk);
			if y_k /= to_signed(expected_data(output_index), 16) then
				report LF
				  & "FAIL!" & LF
				  & "y_k contains an unexpected value" & LF
				  & "----------------"
				  severity failure;
			stop;
			end if;
		end loop;
		
		-------------
		-- Ensure read_ready resets
		-------------
		
		wait until rising_edge(clk);
		if read_ready /= '0' then 
			report LF
				  & "FAIL!" & LF
				  & "read_ready failed to reset after reading all outputs" & LF
				  & "----------------"
				  severity failure;
			stop;
		end if;
		----------------
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;	
		stop;
	end process;
end architecture;