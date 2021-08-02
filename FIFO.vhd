library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIFO is 
	generic(data_width: positive := 8;
			  depth: positive);
	port(fifo_in : in std_logic_vector(data_width-1 downto 0);
		  fifo_out: out std_logic_vector(data_width-1 downto 0);
		  clk     : in std_logic := '0';
		  read_en : in std_logic := '0';
		  write_en: in std_logic := '0';
		  is_full : out std_logic;
		  is_empty: out std_logic);
end entity;

architecture circular_FIFO of FIFO is
	type t_FIFO_DATA is array (0 to depth-1) of std_logic_vector(data_width-1 downto 0);
	signal fifo_data: t_FIFO_DATA := (others => (others => '0'));
	
	signal count: integer := 0;
	signal write_index: integer := 0;
	signal read_index: integer := 0;
	
	--signal output: std_logic_vector(data_with-1 downto 0);
begin

	data_in: process(clk)
	begin
		if rising_edge(clk) then
			-- Read check
			if read_en = '1' and count /= 0 then
				-- Decrement count (emptiness has already been checked)
				count <= count - 1;
				-- Safely increment read_index
				if read_index < depth -1 then
					read_index <= read_index+1;
				else
					read_index <= 0;
				end if;
			end if;
			
			-- Write check
			if write_en = '1' then
				fifo_data(write_index) <= fifo_in; 
				-- Safely increment write_index
				if write_index < depth-1 then
					write_index <= write_index + 1;
				else
					write_index <= 0;
				end if;
				
				--Safely increment count
				if count < depth then
					count <= count + 1;
				else -- This means old data has been overwriten
					-- We leave count as is
					-- The newest data will now be the next in line
					-- Safely increment read_index
					if read_index < depth -1 then
						read_index <= read_index + 1; 
					else
						read_index <= 0;
					end if;
				end if;
			end if;
			
			
		end if;
	end process;
	
	fifo_out <= fifo_data(read_index);
	
	is_full <= '1' when count = depth
						else '0';
						
	is_empty <= '1' when count = 0
						 else '0';
	
end architecture;