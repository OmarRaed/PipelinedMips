library ieee;
use ieee.std_logic_1164.all;
entity signextender_8 is 
port( se_in:in std_logic_vector(7 downto 0);
 	
	se_out:out std_logic_vector(31 downto 0)
);

end signextender_8;
 
architecture behav8 of signextender_8 is

begin

	se_out <= x"000000" &se_in when se_in(7)='0' else
		x"ffffff" &se_in ;

end behav8;
