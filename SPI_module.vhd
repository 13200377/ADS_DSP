library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SPI_module is port (
	clk: in std_logic;
	sck: in std_logic;
	mosi: in std_logic;
	miso: out std_logic;
	cs: in std_logic;
	input_shiftreg: out std_logic_vector(7 downto 0);
	output_shiftreg: in std_logic_vector(7 downto 0);
	out_data_ready: in std_logic;
	in_data_ready: out std_logic;
	tx_empty: out std_logic := '1'
	);

end entity;

architecture SPI of SPI_Module is
	signal sck_record: std_logic_vector(2 downto 0);
	signal cs_record : std_logic_vector(2 downto 0);
	
	signal current_state : std_logic;
	signal bitcounter    : unsigned(3 downto 0);
	signal out_bitcounter: unsigned(3 downto 0);
	
	signal in_reg : std_logic_Vector(7 downto 0);
	signal out_reg: std_logic_vector(7 downto 0);
	signal tx_reg: std_logic_vector(7 downto 0);
begin

	sck_state: process(clk)
	begin
		if rising_edge(clk) then 
			sck_record <= sck_record(1 downto 0) & sck;
		end if;
	end process;
	
	cs_state: process(clk)
	begin
		if rising_edge(clk) then
			cs_record <= cs_record(1 downto 0) & cs;
		end if;
	end process;
	
	data_transfer : process(clk)
	begin
		if rising_edge(clk) then
			-- Indicate readiness a full clock cycle after bitcounter filling up
			if bitcounter >= 8 then
				in_data_ready <= '1';
			else
				in_data_ready <= '0';
			end if;
			
			if cs_record(2 downto 1) = "01" then --MOSI finished
				current_state <= '0';
				bitcounter <= to_unsigned(0,4);
				-- Load in next value
				tx_reg <= out_reg;
				tx_empty <= '1';
				out_reg <= "00000000";
			elsif cs_record(2 downto 1) = "10" then -- MOSI begin
				bitcounter <= to_unsigned(0,4);
				current_state <= '1';
			elsif current_state = '1' and sck_record(2 downto 1) = "01" then -- MOSI active, sck rising edge
				in_reg <= in_reg(6 downto 0) & '0'; -- SHift to the left by 1
				in_reg(0) <= mosi;
				bitcounter <= bitcounter + 1;
				if(bitcounter = 8) then
					current_state <= '0';
				end if;
			else
				input_shiftreg <= in_reg;
			end if;
			
			-- Data output
			if out_data_ready = '1' then
				out_reg <= output_shiftreg;
				tx_empty <= '0';
			end if;
			
			if cs_record(2 downto 1) = "01" then
				out_bitcounter <= to_unsigned(7,4);
			elsif cs_record(2 downto 1) = "10" then
				out_bitcounter <= to_unsigned(7,4);
			elsif current_state = '1' and sck_record(2 downto 1) = "10" then
				if out_bitcounter > 0 then
					out_bitcounter <= out_bitcounter - 1;
				end if;
			end if;
		end if;
	end process;
	
	miso <= tx_reg(to_integer(out_bitcounter));
	
--	in_data_ready <= '1' when bitcounter = 8
--					else '0';
end architecture;