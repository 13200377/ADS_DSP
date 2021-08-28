library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

entity sumArr is
	generic(
		dataWidth: integer := 8;
		arrSize: integer:= 1
	);
	port(
		arr : in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
		numOut : out signed(dataWidth-1 downto 0)
	);
end entity;



architecture sum_array of sumArr is
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
	
	signal upperSum : signed(dataWidth-1 downto 0);
	signal lowerSum : signed(dataWidth-1 downto 0);
	constant lowerIndex: integer := arrSize/2 - 1; -- Upper index of lower half
begin
	-- upper sum
	last_upper_sum: if arrSize - 1 = lowerIndex + 1 generate
		upperSum <= arr(arrSize - 1);
	end generate;
	
	upper_sum: if arrSize - 1 /= lowerIndex + 1 generate
		sum1: sumArr generic map (dataWidth, arrSize - 1 - lowerIndex) port map (arr(lowerIndex + 1 to arrSize-1), upperSum);
	end generate;
	
	-- lower sum
	last_lower_sum: if lowerIndex = 0 generate
		lowerSum <= arr(0);
	end generate;
	
	lower_sum: if lowerIndex /= 0 generate
		sum2: sumArr generic map (dataWidth, lowerIndex + 1) port map (arr(0 to lowerIndex), lowerSum);
	end generate;
	
	numOut <= lowerSum + upperSum;
end architecture;