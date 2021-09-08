
library std;
use std.env.all;
use std.textio.all;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.


use work.types.all;

entity fir_tb is 

end fir_tb;

architecture top of fir_tb is

	 -- Instantiate our filter
	 component fir_basic is 
	 port(
				clk:	in std_logic;
				x_in:	in signed (data_width-1 downto 0);
--            h_in:	in coefficient_array;
				y_out:	out signed (data_width*2-1 downto 0) 
		  );
	 end component;
	 
	-- Prepare a signal
	signal x_tb: signed(data_width-1 downto 0) := to_signed(1,data_width); -- signed value of 1
	-- Prep an output signal, for viewing
	signal y_tb: signed (data_width*2-1 downto 0) := to_signed(0,data_width*2);
	
	-- Also make a clock signal to clk our filter with
	signal clk_tb: std_logic := '0';

begin 
	-- Port map the filter
	fir_1: fir_basic port map (clk_tb,x_tb,y_tb);
	
	main_test: process is 
		
		begin
			-- Lets put in 16 1's and watch the output
			
			for i in 0 to 15 loop
				-- Sample input does not change, we simply clock the circuit 16 times
				
				clk_tb <= '1';
				wait for 20 ps;
				clk_tb <= '0';
				wait for 20 ps;
				
			end loop;
			
			
			report LF
				& "SUCCESS!" & LF
				& "----------------"
				severity note;

		-- Stop the simulation
--		stop;
		
	end process;
	
end top;

