library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package filter_types is
	type uint_arr is array(natural range <>) of unsigned;
	type int_arr is array(natural range <>) of signed;

	constant sampleWidth : integer :=8;
	constant coeffWidth : integer :=8;

	constant phaseCount : integer :=4;
	constant tapCount: integer := 3;
	constant filterOrder: integer := phaseCount * tapCount;

	subtype fi_7Q8 is signed(15 downto 0);
	subtype fi_15Q16 is signed(31 downto 0);
	subtype sample_8bit is signed(7 downto 0);

	type coeff_array is array(0 to filterOrder-1) of fi_7Q8;
	type tapped_delay_line is array (0 to phaseCount*tapCount-1) of fi_7Q8;
	type pfb_product_arr is array (0 to tapCount-1) of fi_15Q16;
	type pfb_output_arr is array (0 to phaseCount-1) of fi_15Q16;

	-- This function creates a fixed point Q7.8 number.
	-- If is_frac = 1, the integer x is interpreted as a Q0.7 number
	-- If is_frac = 0, the integer x is interpreted as a Q7.0 number
	function to_fi_7Q8( x 	: in integer; 
						is_frac : in std_logic)
					    return fi_7Q8;

	function to_fi_15Q16( x 	: in integer; 
					is_frac : in std_logic)
					return fi_15Q16;

	function fi_product_to_output( x  : in fi_15Q16)
								   return fi_7Q8;

	function fi_filtsum_to_output( x : in fi_15Q16)
									return sample_8bit;

	function prod_arr_to_int_arr(x : in pfb_product_arr)
								return int_arr;

end package;

package body filter_types is
	function to_fi_7Q8(x : in integer;
					   is_frac : in std_logic)
				       return fi_7Q8 is

		variable y : signed(15 downto 0);
		variable imd : signed(7 downto 0);
	begin 
		imd := to_signed(x,8);
		if (is_frac = '1') then
			-- Put y in the low 8 bits
			y := resize(imd,16);
		elsif (is_frac = '0') then
			-- Move to high 8,              
			y := (resize(imd,16) sll 8);
		else
			-- Move to high 8,              
			y := (resize(imd,16) sll 8);
			end if;
		return y;
	end function;

	function to_fi_15Q16( x 	: in integer; 
						is_frac : in std_logic)
						return fi_15Q16 is
		variable y : signed(31 downto 0);
		variable x_signed : signed(15 downto 0);
	begin 
		x_signed := to_signed(x,16);
		if (is_frac = '1') then
			y := resize(x_signed,32);
		elsif (is_frac = '0') then
			-- Move to high 8,           
			y := (resize(x_signed,32) sll 16);
			return y;
		else
			-- Move to high 8,               
			y := (resize(x_signed,32) sll 16);
			end if;
		return y;
	end function;

	
	function fi_product_to_output( x  : in fi_15Q16)
								   return fi_7Q8 is 
		variable y : signed(31 downto 0);
		variable sign_mask : signed(15 downto 0);
	begin 
		-- Right shift logically by 8
		y:= (x srl 8);
		-- Truncate to 7Q8 and preserve sign bit
		return y(23 downto 8);
	end function;
		
	-- This function converts an array of type pfb_product_arr
	-- to an array of type int_arr.
	-- We do this when we want to use sumArr on a pfb_produc_arr!		
	function prod_arr_to_int_arr(x : in pfb_product_arr)
			return int_arr is
	variable out_arr : int_arr(0 to x'length-1)(31 downto 0);
	begin
		for i in 0 to x'length-1 loop
			out_arr(i) := signed(x(i));
		end loop;
		return out_arr;
	end function;

	function fi_filtsum_to_output( x : in fi_15Q16)
									return sample_8bit is
	variable imd : fi_15Q16;
	begin
		imd := x srl 15;
		return resize(imd,8);
	end function;



end package body filter_types;