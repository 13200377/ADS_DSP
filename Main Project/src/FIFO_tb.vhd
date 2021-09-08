library IEEE;
use ieee.std_logic_1164.all;
--use std.env.finish;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity FIFO_tb is
end entity;

architecture tb of FIFO_tb is
	
	signal fifo_in: std_logic_vector(7 downto 0) := "00000000";
	signal fifo_out: std_logic_vector(7 downto 0);
	signal fifo_clk: std_logic := '0';
	signal read_en: std_logic := '0';
	signal write_en: std_logic := '0';
	signal is_full: std_logic;
	signal is_empty: std_logic;
	
	file output_buffer: text;
begin

	--mem: FIFO generic map (8, 4) port map (fifo_in, fifo_out, fifo_clk, read_en, write_en, is_full, is_empty);
	mem: entity work.fifo generic map (8, 4) port map (fifo_in, fifo_out, fifo_clk, read_en, write_en, is_full, is_empty);
	
	test: process
	variable row_buffer: line;
	begin
		file_open(output_buffer, "fifo_tb_output.txt", write_mode);
	
		-- Read/write
		fifo_clk <= '0';
		read_en <= '1';
		write_en <= '1';
		fifo_in <= "01100100";
		
		write(row_buffer, string'("R/W: "));
		write(row_buffer, fifo_out);
		write(row_buffer, string'(" 01100100"));
		writeline(output_buffer, row_buffer);
		
		wait for 1 ns;
		fifo_clk <= '1';
		wait for 1 ns;
		fifo_clk <= '0';
		wait for 1 ns;
		
		-- Write 4 times
		read_en <= '0';
		for count in 3 to 7 loop
			write(row_buffer, string'("W: "));
			write(row_buffer, std_logic_vector(to_unsigned(count,8)));
			write(row_buffer, string'(" full: "));
			write(row_buffer, is_full);
			writeline(output_buffer, row_buffer);
			
			fifo_in <= std_logic_vector(to_unsigned(count, 8));
			wait for 1 ns;
			fifo_clk <= '1';
			wait for 1 ns;
			fifo_clk <= '0';
			wait for 1 ns;
		end loop;
		
		-- Read twice
		read_en <= '1';
		write_en <= '0';
		
		for count in 0 to 7 loop
			write(row_buffer, string'("R: "));
			write(row_buffer, fifo_out);
			write(row_buffer, string'(" empty: "));
			write(row_buffer, is_empty);
			writeline(output_buffer, row_buffer);
			
			fifo_clk <= '1';
			wait for 1 ns;
			
			fifo_clk <= '0';
			wait for 1 ns;
		
		end loop;
		
		
		report "Simulation finished, output written to fifo_tb_output.txt";
		assert FALSE Report "Simulation Finished" severity FAILURE;
	end process;
	
end architecture;