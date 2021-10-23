-- The Polphase decimator instantiates a Polyphase Filter Bank PFB
-- and then sums the phase outputs into a single value y_k.
-- y_k will 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

entity Polyphase_decimator is
    port (
		x_n : in fi_7Q8;
		clk: in std_logic;
		y_m : out signed(sampleWidth-1 downto 0)
    );
end entity;


architecture fir of Polyphase_decimator is
	-- The polyphase Decimator consists of a PFB with all the outputs summed up using a summArr
	-- This will be equivalent to an FIR filter with downsampling
	component PFB3 is
		-- generic(
		-- 	sampleWidth: integer := 8;
		-- 	coeffWidth: integer := 8;
		-- 	phaseCount: integer;
		-- 	tapCount: integer
		-- );
		port (
			x_n : in tapped_delay_line;
			clk: in std_logic;
			y_k : out pfb_output_arr
		);
	end component;

	component sumArr is
		generic(
			dataWidth: integer := 8;
			arrSize: integer := 1
		);
		port(
			arr : in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
			numOut : out signed(dataWidth-1 downto 0)
		);
	end component;
	
	-- signal x_7Q8 : fi_7Q8;
	signal tdl : tapped_delay_line := (to_fi_7Q8(0,'1'),	to_fi_7Q8(0,'1'),
										to_fi_7Q8(0,'1'),	to_fi_7Q8(0,'1'),
										to_fi_7Q8(0,'1'),	to_fi_7Q8(0,'1'),
										to_fi_7Q8(0,'1'),	to_fi_7Q8(0,'1'),
										to_fi_7Q8(0,'1'),	to_fi_7Q8(0,'1'),
										to_fi_7Q8(0,'1'),	to_fi_7Q8(0,'1') );	

	signal filt_out : pfb_output_arr;
	signal filt_sum : signed(31 downto 0);

	begin 
	-- Create the PFB and map the outputs
	filter: PFB3 port map(tdl, clk, filt_out);
	-- Sum the outputs from each phase using sumArr
	firsum: sumArr generic map(32,phaseCount) port map (int_arr(filt_out), filt_sum);
	-- truncate the filter output here
	y_m <= fi_filtsum_to_output(filt_sum);
	
		shift_x :
		process (clk) is
			begin
			if rising_edge(clk) then
				-- Create a Q7.8 from the integer sample and put into tapped delay line
				tdl <= x_n & tdl(0 to filterOrder-2);
			end if;
		end process;

end architecture;