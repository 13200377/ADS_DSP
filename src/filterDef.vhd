library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.filter_types.all;

package filterDef is
-- Filter Coefficients as fi_7Q8
constant h_fi : coeff_array := 
		(to_signed(-1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(0,16),
		to_signed(0,16),	to_signed(-1,16),
		to_signed(-2,16),	to_signed(-3,16),
		to_signed(-3,16),	to_signed(-4,16),
		to_signed(-4,16),	to_signed(-4,16),
		to_signed(-3,16),	to_signed(-2,16),
		to_signed(-1,16),	to_signed(1,16),
		to_signed(4,16),	to_signed(7,16),
		to_signed(10,16),	to_signed(13,16),
		to_signed(16,16),	to_signed(18,16),
		to_signed(21,16),	to_signed(23,16),
		to_signed(24,16),	to_signed(24,16),
		to_signed(24,16),	to_signed(23,16),
		to_signed(21,16),	to_signed(18,16),
		to_signed(16,16),	to_signed(13,16),
		to_signed(10,16),	to_signed(7,16),
		to_signed(4,16),	to_signed(1,16),
		to_signed(-1,16),	to_signed(-2,16),
		to_signed(-3,16),	to_signed(-4,16),
		to_signed(-4,16),	to_signed(-4,16),
		to_signed(-3,16),	to_signed(-3,16),
		to_signed(-2,16),	to_signed(-1,16),
		to_signed(0,16),	to_signed(0,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(1,16),	to_signed(1,16),
		to_signed(-1,16),	to_signed(0,16) );
end package;

--
-- library IEEE;
-- use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;
--
-- use work.filter_types.all;
-- -- These coefficients should already be converted to fi 
-- package filterDef is
--     constant h_fi : coeff_array := 
--     (to_signed(1,16),	to_signed(-2,16),
--     to_signed(-4,16),	to_signed(-8,16),
--     to_signed(16,16),	to_signed(32,16),
--     to_signed(-64,16),	to_signed(-128,16),
--     to_signed(256,16),	to_signed(512,16),
--     to_signed(1024,16),	to_signed(-2048,16) );
-- end package;