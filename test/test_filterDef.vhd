library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
-- These coefficients should already be converted to fi 
package filterDef is
    constant h_fi : coeff_array := 
    (to_signed(1,16), to_signed(1,16), 
	 to_signed(1,16), to_signed(1,16), 
	 to_signed(1,16), to_signed(1,16), 
	 to_signed(1,16), to_signed(1,16), 
	 to_signed(1,16), to_signed(1,16), 
	 to_signed(1,16), to_signed(1,16));
end package;


-- package filterDef is
    -- constant h_fi : coeff_array := 
    -- (to_signed(1,16),	to_signed(2,16),
    -- to_signed(4,16),	to_signed(8,16),
    -- to_signed(16,16),	to_signed(32,16),
    -- to_signed(64,16),	to_signed(128,16),
    -- to_signed(256,16),	to_signed(512,16),
    -- to_signed(1024,16),	to_signed(2048,16) );
-- end package;