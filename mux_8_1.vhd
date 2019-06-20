LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX8_1 IS
	PORT(
	x:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	y:OUT STD_LOGIC);
END MUX8_1;

ARCHITECTURE behave_of_mux8_1 OF MUX8_1 IS
	BEGIN
		PROCESS(x,SEL)
		BEGIN
			CASE SEL IS
				WHEN"000"=> y<=x(0);
				WHEN"001"=> y<=x(1);
				WHEN"010"=> y<=x(2);
				WHEN"011"=> y<=x(3);
				WHEN"100"=> y<=x(4);
				WHEN"101"=> y<=x(5);
				WHEN"110"=> y<=x(6);
				WHEN"111"=> y<=x(7);
				WHEN OTHERS=> y<='Z';
			END CASE;
		END PROCESS;
END behave_of_mux8_1;