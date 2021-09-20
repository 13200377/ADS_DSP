library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package filter_types is
	type uint_arr is array(natural range <>) of unsigned;
	type int_arr is array(natural range <>) of signed;
end package;
