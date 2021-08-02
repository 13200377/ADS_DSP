library IEEE;
use IEEE.std_logic_1164.all;

entity leds is
	port( BYTE : in std_logic_vector(7 downto 0);
			CLK : in std_logic;
			VALS : out std_logic_vector(3 downto 0) );
end leds;

architecture my_leds of leds is
begin
	with CLK select
		VALS <= BYTE(3 downto 0) when '0',
				  BYTE(7 downto 4) when '1',
				  "0000" when others;
		
end architecture;