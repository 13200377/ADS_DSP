library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--package pkg is
--	--generic(data_width: integer := 8);
--	type parallel_output is array (natural range <>) of std_logic_vector;--(data_width-1 downto 0);
--end package;
--
--package body pkg is
--end package body;

--
--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
--user work.pkg.all;


entity shift_register is 
	generic(data_width: positive := 8;
			  depth: positive:= 4);
	port(sr_in : in std_logic_vector(data_width-1 downto 0);
		  sr_out: out std_logic_vector(data_width-1 downto 0) := "00000000";
		  data: out std_logic_vector(data_width*depth-1 downto 0);
		  clk     : in std_logic := '0';
		  read_en: in std_logic := '0';
		  write_en: in std_logic := '0';
		  is_full : out std_logic;
		  is_empty: out std_logic);
end entity;

architecture sr of shift_register is
	type t_SR_DATA is array (0 to depth-1) of std_logic_vector(data_width-1 downto 0);
	signal sr_data: t_SR_DATA := (others => (others => '0'));
	
	signal count: integer range 0 to depth := 0;
	
	function flatten_array(arr: t_SR_DATA) return std_logic_vector is
	variable vec: std_logic_vector(depth*data_width-1 downto 0);
	begin
	for i in 0 to depth-1 loop
		vec((i+1)*data_width-1 downto i*data_width) := arr(i);
	end loop;
	return vec;
	end function;
	
begin

	data_in: process(clk)
	variable last_index: integer range 0 to depth := 0;
	variable loop_index: integer range 0 to depth := 0;
	begin
		if rising_edge(clk) then
			if write_en = '1'  and read_en = '0' then
				-- Shift data down
				loop_index := depth-1;--last_index;
				while loop_index > 0 loop
					sr_data(loop_index) <= sr_data(loop_index - 1);
					loop_index := loop_index -1;
				end loop;
				
				sr_data(0) <= sr_in; -- Load new data in
				
				-- Safely increment count
				if count < depth then
					count <= count + 1;
				end if;
			elsif read_en = '1' and write_en = '0' and count /= 0 then
				-- Get index of last element
				last_index := depth-1;
				-- Shift data up
				loop_index := 0;
				while loop_index < last_index loop
					sr_data(loop_index) <= sr_data(loop_index + 1);
					loop_index := loop_index + 1;
				end loop;
				
				count <= count - 1; -- Emptiness has already been checked
			end if;
		end if;
	end process;
	
	data <= flatten_array(sr_data);
	sr_out <= sr_data(0);
	
	is_full <= '1' when count = depth
						else '0';
						
	is_empty <= '1' when count = 0
						 else '0';
	
end architecture;