library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package filter_types is
	type uint_arr is array(natural range <>) of unsigned;
	type int_arr is array(natural range <>) of signed;
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

entity PFB is
	generic(
		dataWidth: integer := 8;
		phaseCount: integer;
		tapCount: integer
	);
	port (
		x_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
		h_n : in int_arr(0 to phaseCount*tapCount-1)(dataWidth-1 downto 0);
		y_k : out int_arr(0 to phaseCount-1)(dataWidth-1 downto 0)
	);
end entity;

architecture polyphase_filter_bank of PFB is
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
begin
	gen_filter:
	for phase in 0 to phaseCount-1 generate
		signal phaseVals : int_arr(0 to tapCount-1)(dataWidth-1 downto 0);
		signal phaseSum : signed(dataWidth-1 downto 0);
		
	begin
		gen_phase:
		for tap in 0 to tapCount-1 generate
		signal product : signed(dataWidth*2-1 downto 0);
		begin
			product <= x_n(phaseCount*tap + phase)*h_n(phaseCount*tap + phase);
			phaseVals(tap) <= product(dataWidth-1 downto 0); -- truncate multiplication
		end generate;
		sum: sumArr generic map(dataWidth, tapCount) port map (phaseVals, phaseSum);
		y_k(phase) <= phaseSum;
	end generate;
end architecture;