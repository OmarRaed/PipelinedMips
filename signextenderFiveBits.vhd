library ieee;
use ieee.std_logic_1164.all;
entity signextenderFiveBits is 
port( se_in:in std_logic_vector(4 downto 0);
 	
	se_out:out std_logic_vector(31 downto 0)
);

end signextenderFiveBits;
 
architecture behavioral of signextenderFiveBits is

begin

	se_out <= "000000000000000000000000000" & se_in when se_in(4)='0' else
				"111111111111111111111111111" &se_in ;

end behavioral;
