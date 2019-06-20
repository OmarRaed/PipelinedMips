library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY mux_2_1bit IS
	PORT(
		sel: IN STD_LOGIC;
		a, b  : IN STD_LOGIC ;
		c  : OUT STD_LOGIC
	);
END mux_2_1bit;

ARCHITECTURE behavioral OF mux_2_1bit IS
	BEGIN
		PROCESS (sel, a, b)
		BEGIN
			CASE SEL IS
				WHEN'0'=> c<=a;
				WHEN'1'=> c<=b;
				WHEN OTHERS=> c<='Z';
			END CASE;
		END PROCESS;	
END behavioral;