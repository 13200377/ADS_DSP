library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.filter_types.all;
use work.filterdef.all;

package test_types is
	type integer_arr is array (natural range <>) of integer;
	type arr_integer_arr is array (natural range <>) of integer_arr;
	type test_input_arr is array (natural range <>) of tapped_delay_line;
	type test_output_arr is array (natural range <>) of pfb_output_arr;
end package;

library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.filterdef.all;
use work.test_types.all;

entity PFB3_tb is
end entity;

architecture pfb3_test of PFB3_tb is
	
	component PFB3 is
		port (
			clk: in std_logic;
			n_rst: in std_logic;
			
			x_n : in tapped_delay_line;
			write_en : in std_logic;
			write_ready: out std_logic := '1';
			
			y_k : out pfb_output_arr;
			read_en : in std_logic;
			read_ready: out std_logic := '0'
		);
	end component;
--	component PFB3 is 
--	port (
--		x_n : in tapped_delay_line;
--		clk: in std_logic;
--		y_k : out pfb_output_arr
--	);
--	end component;
--	
	function int(num: integer; bit_count: integer) return signed is
	begin
        return to_signed(num, bit_count);
	end function;
	 
	signal clk: std_logic := '0';
	signal n_rst: std_logic := '1';
	
	signal x_n : tapped_delay_line := (others => to_fi_7q8(0,'1'));
	signal write_en : std_logic := '0';
	signal write_ready: std_logic;
	
	signal y_k : pfb_output_arr;
	signal read_en : std_logic := '0';
	signal read_ready: std_logic;
	
	file x_file : text;
	file h_file : text;
	file expected_file : text;
	
	constant num_tests : integer := 2;
	
	constant CLK_PERIOD : time := 20 ps; -- 50MHz
	
begin
	pfb_module: pfb3 port map (clk, n_rst, x_n, write_en, write_ready, y_k, read_en, read_ready);
	--pfb_module: pfb3 port map (x_n, clk, y_k);
	
	clocking:
	process is
	begin
		wait for CLK_PERIOD/2;
		clk <= not clk;
	end process;
	
	p_main_test:
	process is
		-- File variables
		variable f_line : line;
		variable f_int  : integer;
		-- Test variables
		variable test_x : arr_integer_arr(0 to num_tests-1)(0 to filterOrder-1);
		variable dataIndex: integer := 0; --Index of current value in file
		variable testIndex: integer := 0;
		variable lineNum : integer := 0;
		
		variable startIndex: integer;
		variable phase: integer;
		--variable phaseIndex: integer;
		variable prevSampleNum: integer;
		variable expectedTapSum: integer;
		variable sampleCount : integer;
		
		variable testSum: integer;
		
		variable expectedOutput: integer_arr (0 to phaseCount-1);
	begin
		file_open(x_file, "PFB3_tb_x.dat", read_mode);
		file_open(h_file, "PFB3_tb_h.dat", read_mode);
		file_open(expected_file, "PFB3_tb_expected.dat", read_mode);
		
		while not endfile(x_file) loop
			readline(x_file, f_line);
			read(f_line, test_x(testIndex)(dataIndex));
			--test_data(dataIndex) := to_signed(f_int, dataWidth);
			dataIndex := dataIndex + 1;
			if dataIndex >= filterOrder then
				dataIndex := dataIndex - filterOrder;
				testIndex := testIndex + 1;
			end if;
			lineNum := lineNum + 1;
		end loop;
		
		
		
		for test_num in 0 to num_tests-1 loop
		
			
			
			for sample_num in 0 to filterOrder-1 loop
				wait until falling_edge(clk);
				write_en <= '1';
				read_en  <= '1';
				-- place test_x
				startIndex := sample_num-filterOrder+1;
				for j in startIndex to sample_num loop
					if j >= 0 then
						x_n(sample_num-j) <= to_fi_7q8(test_x(test_num)(j), '1');
					end if;
				end loop;
				
				wait until rising_edge(clk);
				
				-- Check output values
				if sampleCount mod tapCount = 0 and sampleCount >= phaseCount*(tapCount-1) + 1 then
					for phaseNum in 0 to phaseCount-1 loop
						testSum := 0;
						for tapNum in 0 to tapCount-1 loop
							testSum := testSum + to_integer(x_n(tapNum*phaseCount + phaseNum - filterOrder + sampleCount)*h_fi(tapNum*phaseCount + phaseNum));
						end loop;
						if to_fi_15Q16(testSum, '1') /= y_k(phaseNum) then
							report LF
							  & "FAIL!" & LF
							  & "output does not contain expected value" & LF
							  & "----------------"
							  severity failure;
						end if;
					end loop;
				end if;
				
				sampleCount := sampleCount + 1;
				
			end loop;
		
		end loop;
		
		
		
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;

		-- Stop the simulation
		stop;
	end process;
end architecture;