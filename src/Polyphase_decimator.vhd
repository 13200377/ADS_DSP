-- The Polphase decimator instantiates a Polyphase Filter Bank PFB
-- and then sums the phase outputs into a single value y_k.
-- y_k will 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

entity Polyphase_decimator is
    generic(
        sampleWidth: integer := 8;
		coeffWidth: integer := 16;
		phaseCount: integer;
		tapCount: integer
    );
    port (
		x_n : in int_arr(0 to phaseCount*tapCount-1)(sampleWidth-1 downto 0);
		h_n : in int_arr(0 to phaseCount*tapCount-1)(coeffWidth-1 downto 0);
		clk: in std_logic;
		y_m : out signed(sampleWidth+coeffWidth-1 downto 0)
    );
end entity;


architecture fir of Polyphase_decimator is
	-- The polyphase Decimator consists of a PFB with all the outputs summed up using a summArr
	-- This will be equivalent to an FIR filter with downsampling
	component PFB2 is
		generic(
			sampleWidth: integer := 8;
			coeffWidth: integer := 16;
			phaseCount: integer;
			tapCount: integer
		);
		port (
			x_n: 	in int_arr(0 to phaseCount*tapCount-1)(sampleWidth-1 downto 0);
			h_n:  	in int_arr(0 to phaseCount*tapCount-1)(coeffWidth-1 downto 0);
			clk:	in std_logic;
			y_k:	out int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0)
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

	signal filt_out : int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0);
	signal filt_sum : signed(sampleWidth+coeffWidth-1 downto 0);

	begin 
	    -- Create the PFB and map the outputs
		filter: PFB2 generic map (sampleWidth,coeffWidth,phaseCount,tapCount) port map(x_n, h_n, clk, filt_out);
		-- Sum the outputs from each phase using sumArr
		firsum: sumArr generic map(sampleWidth+coeffWidth,phaseCount) port map (filt_out, filt_sum);
		
		-- truncate the filter output here
		y_m <= filt_sum;

end architecture;