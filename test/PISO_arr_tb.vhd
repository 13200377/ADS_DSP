library std;
use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

use work.filter_types.all;

entity PISO_arr_tb is
end entity;


architecture tb of PISO_arr_tb is
	component PISO_arr is
		generic (
			arrSize: positive;
			dataWidth: positive;
			outputFromStart: boolean := true
		);
		port(
			clk: in std_logic;
			n_rst: in std_logic;
			
			parallel_in: in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
			write_en: in std_logic;
			write_ready: out std_logic := '1';
			
			serial_out: out signed(dataWidth-1 downto 0);
			read_en: in std_logic;
			read_ready: out std_logic := '0'
		);
	end component;
	
	constant CLK_PERIOD: time := 20 ps;  -- 50MHz
	constant arrSize : integer := 12;
	constant dataWidth: integer := 8;
	file f_file : text;
	
	signal clk : std_logic := '0';
	signal n_rst: std_logic := '1';
	
	signal parallel_in: int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
	signal write_en: std_logic := '0';
	signal write_ready: std_logic;
	
	signal serial_out: signed(dataWidth-1 downto 0);
	signal read_en: std_logic := '0';
	signal read_ready: std_logic;
	
	-- Back PISO signals
	signal write_ready2: std_logic;
	signal read_ready2: std_logic;
	signal serial_out2: signed(dataWidth-1 downto 0);
	
	--signal test_vals: int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
begin
	forward_piso: PISO_arr generic map(arrSize, dataWidth, outputFromStart=>true)
									port map(clk, n_rst, parallel_in, write_en, write_ready,
												serial_out, read_en, read_ready);
	back_piso: PISO_arr generic map(arrSize, dataWidth, outputFromStart=>false)
										port map(clk, n_rst, parallel_in, write_en, write_ready2,
													serial_out2, read_en, read_ready2);
	clocking: process
	begin
		wait for CLK_PERIOD/2;
		clk <= not clk;
	end process;
	
	main_test: process
		-- File variables
		variable f_line : line;
		variable f_int  : integer;
		-- Test variables
		variable test_data : int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
		variable dataIndex: integer := 0; --Index of current value in file
		--variable testIndex: integer := 0; --Index of expected PISO output
	begin
		-- Load test data from file into array
		file_open(f_file, "PISO_arr_tb.dat", read_mode);
		
		while not endfile(f_file) loop
			readline(f_file, f_line);
			read(f_line, f_int);
			test_data(dataIndex) := to_signed(f_int, dataWidth);
			dataIndex := dataIndex + 1;
		end loop;
		
		----------------------
		-- Fordward PISO test
		----------------------
		
		-- Perform reset
		wait until falling_edge(clk);
		n_rst <= '0';
		wait until rising_edge(clk);
		wait until falling_edge(Clk);
		n_rst <= '1';
		
		wait until write_ready = '1' for CLK_PERIOD; --Write ready should be instantly available
		
		-- Load data in
		parallel_in <= test_data;
		write_en <= '1';
		
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		parallel_in <= (others => to_signed(0,dataWidth));   -- Clear values in paralle_in
		write_en <= '0';                -- End write
		read_en <= '1';                 -- Begin read phase
		wait until rising_edge(clk);
		
		if read_ready /= '1' then
			-- Fail if read is not indicated as ready
			report LF
				  & "FAIL!" & LF
				  & "read_ready was not set" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		if write_ready /= '0' then
			-- Fail if write is not indicated as unready
			report LF
				  & "FAIL!" & LF
				  & "write_ready was not cleared" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		
		-- Begin querying individual values
		for i in 0 to arrSize -1 loop
			if serial_out /= test_data(i) then
				-- Fail if serial_out does not contain expected value
				report LF
					  & "FAIL!" & LF
					  & "serial_out has incorrect value" & LF
					  & "----------------"
					  severity failure;
				--stop;
			end if;
			
			wait until falling_edge(clk);
			wait until rising_edge(clk); -- New data is only expected by the next rising edge
		end loop;
		
		if read_ready /= '0' then
			-- Fail if read is not indicated as unready
			report LF
				  & "FAIL!" & LF
				  & "read_ready was not cleared" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		if write_ready /= '1' then
			-- Fail if write is not indicated as ready
			report LF
				  & "FAIL!" & LF
				  & "write_ready was not set" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		
		
		-----------------------
		-- Back PISO test
		-----------------------
		
		-- Perform reset
		wait until falling_edge(clk);
		n_rst <= '0';
		wait until rising_edge(clk);
		wait until falling_edge(Clk);
		n_rst <= '1';
		
		wait until write_ready2 = '1' for CLK_PERIOD; --Write ready should be instantly available
		
		-- Load data in
		parallel_in <= test_data;
		write_en <= '1';
		
		wait until rising_edge(clk);
		wait until falling_edge(clk);
		parallel_in <= (others => to_signed(0,dataWidth));   -- Clear values in paralle_in
		write_en <= '0';                -- End write
		read_en <= '1';                 -- Begin read phase
		wait until rising_edge(clk);
		
		if read_ready2 /= '1' then
			-- Fail if read is not indicated as ready
			report LF
				  & "FAIL!" & LF
				  & "read_ready2 was not set" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		if write_ready2 /= '0' then
			-- Fail if write is not indicated as unready
			report LF
				  & "FAIL!" & LF
				  & "write_ready2 was not cleared" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		
		-- Begin querying individual values (in reverse order)
		for i in arrSize -1 downto 0 loop
			if serial_out2 /= test_data(i) then
				-- Fail if serial_out does not contain expected value
				report LF
					  & "FAIL!" & LF
					  & "serial_out2 has incorrect value" & LF
					  & "----------------"
					  severity failure;
				--stop;
			end if;
			
			wait until falling_edge(clk);
			wait until rising_edge(clk); -- New data is only expected by the next rising edge
		end loop;
		
		if read_ready2 /= '0' then
			-- Fail if read is not indicated as unready
			report LF
				  & "FAIL!" & LF
				  & "read_ready2 was not cleared" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		if write_ready2 /= '1' then
			-- Fail if write is not indicated as ready
			report LF
				  & "FAIL!" & LF
				  & "write_ready2 was not set" & LF
				  & "----------------"
				  severity failure;
			--stop;
		end if;
		
		report LF
			& "SUCCESS!" & LF
			& "----------------"
			severity note;
		stop;
	end process;
	

end architecture;
