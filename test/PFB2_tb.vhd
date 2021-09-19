library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.filter_types.all;

package test_types is
	type test_data_arr is array (natural range <>) of int_arr;
end package;

library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.test_types.all;

entity PFB2_tb is
end entity;

architecture pfb2_test of PFB2_tb is
	component PFB2 is
		generic(
			dataWidth: integer := 8;
			phaseCount: integer;
			tapCount: integer
		);
		port (
			x_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
			h_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
			clk: in std_logic;
			y_k : out int_arr(0 to phaseCount-1)(dataWidth-1 downto 0)
		);
	end component;
	
	constant dataWidth: integer := 16;
	constant phaseCount: integer := 3;
	constant tapCount: integer := 4;
	constant filterOrder: integer := phaseCount * tapCount;
	constant numSamples: integer := 24;
	
	function int(num: integer) return signed is
	begin
        return to_signed(num, dataWidth);
	end function;
	 
	constant test_x : int_arr(0 to numSamples-1)(dataWidth-1 downto 0)
						 := (
								int(1), int(1), int(1), 
								 int(1), int(1), int(1), 
								 int(1), int(1), int(1), 
								 int(1), int(1), int(1),
								 
								  int(-2), int(2), int(-4), 
								  int(3),  int(-9),int(5), 
								  int(-5), int(3), int(4),  
								  int(2),  int(4), int(2)
							 );
							  
	constant test_h : int_arr(0 to filterOrder-1)(dataWidth-1 downto 0)
						 := (
								int(1), int(2), int(4), 
								 int(8), int(16), int(32),
								 int(64),  int(128), int(256), 
								 int(512),  int(1024),  int(2048)
								 
--								 (int(-23), int(32), int(-41), 
--								  int(23), int(-29), int(35), 
--								  int(-51), int(34), int(31),  
--								  int(22), int(-31), int(41))
							 );
							 
--	constant test_y : test_data_arr(0 to numTests-1)(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0)
--						 := (
--								(int(-23431), int(323410), int(-323234), int(20220),
--								 int(-1842),  int(59834),  int(-4932),   int(-2342),
--								 int(-33240), int(33202),  int(-23394),  int(-13203)),
--								 
--								 (int(-234), int(324312), int(-23141), int(91323),
--								  int(-25189), int(32115), int(-13151), int(3410),
--								  int(23141),  int(231052), int(-32401), int(23141))
--							 );
	
	signal x_n : int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
	signal h_n : int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
	signal y_k : int_arr(0 to phaseCount-1)(dataWidth-1 downto 0);
	
	signal clk: std_logic := '0';
	
--	file input_buf: text;
--	variable file_row: line;
begin
	sum: pfb2 generic map (dataWidth, phaseCount, tapCount) port map (x_n, h_n, clk, y_k);
	
	p_main_test:
	process is
		variable startIndex: integer;
		variable phaseIndex: integer;
		variable prevSampleNum: integer;
		variable expectedTapSum: integer;
	begin
		h_n <= test_h;
		
		wait for 20 ps;
		
		for sample_num in 0 to numSamples-1 loop
			
			-- Once we have enough samples for valid data
			-- The lowest phase fills up at tapCount*(phaseCount-1) + 1 samples
			-- this equals an index of tapCount*(phaseCount-1) 
			-- we perform this test a full clock cycle after it is entered though,
			-- so we check tapCount*(phaseCount-1) + 1
			if sample_num >= phaseCount*(tapCount-1) + 1 then
				prevSampleNum := sample_Num - 1;
				phaseIndex := phaseCount  - (prevSampleNum mod phaseCount) - 1;
				expectedTapSum := 0;
				for tapNum in 0 to tapCount - 1 loop
					expectedTapSum := expectedTapSum + to_integer(x_n(phaseCount*tapNum)*h_n(phaseCount*tapNum + phaseIndex));
				end loop;
				if expectedTapSum /= y_k(phaseIndex) then
					report LF
				  & "FAIL!" & LF
				  & "Unexpected phase output" & LF
				  & "----------------"
				  severity failure;
				end if;
			end if;
			
			-- place test_x
			startIndex := sample_num-filterOrder+1;
			for j in startIndex to sample_num loop
				if j >= 0 then
					x_n(sample_num-j) <= test_x(j);
				end if;
			end loop;
			
			clk <= '1';
			
			wait for 20 ps;
			
			clk <= '0';
			
			wait for 20 ps;
				
			
		end loop;
		
		
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;

		-- Stop the simulation
		stop;
	end process;
end architecture;