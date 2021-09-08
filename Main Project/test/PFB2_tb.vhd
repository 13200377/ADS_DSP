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
	constant numTests: integer := 2;
	
	function int(num: integer) return signed is
	begin
        return to_signed(num, dataWidth);
	end function;
	 
	constant test_x : test_data_arr(0 to numTests-1)(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0)
						 := (
								(int(1), int(1), int(1), 
								 int(1), int(1), int(1), 
								 int(1), int(1), int(1), 
								 int(1), int(1), int(1) ),
								 
								 (int(-234), int(322), int(-234), 
								  int(933), int(-259), int(325), 
								  int(-135), int(310), int(241),  
								  int(232), int(324), int(241))
							 );
							  
	constant test_h : test_data_arr(0 to numTests-1)(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0)
						 := (
								(int(1), int(2), int(4), 
								 int(8), int(16), int(32),
								 int(64),  int(128), int(256), 
								 int(512),  int(1024),  int(2048)),
								 
								 (int(-23), int(32), int(-41), 
								  int(23), int(-29), int(35), 
								  int(-51), int(34), int(31),  
								  int(22), int(-31), int(41))
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
		variable p1: signed(dataWidth*2-1 downto 0);
		variable p2: signed(dataWidth*2-1 downto 0);
		variable p3: signed(dataWidth*2-1 downto 0);
	begin
--		file_open(input_buf, "PFB_test1.csv", read_mode);
--		readline(input_buf, file_row);
		
		for test_num in 0 to numTests-1 loop
			h_n <= test_h(test_num);
			
			wait for 10 ps;
			
			for i in 0 to phasecount*tapCount-1 loop
				-- load values for x
				for j in 0 to i loop
					x_n(i-j) <= test_x(test_num)(j);
				end loop;
			
				clk <= '1';
				
				wait for 20 ps;
				
				clk <= '0';
				
				wait for 20 ps;
				
			end loop;
			
--			p1 := x_n(0)*h_n(0) + x_n(3)*h_n(3) + x_n(6)*h_n(6) + x_n(9)*h_n(9);
--			if y_k(0) /= p1(dataWidth-1 downto 0) then
--				report LF
--			  & "FAIL!" & LF
--			  & "Unexpected output value" & LF
--			  & "----------------"
--			  severity failure;
--			end if;
--			
--			p2 := x_n(1)*h_n(1) + x_n(4)*h_n(4) + x_n(7)*h_n(7) + x_n(10)*h_n(10);
--			if y_k(1) /= p2(dataWidth-1 downto 0) then
--				report LF
--			  & "FAIL!" & LF
--			  & "Unexpected output value" & LF
--			  & "----------------"
--			  severity failure;
--			end if;
--			
--			p3 := x_n(2)*h_n(2) + x_n(5)*h_n(5) + x_n(8)*h_n(8) + x_n(11)*h_n(11);
--			if y_k(2) /= p3(dataWidth-1 downto 0) then
--				report LF
--			  & "FAIL!" & LF
--			  & "Unexpected output value" & LF
--			  & "----------------"
--			  severity failure;
--			end if;
			
			wait for 10 ps;
			
		end loop;
		
		
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;

		-- Stop the simulation
		stop;
	end process;
end architecture;