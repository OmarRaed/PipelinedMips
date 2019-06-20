LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY Adder IS
	PORT(
		clk : IN STD_LOGIC ;
		A, B : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
		result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END Adder ;

ARCHITECTURE Behav OF Adder IS

	BEGIN 
		
		PROCESS(A, B ,clk) 
			BEGIN
				IF (clk = '1') THEN
					result <= A + B ;
				END IF ;
		END PROCESS ;
		
END Behav ;
		