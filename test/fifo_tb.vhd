library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library std;
use std.env.all;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

use work.filter_types.all;
use work.filterDef.all;

entity fifo_tb is
end entity;

architecture fifo_test of fifo_tb is
	component FIFO is 
		 generic ( 
			  data_width : natural := 8; 
			  -- fifo_depth minimum required for almost_full and almsot_empty thresholds 
			  fifo_depth : natural range 16 to 8192 := 32 
		 ); 
		 port( 
				clk  : in std_logic; 
				-- Write Side 

				wr_enable : in std_logic;  
				wr_data : in std_logic_vector(data_width-1 downto 0); 
				full    : out std_logic; 
				almost_full : out std_logic; 

				-- Read side 
				rd_enable : in std_logic;  
				rd_data : out std_logic_vector(data_width-1 downto 0); 
				empty   : out std_logic; 
				almost_empty : out std_logic  
		); 
	end component; 
	
	constant data_width : integer := 8;
	constant fifo_depth : integer := 16;
	
	signal clk: std_logic := '0';
	signal wr_enable: std_logic := '0';
	signal wr_data: std_logic_vector(data_width-1 downto 0);
	signal full: std_logic;
	signal almost_full: std_logic;
	

	signal rd_enable: std_logic := '0';
	signal rd_data: std_logic_vector(data_width-1 downto 0);
	signal empty: std_logic;
	signal almost_empty: std_logic;
	
	constant clk_period: time := 20 ps; -- 50MHz
begin
	fifo_module: fifo generic map (data_width, fifo_depth) port map( clk, wr_enable, wr_data,
																						full, almost_full,
																						 rd_enable, rd_data,
																						empty, almost_empty);
	
	clocking: process
	begin
		wait for clk_period/2;
		clk <= not clk;
	end process;

	test_write: process
		variable count: integer := 0;
		variable run: boolean := false;
	begin
		for i in 0 to fifo_depth -1 loop
			wait until falling_edge(clk);
			wr_enable <= '1';
			wr_data <= std_logic_vector(to_signed(i, data_width));
			wait until rising_edge(clk);
		end loop;
		
		for i in 0 to fifo_depth-1 loop
			wait until falling_edge(clk);
			wr_enable <= '0';
			rd_enable <= '1';
			wait until rising_edge(clk);
			if signed(rd_data) /= to_signed(i, data_width) then
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