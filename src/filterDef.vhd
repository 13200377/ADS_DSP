library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

package filterDef is
    constant h_fi : coeff_array := 
    (to_fi_7Q8(4,'1'),	to_fi_7Q8(7,'1'),
    to_fi_7Q8(10,'1'),	to_fi_7Q8(13,'1'),
    to_fi_7Q8(16,'1'),	to_fi_7Q8(18,'1'),
    to_fi_7Q8(21,'1'),	to_fi_7Q8(23,'1'),
    to_fi_7Q8(24,'1'),	to_fi_7Q8(24,'1'),
    to_fi_7Q8(24,'1'),	to_fi_7Q8(23,'1') );
end package;