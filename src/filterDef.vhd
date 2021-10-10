library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
-- These coefficients should already be converted to fi 
package filterDef is
    constant h_fi : coeff_array := 
    (to_signed(4,16),	to_signed(7,16),
    to_signed(10,16),	to_signed(13,16),
    to_signed(16,16),	to_signed(18,16),
    to_signed(21,16),	to_signed(23,16),
    to_signed(24,16),	to_signed(24,16),
    to_signed(24,16),	to_signed(23,16) );
end package;