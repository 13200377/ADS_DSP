library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

entity deserializer is 
	generic(data_width: positive := 8;
			  depth: positive:= 4;
			  clearOnRead: boolean := false);
	
	port(clk     : in std_logic := '0';
		  n_rst   : in std_logic;
		  
		  serial_in : in sample;
		  parallel_out: out int_arr(0 to depth-1)(data_width-1 downto 0);
		  
		  read_en:  in std_logic  := '0';
		  write_en: in std_logic  := '0';
		  read_ready: out std_logic := '0';
		  is_full : out std_logic := '0';
		  is_empty: out std_logic := '1');
end entity;

architecture sr of deserializer is
	
begin

	data_in: process(clk)
		
		variable count: integer := 0;
		variable in_buffer: sample;
		variable data: int_arr(0 to depth-1)(data_width-1 downto 0);
		
		variable read_performed: boolean := false;
		variable write_performed: boolean := false;
		variable reset_performed: boolean := false;
	begin
		if rising_edge(clk) then
			-- Check for write
			if write_en = '1' then
				in_buffer := serial_in;
				write_performed := true;
			else
				write_performed := false;
			end if;
			-- Check for read
			if read_en = '1' then
				read_performed := true;
			else
				read_performed := false;
			end if;
			
			-- Check for reset
			if n_rst <= '0' then
				in_buffer := to_signed(0,sampleWidth);
				
				
				reset_performed := true;
				write_performed := false;
				read_performed := false;
			else
				reset_performed := false;
			end if;
		elsif falling_edge(clk) then
			if read_performed then
				read_ready <= '0';
				if clearOnRead then
					count := 0;
					data := (others => to_signed(0,sampleWidth));
					is_full <= '0';
				end if;
			end if;
			
			if write_performed then
				read_ready <= '1';
				is_empty <= '0';
				-- Increment count
				if count < depth then
					count := count + 1;
				end if;
				if count >= depth then
					is_full <= '1';
				end if;
				
				-- Shift data down
				for dataIndex in depth-1 downto 1 loop
					data(dataIndex) := data(dataIndex-1);
				end loop;
				
				-- Place new data in
				data(0) := in_buffer;
					
			end if;
			
			if reset_performed then
				is_full <= '0';
				is_empty <= '1';
				read_ready <= '0';
				count := 0;
				data := (others => to_signed(0,sampleWidth));
				end if;
		end if;
		
		parallel_out <= data;
	end process;
	
	
end architecture;