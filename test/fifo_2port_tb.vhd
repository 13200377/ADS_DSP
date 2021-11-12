library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library std;
use std.env.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.filterDef.all;

entity fifo_2port_tb is
end entity;

architecture fifo_2port_test of fifo_2port_tb is
	component FIFO_2Port is 
		 generic ( 
			  data_width : natural := 8; 
			  -- fifo_depth minimum required for almost_full and almsot_empty thresholds 
			  fifo_depth : natural range 16 to 8192 := 32 
		 ); 
		 port( 
			  -- Write Side 
			  wr_clk  : in std_logic; 
			  wr_enable : in std_logic;  
			  wr_data : in std_logic_vector(data_width-1 downto 0); 
			  full    : out std_logic; 
			  almost_full : out std_logic; 
				
			  -- Read side 
			  rd_clk  : in std_logic; 
			  rd_enable : in std_logic;  
			  rd_data : out std_logic_vector(data_width-1 downto 0); 
			  empty   : out std_logic; 
			  almost_empty : out std_logic  
		 ); 
	end component; 
	
	constant data_width : integer := 8;
	constant fifo_depth : integer := 16;
	
	signal wr_clk: std_logic := '0';
	signal wr_enable: std_logic := '0';
	signal wr_data: std_logic_vector(data_width-1 downto 0);
	signal full: std_logic;
	signal almost_full: std_logic;
	
	signal rd_clk: std_logic := '0';
	signal rd_enable: std_logic := '0';
	signal rd_data: std_logic_vector(data_width-1 downto 0);
	signal empty: std_logic;
	signal almost_empty: std_logic;
	
	constant write_period: time := 20 ps; -- 50MHz
	constant read_period: time := 33 ps; -- 30MHz
begin
	fifo: fifo_2port generic map (data_width, fifo_depth) port map( wr_clk, wr_enable, wr_data,
																						full, almost_full,
																						rd_clk, rd_enable, rd_data,
																						empty, almost_empty);
	
	write_clocking: process
	begin
		wait for write_period/2;
		wr_clk <= not wr_clk;
	end process;
	
	read_clocking: process
	begin
		wait for read_period/2;
		rd_clk <= not rd_clk;
	end process;
		
	test_write: process
		variable count: integer := 0;
		variable run: boolean := false;
	begin
		if not run then 
			for i in 0 to 9 loop
				wait until falling_edge(wr_clk);
				wr_enable <= '1';
				count := count + 1;
				wr_data <= std_logic_vector(to_signed(count*2,data_width));
				wait until rising_edge(wr_clk);	
				
				wait until falling_edge(wr_clk);
				count := count + 1;
				wr_data <= std_logic_vector(to_signed(count*2,data_width));
				wait until rising_edge(wr_clk);	
				
				wait until falling_edge(wr_clk);
				count := count + 1;
				wr_data <= std_logic_vector(to_signed(count*2,data_width));
				wait until rising_edge(wr_clk);	
				
				
				wait until falling_edge(wr_clk);
				wr_enable <= '0';
				wait until rising_edge(wr_clk);
			end loop;
			run := true;
		end if;
	end process;
	
	
	test_read: process
		variable count: integer := 0;
	begin
		wait until falling_edge(rd_clk);
		wait until rising_edge(rd_clk);
		wait until falling_edge(rd_clk);
		wait until rising_edge(rd_clk);
		
		for i in 0 to 29 loop
			wait until falling_edge(rd_clk);
			rd_enable <= '1';
			wait until rising_edge(rd_clk);
--			wait until falling_edge(rd_clk);
--			wait until rising_edge(rd_clk);
			if empty /= '0' or signed(rd_data) /= to_signed((i+1)*2,data_width) then
				report LF
				  & "FAIL!" & LF
				  & "rd_data does not contain correct value" & LF
				  & "----------------"
				  severity failure;
				stop;
			end if;
		end loop;
		report LF
		  & "SUCCESS!" & LF
		  & "----------------"
		  severity note;	
		stop;
	end process;
end architecture;