library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftreg_p_load is
    generic(
        data_width: : positive := 8
    );
    port(
        load_data : in std_logic_vector(data_width downto 0);
        load_p : in std_logic;
        d_out : std
    )