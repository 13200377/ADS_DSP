library IEEE;
use IEEE.std_logic_1164.all;


entity seven_seg_display is
	port( clk : in std_logic;
			num : in std_logic_vector(15 downto 0);
			dig: out std_logic_vector(3 downto 0);
			seg: out std_logic_vector(7 downto 0);
			rst: in std_logic
			);
end entity;

architecture display of seven_seg_display is 
	component seven_seg  is
		port( nibble : in std_logic_vector( 3 downto 0 );
				seg :  out std_logic_vector( 7 downto 0 ));
	end component seven_seg;
	
	signal seg0 : std_logic_vector( 7 downto 0 );
	signal seg1 : std_logic_vector( 7 downto 0 );
	signal seg2 : std_logic_vector( 7 downto 0 );
	signal seg3 : std_logic_vector( 7 downto 0 );
	
	signal seg_select: std_logic_vector(3 downto 0);
begin

	cycle: process(clk)
	begin
		if rising_edge(clk) then
			if seg_select(0) = '1' then
				seg_select <= "0010";
			elsif seg_select(1) = '1' then
				seg_select <= "0100";
			elsif seg_select(2) = '1' then
				seg_select <= "1000";
			elsif seg_select(3) = '1' then
				seg_select <= "0001";
			else
				seg_select <= "0001";
			end if;
		end if;
	end process cycle;
	
	s0 : seven_seg port map ( num(3 downto 0), seg0);
	s1 : seven_seg port map ( num(7 downto 4), seg1);
	s2 : seven_seg port map ( num(11 downto 8), seg2);
	s3 : seven_seg port map ( num(15 downto 12), seg3);
	
	dig <= not seg_select;
	
	with seg_select select
		seg <= seg0 when "0001",
				 seg1 when "0010",
		       seg2 when "0100",
			    seg3 when "1000",
				 seg0 when others;
						
end display;