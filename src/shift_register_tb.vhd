library IEEE;
use ieee.std_logic_1164.all;
--use std.env.finish;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity shift_register_tb is
end entity;


architecture sr_tb of shift_register_tb is
	signal sr_in : std_logic_vector(7 downto 0);
	signal sr_out: std_logic_vector(7 downto 0);
	signal data: std_logic_vector(31 downto 0);
	signal clk     : std_logic := '0';
	signal read_en: std_logic := '0';
	signal write_en: std_logic := '0';
	signal is_full : std_logic;
	signal is_empty: std_logic;
	
	file output_buffer: text;
	
--	procedure print_vec(vec: std_logic_vector) is
--	for cnt in std_logic_vector'range loop
--	
--	end loop;
--	end procedure;
begin
	--mem: FIFO generic map (8, 4) port map (fifo_in, fifo_out, fifo_	, read_en, write_en, is_full, is_empty);
	mem: entity work.shift_register generic map (8, 4) port map (sr_in, sr_out, data, clk, read_en, write_en, is_full, is_empty);
	
	test: process
	variable row_buffer: line;
	begin
		file_open(output_buffer, "sr_tb_output.txt", write_mode);
	
		-- Read/write
		clk	 <= '0';
		read_en <= '1';
		write_en <= '1';
		sr_in <= "01100100";
		
		write(row_buffer, string'("R/W: "));
		write(row_buffer, data);
		writeline(output_buffer, row_buffer);
		
		wait for 1 ns;
		clk	 <= '1';
		wait for 1 ns;
		clk	 <= '0';
		wait for 1 ns;
		
		-- Write 4 times
		read_en <= '0';
		for count in 3 to 7 loop
			write(row_buffer, string'("W: "));
			write(row_buffer, data);
			writeline(output_buffer, row_buffer);
			
			sr_in <= std_logic_vector(to_unsigned(count, 8));
			wait for 1 ns;
			clk	 <= '1';
			wait for 1 ns;
			clk	 <= '0';
			wait for 1 ns;
		end loop;
		
		-- Read twice
		read_en <= '1';
		write_en <= '0';
		
		for count in 0 to 7 loop
			write(row_buffer, string'("R: "));
			write(row_buffer, data);
			writeline(output_buffer, row_buffer);
			
			clk	 <= '1';
			wait for 1 ns;
			
			clk	 <= '0';
			wait for 1 ns;
		
		end loop;
		
		
		report "Simulation finished, output written to sr_tb_output.txt";
		assert FALSE Report "Simulation Finished" severity FAILURE;
	end process;
end architecture;