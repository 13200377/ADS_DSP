library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.filter_types.all;

package test_types is
	type test_data_arr is array (natural range <>) of int_arr;
	type integer_arr is array (natural range <>) of integer;
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


entity Polyphase_decimator_tb is 
end entity;

architecture decimator_test of Polyphase_decimator_tb is
	-- declare the polyphase decimator
	component Polyphase_decimator
	-- generic(
    --     sampleWidth: integer;
	-- 	coeffWidth: integer;
	-- 	phaseCount: integer;
	-- 	tapCount: integer
    -- );
    port (
		x_n : in fi_7Q8;
		clk: in std_logic;
		y_m : out signed(sampleWidth-1 downto 0)
    );
	end component;

	-- declare Filter parameters 
	constant sampleWidth: integer := 8;
	constant coeffWidth: integer := 16;
	constant phaseCount: integer := 4;
	constant tapCount: integer := 3;
	constant filterOrder: integer := phaseCount * tapCount;
	constant numSamples: integer := 24;

	-- function int(num: integer; bit_count: integer) return signed is
	-- 	begin
	-- 		return to_integer(num, bit_count);
	-- 	end function;
		
			
		-- create signal 
	constant test_x : int_arr(0 to numSamples-1)(sampleWidth*2-1 downto 0)
					:= (
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), 
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), 
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), 
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'),

						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), 
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), 
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), 
						to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0'), to_fi_7Q8(4,'0')
						);
	-- Create signals for data io to filter
	signal x_n : fi_7Q8;
	signal y_k : signed(sampleWidth-1 downto 0);

	signal clk: std_logic := '0';

	begin
		-- Instantiate filter
		fir_filt: Polyphase_decimator port map (x_n, clk, y_k);

		p_main_test: 
		process is
			variable startIndex: integer;
			variable phase: integer;

			-- variable sampleNum : integer;

		begin
			
			wait for 20 ps;

			for sampleNum in 0 to numSamples-1 loop
				-- Next sample 
				x_n <= test_x(sampleNum);

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
