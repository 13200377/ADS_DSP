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
	generic(
        sampleWidth: integer;
		coeffWidth: integer;
		phaseCount: integer;
		tapCount: integer
    );
    port (
		x_n : in int_arr(0 to phaseCount*tapCount-1)(sampleWidth-1 downto 0);
		h_n : in int_arr(0 to phaseCount*tapCount-1)(coeffWidth-1 downto 0);
		clk: in std_logic;
		y_m : out signed(sampleWidth+coeffWidth-1 downto 0)
    );
	end component;

	-- declare Filter parameters 
	constant sampleWidth: integer := 8;
	constant coeffWidth: integer := 16;
	constant phaseCount: integer := 4;
	constant tapCount: integer := 3;
	constant filterOrder: integer := phaseCount * tapCount;
	constant numSamples: integer := 24;

	function int(num: integer; bit_count: integer) return signed is
		begin
			return to_signed(num, bit_count);
		end function;
		
		-- create a synthetic signal input
		constant test_h : int_arr(0 to filterOrder-1)(coeffWidth-1 downto 0)
		:= (
			int(1,coeffWidth), int(2,coeffWidth), int(4,coeffWidth), 
			int(8,coeffWidth), int(16,coeffWidth), int(32,coeffWidth),
			int(64,coeffWidth),  int(128,coeffWidth), int(256,coeffWidth),
			int(512,coeffWidth),  int(1024,coeffWidth),  int(2048,coeffWidth)
			
			-- int(1), int(1), int(1), 
			-- int(1),  int(1),int(1), 
			-- int(1), int(1), int(1),  
			-- int(1),  int(1), int(1)
			);
			
		-- create filter coefficients
		constant test_x : int_arr(0 to numSamples-1)(sampleWidth-1 downto 0)
						:= (
							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
							int(1,sampleWidth), int(-1,sampleWidth), int(1,sampleWidth), 
							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth),

							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth), 
							int(1,sampleWidth), int(1,sampleWidth), int(1,sampleWidth)
							);
	-- Create signals for data io to filter
	signal x_n : int_arr(0 to phaseCount*tapCount-1)(sampleWidth-1 downto 0);
	signal h_n : int_arr(0 to phaseCount*tapCount-1)(coeffWidth-1 downto 0);
	signal y_k : signed(sampleWidth+coeffWidth-1 downto 0);

	signal clk: std_logic := '0';

	begin
		-- Instantiate filter
		fir_filt: Polyphase_decimator generic map (sampleWidth, coeffWidth, phaseCount,tapCount) port map (x_n, h_n, clk, y_k);

		p_main_test: 
		process is
			variable startIndex: integer;
			variable phase: integer;

		begin
			h_n <= test_h;
			wait for 20 ps;

			for sample_num in 0 to numSamples-1 loop
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
