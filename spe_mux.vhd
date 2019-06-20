LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_spec IS
	PORT(
	a,b,c,d,f,e:IN STD_LOGIC;
	SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	y:OUT STD_LOGIC);
END MUX_spec;

ARCHITECTURE behave_of_mux8_1 OF MUX_spec IS
	BEGIN
		PROCESS(a,b,c,d,e,f,SEL)
		BEGIN
			CASE SEL IS
				WHEN"000"=> y<=a;
				WHEN"001"=> y<=b;
				WHEN"010"=> y<=c;
				WHEN"011"=> y<=d;
				WHEN"100"=> y<=f;
				WHEN"101"=> y<=e;
				WHEN OTHERS=> y<='Z';
			END CASE;
		END PROCESS;
END behave_of_mux8_1;