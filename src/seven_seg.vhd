library IEEE;
use IEEE.std_logic_1164.all;

entity seven_seg is
	port( nibble : in std_logic_vector( 3 downto 0);
			seg : out std_logic_vector( 7 downto 0));
end entity;

architecture s_seg of seven_seg is
	signal seg_inv : std_logic_vector( 7 downto 0);
begin
	with nibble select
		seg_inv(6 downto 0) <= "0111111" when "0000", -- 048 0
									 "0000110" when "0001", -- 049 1
									 "1011011" when "0010", -- 050 2
									 "1001111" when "0011", -- 051 3
									 "1100110" when "0100", -- 052 4
									 "1101101" when "0101", -- 053 5
									 "1111101" when "0110", -- 054 6
									 "0000111" when "0111", -- 055 7
									 "1111111" when "1000", -- 056 8
									 "1101111" when "1001", -- 057 9
									 "1110111" when "1010", -- 065 A
									 "1111100" when "1011", -- 066 "
									 "0111001" when "1100", -- 067 C
									 "1011110" when "1101", -- 068 D
									 "1111001" when "1110", -- 069 E
									 "1110001" when "1111", -- 070 F
									 "0000000" when others;
		seg_inv(7) <= '0'; -- dp
	seg <= not seg_inv;
end s_seg;