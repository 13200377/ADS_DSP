library IEEE;
use IEEE.std_logic_1164.all;

entity parallel_reg is
	generic(n: positive);
	port(REG_IN: in std_logic_Vector(n-1 downto 0);
			CLK: in std_logic;
			REG_OUT: out std_logic_vector(n-1 downto 0));
end parallel_reg;

architecture reg of parallel_reg is
signal mem: std_logic_vector(n-1 downto 0);
begin
	sync_proc: process(CLK)
	begin
		if(rising_edge(CLK)) then
			mem <= REG_IN;
			end if;
	end process sync_proc;
	
	REG_OUT <= mem;
end reg;
			
	
