library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY mux_2_1 IS
	PORT(
		sel: IN STD_LOGIC;
		a  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		b  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		c  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END mux_2_1;

ARCHITECTURE behavioral OF mux_2_1 IS
	BEGIN
		PROCESS (sel, a, b)
		BEGIN
			CASE SEL IS
				WHEN'0'=> c<=a;
				WHEN'1'=> c<=b;
				WHEN OTHERS=> c<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			END CASE;
		END PROCESS;	
END behavioral;