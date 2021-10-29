library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
use work.filterDef.all;

entity serial_PFB is
	port (
		clk: in std_logic;
		n_rst: in std_logic;
		
		x_n : in sample;
		write_en : in std_logic;
		write_ready: out std_logic := '1';
		
		y_k : out filtOutput;
		read_en : in std_logic;
		read_ready: out std_logic := '0'
	);
end entity;

architecture s_PFB of serial_PFB is
	component PFB3 is
		port (
			clk: in std_logic;
			n_rst: in std_logic;
			
			x_n : in tapped_delay_line;
			write_en : in std_logic;
			write_ready: out std_logic := '1';
			
			y_k : out pfb_output_arr;
			read_en : in std_logic;
			read_ready: out std_logic := '0'
		);
	end component;
	
	component deserializer is
		generic(data_width: positive := 8;
			  depth: positive:= 4);
		
		port(clk     : in std_logic := '0';
		  n_rst   : in std_logic;
		  
		  serial_in : in sample;
		  parallel_out: out int_arr(0 to depth-1)(data_width-1 downto 0);
		  
		  read_en:  in std_logic  := '0';
		  write_en: in std_logic  := '0';
		  read_ready: out std_logic := '0';
		  is_full : out std_logic := '0';
		  is_empty: out std_logic := '1');
	end component;
	
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

	signal x_n_delay_line :	tapped_delay_line;
	signal des_int_arr : int_arr(0 to filterOrder-1)(sampleWidth-1 downto 0);
	signal y_k_phases     : pfb_output_arr;
	signal y_k_intarr : int_arr(0 to phaseCount-1)(filtOutputWidth-1 downto 0);
	
	signal PFB_write_en : std_logic;
	signal PFB_write_ready : std_logic;
	signal PFB_read_en: std_logic;
	signal PFB_read_ready  : std_logic;
	
	signal des_read_en : std_logic;
	signal des_write_en: std_logic;
	signal des_read_ready: std_logic;
	signal des_full : std_logic;
	signal des_empty: std_logic;
	
	signal ser_write_en: std_logic;
	signal ser_write_ready: std_logic;
	signal ser_read_en: std_logic;
	signal ser_read_ready: std_logic;
begin
	pfb_module: PFB3 port map (clk, n_rst, x_n_delay_line, PFB_write_en, PFB_write_ready,
										y_k_phases, PFB_read_en, PFB_read_ready);
										
	des: deserializer generic map (sampleWidth, filterOrder) 
							port map (clk, n_rst, x_n, des_int_arr,
										 des_read_en, des_write_en,
										 des_read_ready, des_full, des_empty);
	
	ser: PISO_arr generic map(phaseCount, filtOutputWidth, true)
					  port map (clk, n_rst, y_k_intarr, ser_write_en, ser_write_ready,
									y_k, ser_read_en, ser_read_ready);
	-- Input to des
	des_write_en <= write_en;
	write_ready <= PFB_write_ready; -- Deserializer is always write ready, so we check for PFB instead
	
	-- Des to PFB
	x_n_delay_line <= int_arr_to_tdl(des_int_arr);
	PFB_write_en <= PFB_write_ready and des_read_ready;
	des_read_en <= PFB_write_en;
	
	-- PFB to Ser
	y_k_intarr <= pfb_out_to_intarr(y_k_phases);
	PFB_read_en <= PFB_read_ready and ser_write_ready;
	ser_write_en <= PFB_read_en;
	
	-- Ser to output
	ser_read_en <= read_en;
	read_ready <= ser_read_ready;
	
	
end architecture;