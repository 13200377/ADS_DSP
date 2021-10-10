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
	
	signal tap_bank: int_arr(0 to tapCount-1)(sampleWidth+coeffWidth - 1 downto 0);
	-- signal tap_bank_truncated: int_arr(0 to tapCount-1)(sampleWidth - 1 downto 0);
	--signal commutator_buffer: int_arr(0 to tapCount-1)(sampleWidth-1 downto 0);
	
	signal tap_sum: signed(sampleWidth+coeffWidth-1 downto 0);
	
	signal phaseIndex : integer := 0;
begin
	shift_index: -- shift the phase index. phaseIndex mux's taps, and demux's/commutates banks
	process(clk) is
		
		variable tempSum : int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0);
		variable commutator_buffer : int_arr(0 to phaseCount-1)(sampleWidth+coeffWidth-1 downto 0);
	begin
		if rising_edge(clk) then
			if phaseIndex = 0 then
				phaseIndex <= phaseCount - 1;
			else
				phaseIndex <= phaseIndex - 1;
			end if;
		-- end if;
	
		-- Output 
		elsif falling_edge(clk) then
			tempSum(phaseIndex) := tap_sum;
			if phaseIndex = 0 then
				commutator_buffer := tempSum;
				y_k <= commutator_buffer;
			end if;
			--y_k(phaseIndex) <= tempSum(phaseIndex);
		end if;
	end process;
	
	-- sum individual taps
	sum : sumArr generic map (sampleWidth+coeffWidth, tapCount) port map (tap_bank, tap_sum);
	
	-- generate taps. Mux's filter coefficients and multiplies with x_n
	gen_taps:
	for tap in 0 to tapCount-1 generate
	begin
		--x_n isn't affected by phaseCount here, because x_n is changed externally
		tap_bank(tap) <=  h_n(tap*phaseCount + phaseIndex)*x_n(tap*phaseCount);
		-- tap_bank_truncated(tap) <= tap_bank(tap)(sampleWidth-1 downto 0);
	end generate;
	
end architecture;