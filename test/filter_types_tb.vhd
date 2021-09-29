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
    signal expected_x : signed(15 downto 0);
    signal p_k : fi_15Q16;
	-- signal y_k : signed(sampleWidth-1 downto 0);
    
	-- signal clk: std_logic := '0';
    -- signal x : integer := 1;
    begin 
    
    p_main_test: 
    process is
        variable p_k_var : fi_15Q16;
	begin
        -- Test to_fi_7Q8 fcn as fractional parts
        -- for x in -128 to 127 loop
        --     x_n <= to_fi_7Q8(x,'1');
        --     expected_x <= to_signed(x,16);
        --     wait for 50 ps;

        --     if expected_x /= x_n then
        --         report LF
        --         & "FAIL!" & LF
        --         & "Unexpected phase output" & LF
        --         & "-------------"
        --         severity failure;
        --     end if;
        -- end loop;
        
        -- -- Test fi_7Q8 as decimal parts
        -- for x in -128 to 127 loop
        --     x_n <= to_fi_7Q8(x,'0');
        --     expected_x <= to_signed(x,16) sll 8;
        --     wait for 50 ps;

        --     if expected_x /= x_n then
        --         report LF
        --         & "FAIL!" & LF
        --         & "Unexpected phase output" & LF
        --         & "-------------"
        --         severity failure;
        --     end if;
        -- end loop;

        -- Test fi_product_to_output
        -- for x in -32768 to 32767 loop
        --     p_k <= to_fi_15Q16(x,'0');
        --     wait for 10 ps;
        --     x_n <= fi_product_to_output(p_k);

        --     -- p_k_var := p_k srl 8;
        --     -- expected_x <= p_k_var(15 downto 0);
        --     expected_x <= to_signed(x,16);
        --     wait for 50 ps;

        --     if to_signed(x,16) /= x_n then
        --         report LF
        --         & "FAIL!" & LF
        --         & "Unexpected phase output" & LF
        --         & "-------------"
        --         severity failure;
        --     end if;

        -- end loop;

        -- Test fi_product_to_output with fractional parts       
        for x in -32768 to 32767 loop
            p_k <= to_fi_15Q16(x,'1');
            wait for 10 ps;
            x_n <= fi_product_to_output(p_k);

            -- p_k_var := p_k srl 8;
            -- expected_x <= p_k_var(15 downto 0);
            expected_x <= to_signed(x,16);
            wait for 50 ps;

            if to_signed(x,16) /= x_n then
                report LF
                & "FAIL!" & LF
                & "Unexpected phase output" & LF
                & "-------------"
                severity failure;
            end if;

        end loop;

        report LF
        & "SUCCESS!" & LF
        & "----------------"
        severity note;

    end process;
		

end architecture;
