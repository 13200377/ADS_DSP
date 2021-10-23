library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.filter_types.all;

entity PISO_arr is
	generic (
		arrSize: positive;
		dataWidth: positive;
		outputFromStart: boolean := true
	);
	port(
		clk: in std_logic;
		n_rst: in std_logic;
		
		parallel_in: in pfb_output_arr;
		write_en: in std_logic;
		write_ready: out std_logic := '1';
		
		serial_out: out signed(dataWidth-1 downto 0);
		read_en: in std_logic;
		read_ready: out std_logic := '0'
	);
end entity;

architecture PISO of PISO_arr is
begin
	
	data_movement: process (clk)
		variable mem: pfb_output_arr;
		variable outputIndex: integer := 0;
		
		variable readPerformed: boolean := false;
		variable writePerformed: boolean := false;
		
		-- We use a buffer so the output is not instantly affected when memory is changed
		variable outputBuffer: signed(dataWidth-1 downto 0);
	begin
		if rising_edge(clk) then
			if n_rst = '0' then -- Check for reset triggered
				read_ready <= '0';
				write_ready <= '1';
				-- Reset outputIndex
				if outputFromStart then
					outputIndex := 0;
				else
					outputIndex := arrSize-1;
				end if;
				-- Reset state variables
				writePerformed := false;
				readPerformed  := false;
				outputBuffer   := to_signed(0, dataWidth);
				mem := (others => to_signed(0, dataWidth));
			else
				-- Data input
				if write_en = '1' then
					mem := parallel_in;
					writePerformed := true;
				end if;
				
				-- Data output
				if read_en = '1' then
					readPerformed := true;
				end if;	
			end if;
		-- Changes to outputs are only made on falling edge
		elsif falling_edge(clk) then
			if readPerformed then -- If a read was performed on previous rising edge
				-- Safely increment/decrement outputIndex
				if outputFromStart then
					if outputIndex < arrSize-1 then -- If there's room to increment
						outputIndex := outputIndex + 1;
					else
						read_ready <= '0'; -- Indicate no data left
						write_ready <= '1';
					end if;
				else
					if outputIndex > 0 then -- If there's room to decrement
						outputIndex := outputIndex - 1;
					else
						read_ready <= '0'; -- Indicate no data left
						write_ready <= '1';
					end if;
				end if;
				readPerformed := false;
			end if;
			
			if writePerformed then
				-- Reset outputIndex
				if outputFromStart then
					outputIndex := 0;
				else
					outputIndex := arrSize-1;
				end if;
				writePerformed := false;
				read_ready <= '1';
				write_ready <= '0';
			end if;
			
			outputBuffer := mem(outputIndex); -- update output buffer
			serial_out <= outputBuffer;
		end if;
	end process;
	
end architecture;