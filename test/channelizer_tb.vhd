library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library std;
use std.env.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.filterDef.all;

entity channelizer_tb is
end entity;


architecture channelizer_test of channelizer_tb is
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

	
	signal clk: std_logic := '0';
	signal n_rst: std_logic := '1';
	
	signal x_re: fi_7q8;
	signal x_im: fi_7q8;
	signal write_en : std_logic := '0';
	signal write_ready: std_logic;
	
	signal y_re: fi_7Q8;
	signal y_im: fi_7Q8;
	signal read_en: std_logic := '0';
	signal read_ready: std_logic;
	
	constant CLK_PERIOD: time := 20 ps; -- 50MHz
	
	file input_re_file : text;
	file input_im_file : text;
	file expected_re_file : text;
	file expected_im_file : text;
	
	
	constant input_data_size: integer := 64; -- Input enough data to gain one set of outputs
	constant expected_data_size: integer := 128;
	
	constant MAX_PROCESSING_TIME: integer := 500; -- maximum number of cycles for output to be received
	
	signal phase_sums: integer_arr(0 to phaseCount-1) := (others => 0);
begin
	chan: channelizer port map (clk, n_rst, x_re, x_im, write_ready, write_en,
											 y_re, y_im, read_ready, read_en);
	
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
		
		
		
		for i in 0 to phaseCount-1 loop
			for j in 0 to tapCount-1 loop
				phase_sums(i) <= phase_sums(i) + to_integer(h_fi(j*phaseCount + i))*expected_re(j*phaseCount + i);
			
			end loop;
			report LF & "phase " & integer'image(i) & " val " & integer'image(phase_sums(i)) &
			"------------------"
			severity note;
		end loop;
		
		
		
		---------------
		-- Begin loading in data to s_PFB
		wait until falling_edge(clk);
		
		
		for test_index in 0 to input_data_size-1 loop
			wait until falling_edge(clk);
			write_en <= '1';
			x_re <= to_fi_7Q8(input_re(test_index),'0');
			x_im <= to_fi_7Q8(input_im(test_index),'0');
	
			wait until rising_edge(clk);
		end loop;

		write_en <= '0';
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
--			if y_k /= to_signed(expected_data(output_index), 16) then
--				report LF
--				  & "FAIL!" & LF
--				  & "y_k contains an unexpected value" & LF
--				  & "----------------"
--				  severity failure;
--			stop;
--			end if;
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