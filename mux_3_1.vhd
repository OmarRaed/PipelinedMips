library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY mux_3_1 IS
	PORT(
		sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		a  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		b  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		c  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		d  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END mux_3_1;

ARCHITECTURE behavioral OF mux_3_1 IS
	BEGIN
		PROCESS (sel, a, b ,c)
		BEGIN
		
			CASE SEL IS
				WHEN"00"=> d<=a;
				WHEN"01"=> d<=b;
				WHEN"10"=> d<=c;
				WHEN OTHERS=> d<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			END CASE;
			
		END PROCESS ;	
END behavioral;