library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
-- package filter_types is
-- 	type uint_arr is array(natural range <>) of unsigned;
-- 	type int_arr is array(natural range <>) of signed;
-- end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
use work.filter_types.all;

entity PFB2 is
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
		y_k : out int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0)
	);
end entity;

architecture polyphase_filter_bank of PFB2 is
	component sumArr is
		generic(
			dataWidth: integer;
			arrSize: integer
		);
		port(
			arr : in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
			numOut : out signed(dataWidth-1 downto 0)
		);
	end component;
	
	-- Contains all the individual x[n]*h[n] taps for the current phase
	signal tap_bank: int_arr(0 to tapCount-1)(sampleWidth+coeffWidth - 1 downto 0);
	-- The result of summing all values in tap_bank
	signal tap_sum: signed(sampleWidth+coeffWidth-1 downto 0);
	
	signal phaseIndex : integer := 0; -- Which phase we are currently calculating. This effectively starts at phaseCount - 1
begin
	shift_index: -- shift the phase index. phaseIndex mux's taps, and demux's/commutates banks
	process(clk) is
		-- tempSum stores the results for a single set until they are all ready to be output
		variable tempSum : int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0);
		-- commutator buffer will perform a shallow copy of tempSum when a full set of outputs is ready
		variable commutator_buffer : int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0);
	begin
		if rising_edge(clk) then
			-- Safely decrement phaseIndex, wrapping if necessary
			if phaseIndex = 0 then
				phaseIndex <= phaseCount - 1;
			else
				phaseIndex <= phaseIndex - 1;
			end if;
			-- On the rising edge we allow the multiplications and additions to buffer
			-- in our generated circuit
		elsif falling_edge(clk) then
			tempSum(phaseIndex) := tap_sum;    -- Place the sum result into tempSum
			if phaseIndex = 0 then             -- If a full output set is ready
				commutator_buffer := tempSum;  -- Shallow copy to commutator_buffer
				y_k <= commutator_buffer;      -- Then output
			end if;
		end if;
	end process;
	
	-- sum individual taps
	sum : sumArr generic map (sampleWidth+coeffWidth, tapCount) port map (tap_bank, tap_sum);
	
	-- generate taps. Mux's filter coefficients and multiplies with x_n
	gen_taps:
	for tap in 0 to tapCount-1 generate
	begin
		--x_n isn't affected by phaseCount here, because x_n is shifted externally
		tap_bank(tap) <=  h_n(tap*phaseCount + phaseIndex)*x_n(tap*phaseCount);
	end generate;
	
end architecture;