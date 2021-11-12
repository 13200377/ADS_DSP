library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package filter_types is
	type uint_arr is array(natural range <>) of unsigned;
	type int_arr is array(natural range <>) of signed;
	type integer_arr is array(natural range <>) of integer;
	
	constant phaseCount : integer :=8;
	constant tapCount: integer := 8;
	constant filterOrder: integer := phaseCount * tapCount;

	constant sampleWidth : integer :=8;
	constant coeffWidth : integer :=6;
	constant filtOutputWidth : integer := sampleWidth + coeffWidth + integer(ceil(log2(real(phaseCount))))-1;
	constant filtProductWidth : integer := sampleWidth + coeffWidth;

	subtype sample is signed(sampleWidth-1 downto 0);
	subtype filtOutput is signed(filtOutputWidth-1 downto 0);
	subtype filtProduct is signed(filtProductwidth-1 downto 0);
	subtype coefficient is signed(coeffWidth-1 downto 0);

	type coeff_array is array(0 to filterOrder-1) of coefficient;
	type tapped_delay_line is array (0 to filterOrder-1) of sample;
	type pfb_output_arr is array (0 to phaseCount-1) of filtOutput;
	type pfb_product_arr is array (0 to tapCount-1) of filtProduct;

	-- This function creates a fixed point Q7.8 number.
	-- If is_frac = 1, the integer x is interpreted as a Q0.7 number
	-- If is_frac = 0, the integer x is interpreted as a Q7.0 number
	-- function to_fi_7Q8( x 	: in integer; 
	-- 					is_frac : in std_logic)
	-- 				    return sample;

	-- function to_fi_15Q16( x 	: in integer; 
	-- 				is_frac : in std_logic)
	-- 				return filtOutput;

	function fi_product_to_output( x  : in filtOutput)
								   return sample;

	function fi_filtsum_to_output( x : in filtOutput)
									return sample;

	function prod_arr_to_int_arr(x : in pfb_product_arr)
								return int_arr;

	function int_arr_to_tdl(x : in int_arr(0 to filterOrder-1)(sampleWidth-1 downto 0))
					return tapped_delay_line;

	function pfb_out_to_intarr(x : in pfb_output_arr )
			return int_arr;

	function tap_bank_to_output(x : in pfb_product_arr)
			return int_arr;

end package;

package body filter_types is

	function int_arr_to_tdl(x : in int_arr(0 to filterOrder-1)(sampleWidth-1 downto 0))
		return tapped_delay_line is
			variable out_arr : tapped_delay_line;
		begin
			for i in 0 to x'length-1 loop
				out_arr(i) := x(i);
			end loop;
		return out_arr;
	end function;

	function pfb_out_to_intarr(x : in pfb_output_arr )
	return int_arr is
		variable out_arr : int_arr(0 to phaseCount-1)(filtOutputWidth-1 downto 0);
	begin
		for i in 0 to x'length-1 loop
			out_arr(i) := x(i);
		end loop;
	return out_arr;
end function;
	
	function fi_product_to_output( x  : in filtOutput)
								   return sample is 
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
	variable out_arr : int_arr(0 to x'length-1)(filtOutputWidth-1 downto 0);
	begin
		for i in 0 to x'length-1 loop
			out_arr(i) := signed(x(i));
		end loop;
		return out_arr;
	end function;

	function fi_filtsum_to_output( x : in filtOutput)
									return sample is
	variable imd : filtOutput;
	begin
		imd := shift_right(x, 15);
		return resize(imd,8);
	end function;

	
	function tap_bank_to_output(x : in pfb_product_arr)
			return int_arr is
		variable out_arr : int_arr(0 to tapCount-1)(filtOutputWidth-1 downto 0);
	begin
		for i in 0 to x'length-1 loop
			out_arr(i) := resize(x(i),filtOutputWidth);
		end loop;
		return out_arr;
	end function;





end package body filter_types;