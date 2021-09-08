
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.math_real.all;

PACKAGE types IS

	CONSTANT taps        : INTEGER := 8; --number of fir filter taps
	CONSTANT data_width  : INTEGER := 8; --width of data input including sign bit

--	type uint_arr is array(natural range <>) of unsigned;
--	type int_arr is array(natural range <>) of signed;
	  
	TYPE coefficient_array 	IS ARRAY (0 TO taps-1) OF signed(data_width-1 DOWNTO 0);  --array of all coefficients
	TYPE fir_product_arr 	IS ARRAY (0 TO taps-1) OF SIGNED(data_width*2-1 DOWNTO 0); 
	TYPE tapped_delay_line 	IS ARRAY (0 TO taps-1) OF SIGNED(data_width-1 DOWNTO 0);                    --array of historic data values
	
	
	CONSTANT h	: coefficient_array := (to_signed(1,data_width),
                                        to_signed(2,data_width),
                                        to_signed(4,data_width),
                                        to_signed(8,data_width),
                                        to_signed(16,data_width),
                                        to_signed(32,data_width),
                                        to_signed(64,data_width),
                                        to_signed(128,data_width) );
                                        
END PACKAGE types;