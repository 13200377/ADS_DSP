library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.math_real.all;

entity SPI_continuous is 
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

architecture SPI of SPI_continuous is   
	--type frame is std_logic_vector(frame_size-1 downto 0); -- Currently unused

	constant bitcounter_width : integer := integer(ceil(log2(real(frame_size + 1)))); -- Add 1 because we don't want bitcounter to wrap when we increment past frame_size
	
	signal sck_record: std_logic_vector(2 downto 0);
	signal cs_record : std_logic_vector(2 downto 0);
	
	-- signal current_state : std_logic;
	signal in_bitcounter    : unsigned(bitcounter_width-1 downto 0);
	signal out_bitcounter: unsigned(bitcounter_width-1 downto 0);
	
	
	-- signal out_reg: std_logic_vector(frame_size-1 downto 0);
	-- signal tx_reg_empty: std_logic := '1';
    
	
    -- variable out_reg : std_logic_vector(frame_size-1 downto 0) := (others => '0');
	
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
	

    -- SPI Data in and out process
    data_in  : process(clk)
        variable out_bitcounter : natural;
        variable in_bitcounter : natural := 0;
        variable in_reg : std_logic_vector(frame_size-1 downto 0) := (others => '0');
        variable tx_reg: std_logic_vector(frame_size-1 downto 0);
        variable out_reg: std_logic_vector(frame_size-1 downto 0);
        variable tx_empty_var : std_logic := '1';

    begin

        if rising_edge(clk) then

            -- Chip select released, init outbitcounter
            if cs_record(2 downto 1) = "11" then
                in_bitcounter := 0;
                out_bitcounter :=  0;
                out_reg := (others => '0');
                tx_empty_var := '1';
                tx_empty <= '1';
            end if;

            -- Data input (mosi)
            if indicate_read = '1' then  -- If input data has been read
                in_data_ready <= '0';     -- Reset data ready flag
            end if;

            -- read in from top level
            -- signi
            if out_data_ready = '1' then    -- Is output indicated as ready?
                out_reg := output_shiftreg; -- Load data into internal reg
                -- If tx_reg is waiting for data
                if out_bitcounter = 0 then
                    tx_reg := out_reg;
                    tx_empty <= '1';
                    tx_empty_var := '1';
                    out_bitcounter := 7;
                else 
                    tx_empty_var := '0';            -- Indicate internal reg has data
                    tx_empty <= '0';
                end if;
            end if;

            -- on rising edge of sck, capture mosi
            if sck_record(2 downto 0) = "001" then
                in_reg := in_reg(frame_size-2 downto 0) & '0'; -- Shift to the left by 1
                in_reg(0) := mosi;                  -- Place new bit at the start
                in_bitcounter := in_bitcounter + 1;       

                -- when the last bit recieved, update module output
                if (in_bitcounter = frame_size) then
                    input_shiftreg <= in_reg;
                    in_reg := (others => '0');
                    in_data_ready <= '1';
                    in_bitcounter := 0;
                end if;
                    
            end if;

            -- on falling edge of sck, update miso
            if sck_record(2 downto 0) = "100" then
                            -- Once we have output 8 bits, signal that we are out of data
                -- reset 
                if out_bitcounter = 0 then
                    -- we are out of data and grabbing new byte that was loaded to out_reg
                    if tx_empty_var = '0' then
                        tx_reg := out_reg;
                        tx_empty_var := '1';
                        tx_empty <= '1';
                    else 
                        -- we are out of data waiting for more
                        -- tx_empty_var := '1';
                    end if;
                    -- out_bitcounter := frame_size-1;
                else
                    if tx_empty = '0' then
                        -- decrement outbitcounter to move next bit onto miso
                        out_bitcounter := out_bitcounter -1;
                    end if;
                end if;
                
            end if;

        miso <= tx_reg(out_bitcounter);

        end if;

    end process;

	
end architecture;