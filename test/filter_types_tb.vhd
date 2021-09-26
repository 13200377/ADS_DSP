library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.filter_types.all;

package test_types is
	type test_data_arr is array (natural range <>) of int_arr;
	type integer_arr is array (natural range <>) of integer;
end package;

library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.test_types.all;


entity filter_types_tb is 
end entity;

architecture filt_test of filter_types_tb is

	-- Create signals for data io to filter
	signal x_n : fi_7Q8;
	-- signal y_k : signed(sampleWidth-1 downto 0);

	-- signal clk: std_logic := '0';
    -- signal x : integer := 1;
    begin 

    p_main_test: 
    process is
	begin
        -- Test to_fi_7Q8 fcn as fractional parts
        for x in 0 to 10 loop
            x_n <= to_fi_7Q8(x,'1');
            wait for 50 ps;
        end loop;
        
        -- Test fi_7Q8 as decimal parts
        for x in 0 to 10 loop
            x_n <= to_fi_7Q8(x,'0');
            wait for 50 ps;
        end loop;

        report LF
        & "SUCCESS!" & LF
        & "----------------"
        severity note;

    end process;
		

end architecture;
