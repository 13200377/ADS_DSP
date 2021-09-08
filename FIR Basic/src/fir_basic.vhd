-- Implement a tapped delay line 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

use work.types.all;


entity fir_basic is
port(
		clk:	in std_logic;
		-- Incoming sample
		x_in:	in signed (data_width-1 downto 0);
		-- coefficients of filter h
--		h_in:	in coefficient_array;
		-- Outgoing sample
		y_out:	out signed (data_width*2-1 downto 0) := to_signed(0,data_width*2)

	);
end fir_basic;

architecture filter of fir_basic is

	-- tapped delay line of data
	signal tdl:			tapped_delay_line :=
   (to_signed(0,data_width),
    to_signed(0,data_width),
    to_signed(0,data_width),
    to_signed(0,data_width),
    to_signed(0,data_width),
    to_signed(0,data_width),
    to_signed(0,data_width),
    to_signed(0,data_width) );
	
	-- Products of coefficients and samples
	signal products: 	fir_product_arr := 
   (to_signed(0,data_width*2),
    to_signed(0,data_width*2),
    to_signed(0,data_width*2),
    to_signed(0,data_width*2),
    to_signed(0,data_width*2),
    to_signed(0,data_width*2),
    to_signed(0,data_width*2),
    to_signed(0,data_width*2) );
	 
--	 signal sum: signed(data_width*2-1 downto 0) := to_signed(0,data_width*2);
	

begin

	process(clk)
		variable fir_sum : signed (data_width*2-1 downto 0) := to_signed(0,data_width*2);
	begin
		if rising_edge(clk) then
			-- Grab coefficients : used outside process
--			h <= h_in;
			-- shift in next sample to tapped delay line
			tdl <= x_in & tdl(0 to taps-2); -- Make skilful use of the concatenation operator
			
		elsif falling_edge(clk) then
			-- Compute the sum of our products array
			fir_sum := to_signed(0,data_width*2);
			for i in 0 to taps-1 loop
				fir_sum := fir_sum + products(i);
			end loop;
--			sum <= fir_sum;
			y_out <= fir_sum;

		end if;
		-- Assign the next output sample
	end process;

	-- Asynchronously, lets perform multiplications 
	produc_calc: for i in 0 to taps-1 generate
		products(i) <= tdl(i) * h(i);
	end generate;

end filter;
