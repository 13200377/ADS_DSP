library IEEE;
use ieee.std_logic_1164.all;

entity FIFO_tb is
end entity;

architecture tb of FIFO_tb is
--	component FIFO is 
--		generic(data_width: positive := 8;
--			  depth: positive);
--		port(fifo_in : in std_logic_vector(data_width-1 downto 0);
--			  fifo_out: out std_logic_vector(data_width-1 downto 0);
--			  clk     : in std_logic;
--			  read_en : in std_logic;
--			  write_en: in std_logic;
--			  is_full : out std_logic;
--			  is_empty: out std_logic);
--	end component;
	
	signal fifo_in: std_logic_vector(7 downto 0);
	signal fifo_out: std_logic_vector(7 downto 0);
	signal fifo_clk: std_logic;
	signal read_en: std_logic;
	signal write_en: std_logic;
	signal is_full: std_logic;
	signal is_empty: std_logic;
begin

	--mem: FIFO generic map (8, 4) port map (fifo_in, fifo_out, fifo_clk, read_en, write_en, is_full, is_empty);
	mem: entity work.fifo generic map (8, 3) port map (fifo_in, fifo_out, fifo_clk, read_en, write_en, is_full, is_empty);
	
	fifo_in <= "11001001";
end architecture;