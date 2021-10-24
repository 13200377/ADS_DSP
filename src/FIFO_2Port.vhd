library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
 
entity FIFO_2Port is 
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
        full    : in std_logic; 
        almost_full : in std_logic; 
         
        -- Read side 
        rd_clk  : in std_logic; 
        rd_enable : in std_logic;  
        rd_data : out std_logic_vector(data_width-1 downto 0); 
        empty   : out std_logic; 
        almost_empty : out std_logic  
    ); 
end FIFO_2Port; 
 
 
architecture arch of FIFO is 
 
type memory is array(0 to fifo_depth) of std_logic_vector(data_width-1 downto 0); 
 
-- Block of memory  
signal fifo_buffer : memory(0 to fifo_depth)(data_width downto 0); 
signal head : natural := 0; 
signal tail : natural := 0;
signal mem_count : natural := 0; -- amount of memory used 
 
signal mem_available : std_logic; 
 
constant af_threshold : natural := fifo_depth - 5; 
constant ae_threshold : natural := 5; 
 
function circular_increment(x : natural; maxval : natural) 
return natural is
    begin 
        if (x = (maxval-1)) then
            return 0; 
        else 
            return (x +1); 
        end if; 
end function circular_increment; 
 
 
begin 
 
    -- Asynchronously assign signals for info about fifo fullness 
    empty <= '1' when (head = tail) else '0'; 
    full <= '0' when (mem_count < fifo_depth-1) else '1'; 
 
    almost_full <= '1' when (mem_count > af_threshold) else '0'; 
    ae_threshold <= '0' when (mem_count < ae_threshold) else '0'; 
    -- mem_available <= '1' when (mem_count < fifo_depth-1) else '0'; 
    -- mem_unempty <= '1' when head /= tail else '0';  
    -- could also check when mem_count /= 0 
 
 
    -- FIFO Recieve: 
    -- 1. we need write enable high. alllows user to disable writes without disconnecting clock 
    -- 2. we need memory available 
    -- 3. data is written into the fifo on a wr_clock rising edge 
    fifo_rx : process(wr_clk) is 
    begin 
        -- Only write data in when write enable is high 
        if rising_edge(wr_clk)  then 
            if (NOT full) AND wr_enable then 
                fifo_buffer(head) <= signed(wr_data); 
                --if head has hit the end, circle back, otherwise increment 
                head <= circular_increment(head,fifo_depth); 
                -- mem_count increases because new data is stored 
                mem_count <= mem_count + 1; 
 
            else 
                -- Buffer overflow condition 
            end if; 
        end if;
    end process; 
 
     
    -- FIFO Tx: 
    -- 1. we need read enable high. alllows user to disable reads without disconnecting clock 
    -- 2. we need there to be data in the fifo 
    -- 3. data is read from the fifo on a rd_clock rising edge 
    fifo_tx : process(rd_clk) is 
    begin 
        if rising_edge(rd_clk) then 
            -- Ensure there is data available 
            if (NOT empty) AND rd_enable then
                rd_data <= fifo_buffer(tail); 
                --if tail has hit the end, circle back, otherwise increment 
                tail <= circular_increment(tail,fifo_depth); 
                -- mem count decreases because one data unit has been removed 
                mem_count <= mem_count - 1; 
            else 
                -- Nothing new to output 
                rd_data <= (others => '0'); 
            end if; 
        end if; 
 
    end process; 
             
 
end architecture;