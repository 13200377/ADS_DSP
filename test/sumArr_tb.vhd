library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.filter_types.all;

entity sumArr_tb is
end entity;

architecture sumArr_test of sumArr_tb is
	component sumArr is
		generic(
			dataWidth: integer := 8;
			arrSize: integer:= 1
		);
		port(
			arr : in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
			numOut : out signed(dataWidth-1 downto 0)
		);
	end component;

	constant dataWidth: integer := 16;
	constant arrSize: integer := 3;
	constant arr1: int_arr := (to_signed(-3005,dataWidth), to_signed(1922,dataWidth), to_signed(-36,dataWidth));
	constant sum1: signed(dataWidth-1 downto 0) := to_signed(-1119,dataWidth);
	
	signal arr : int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
	signal numOut: signed(dataWidth-1 downto 0);
begin
	sum: sumArr generic map (dataWidth, arrSize) port map (arr, numOut);
	
	p_main_test:
	process is
	begin
		arr <= arr1;
		
		wait for 10 ps;
		
		if numOut /= sum1 then
			report LF
			  & "FAIL!" & LF
			  & "in_data_ready failed to assert" & LF
			  & "----------------"
			  severity failure;
		end if;	
		
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;

		-- Stop the simulation
		stop;
	end process;
end architecture;