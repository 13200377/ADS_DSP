library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.filter_types.all;
use work.filterDef.all;

entity PFB3 is
	port (
		clk: in std_logic;
		n_rst: in std_logic;
		
		x_n : in tapped_delay_line;
		write_en : in std_logic;
		write_ready: out std_logic := '1';
		
		y_k : out int_arr(0 to phaseCount-1)(31 downto 0);
		read_en : in std_logic;
		read_ready: out std_logic := '0'
	);
end entity;

architecture polyphase_filter_bank of PFB3 is
	component sumArr is
		generic(
			dataWidth: integer := 8;
			arrSize: integer := 1
		);
		port(
			arr : in int_arr(0 to arrSize-1)(dataWidth-1 downto 0);
			numOut : out signed(dataWidth-1 downto 0)
		);
	end component;
	
    -- Declare our coefficient array
    signal h_n : coeff_array;    

	signal tap_bank: pfb_product_arr := ( others =>     to_fi_15Q16(0,'0'));
	 
	signal tap_sum: fi_15Q16;
	
	signal phaseIndex : integer := phaseCount-1;
begin

    -- Coefficient array is internally generated in filter_types
    h_n <= h_fi;

	shift_index: -- shift the phase index. phaseIndex mux's taps, and demux's/commutates banks
	process(clk) is
		
		variable tempSum : int_arr(0 to phaseCount-1)(31 downto 0);
		variable commutator_buffer : int_arr(0 to phaseCount-1)(31 downto 0);
		
		variable write_performed: boolean := false;
		variable read_performed: boolean := false;
		variable reset_performed: boolean := false;
		variable dataReady: boolean := false;
		
		variable numVals: integer := 0;
	begin
		if rising_edge(clk) then
			-- Check for writes
			if write_en = '1' then
				tempSum(phaseIndex) := tap_sum;
				write_performed := true;
			else
				write_performed := false;
			end if;
		
			-- Check for reads
			if read_en = '1' then
				read_performed := true;
			else
				read_performed := false;
			end if;
			
			-- Check for reset
			if n_rst = '0' then
				reset_performed := true;
				tempSum := (others => to_fi_15Q16(0,'0'));
				write_performed := false;
				read_performed := false;
			else
				reset_performed := false;
			end if;
			
		elsif falling_edge(clk) then
			-- Action read
			if read_performed then
				read_ready <= '0';
				write_ready <= '1';
				dataReady := false;
			end if;
			
			-- Action write
			if write_performed then
				if numVals < filterOrder then
					numVals := numVals + 1;
				end if;
				
				
				if phaseIndex = 0 then
					commutator_buffer := tempSum;
					y_k <= commutator_buffer;
					if numVals >= phaseCount*(tapCount-1) + 1 then
						read_ready <= '1';
						write_ready <= '1';
						dataReady := true;
					end if;
				end if;
				
				
				-- If the next write will be to the final value
				-- but the read has not been cleared yet
				-- indicate that write should not be made
				if phaseIndex = 1 and dataReady then
					write_ready <= '0';
				end if;
				
				-- Increment phaseIndex with wrapping
				if phaseIndex = 0 then
					phaseIndex <= phaseCount - 1;
				else
					phaseIndex <= phaseIndex - 1;
				end if;
			end if;
			
			-- Action reset
			if reset_performed then
				phaseIndex <= phaseCount-1;
				dataReady := false;
				numVals := 0;
			end if;
		end if;
	end process;
	
	-- sum individual taps

	sum : sumArr generic map (32, tapCount) port map (prod_arr_to_int_arr(tap_bank), tap_sum);
	
	-- generate taps. Mux's filter coefficients and multiplies with x_n
	gen_taps:
	for tap in 0 to tapCount-1 generate
	begin
		--x_n isn't affected by phaseCount here, because x_n is changed externally
		tap_bank(tap) <=  h_n(tap*phaseCount + phaseIndex)*x_n(tap*phaseCount);
		-- tap_bank_truncated(tap) <= tap_bank(tap)(sampleWidth-1 downto 0);
	end generate;
	
end architecture;