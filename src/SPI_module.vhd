library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.math_real.all;

entity SPI_module is 
	generic(
		frame_size: positive := 8
	);
	port (
		clk: in std_logic;
		sck: in std_logic;
		mosi: in std_logic;
		miso: out std_logic;
		cs: in std_logic;
		input_shiftreg: out std_logic_vector(frame_size-1 downto 0);
		output_shiftreg: in std_logic_vector(frame_size-1 downto 0);
		out_data_ready: in std_logic;
		in_data_ready: out std_logic :='0';
		indicate_read: in std_logic;
		tx_empty: out std_logic := '1'
	);

end entity;

architecture SPI of SPI_Module is
	--type frame is std_logic_vector(frame_size-1 downto 0); -- Currently unused

	constant bitcounter_width : integer := integer(ceil(log2(real(frame_size + 1)))); -- Add 1 because we don't want bitcounter to wrap when we increment past frame_size
	
	signal sck_record: std_logic_vector(2 downto 0);
	signal cs_record : std_logic_vector(2 downto 0);
	
	signal current_state : std_logic;
	signal bitcounter    : unsigned(bitcounter_width-1 downto 0);
	signal out_bitcounter: unsigned(bitcounter_width-1 downto 0);
	
	
	signal out_reg: std_logic_vector(frame_size-1 downto 0);
	signal tx_reg:  std_logic_vector(frame_size-1 downto 0);
	signal tx_reg_empty: std_logic := '1';
	
	
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
	variable in_reg : std_logic_Vector(frame_size-1 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			
			-- Data input (mosi)
			if indicate_read = '1' then  -- If input data has been read
				in_data_ready <= '0';     -- Reset data ready flag
			end if;
			
			if cs_record(2 downto 1) = "01" then  -- CS rising edge - transfer finished
				input_shiftreg <= in_reg;
				in_data_ready <= '1';             -- We indicate data as being ready when CS asserts
				in_reg := (others => '0');        -- Reset internal register
				current_state <= '0';             -- Indicate transfer is inactive
				bitcounter <= to_unsigned(0,bitcounter_width);   -- Reset bitcounter
				
			elsif cs_record(2 downto 1) = "10" then -- transfer begin
				bitcounter <= to_unsigned(0,bitcounter_width);   -- Reset bitcounter
				current_state <= '1';             -- Indicate tx is active
				if tx_reg_empty = '0' then        -- If data has been entered for tx
					tx_reg_empty <= '1';          -- Indicate data has been loaded, to allow for new values to be entered
					tx_reg <= out_reg;            -- Load in next value
					-- Reset output values
					tx_empty <= '1';               
					out_reg <= (others => '0');
				end if;
			elsif current_state = '1' and sck_record(2 downto 1) = "01" then -- MOSI active, sck rising edge
				in_reg := in_reg(frame_size-2 downto 0) & '0'; -- Shift to the left by 1
				in_reg(0) := mosi;                  -- Place new bit at the start
				bitcounter <= bitcounter + 1;       
				if(bitcounter >= frame_size) then   -- Check if full window has been received
					current_state <= '0';           -- Indicate transfer finished
				end if;
			end if;
			
			-- Data output (miso)
			
			if out_data_ready = '1' then    -- Is output indicated as ready?
				out_reg <= output_shiftreg; -- Load data into internal reg
				tx_empty <= '0';            -- Indicate internal reg has data
				tx_reg_empty <= '0';
			end if;
			
			if cs_record(2 downto 1) = "01" then    -- On transfer end
				out_bitcounter <= to_unsigned(frame_size-1,bitcounter_width); -- Set output bitcounter to 7
			elsif cs_record(2 downto 1) = "10" then -- On transfer start
				out_bitcounter <= to_unsigned(frame_size-1,bitcounter_width); -- Set output bitcounter to 7
			elsif current_state = '1' and sck_record(2 downto 1) = "10" then -- If transfer active, sck falling edge
				-- Safely decrement bit_counter
				if out_bitcounter > 0 then               
					out_bitcounter <= out_bitcounter - 1; 
				end if;
			end if;
		end if;
	end process;
	
	miso <= tx_reg(to_integer(out_bitcounter));
end architecture;