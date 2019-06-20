library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY comparator IS 
	PORT (
		a, b : IN std_logic_VECTOR(31 DOWNTO 0) ;
		clk : IN STD_LOGIC ;
		greater,less,equal : OUT std_logic
	);
END comparator ;


ARCHITECTURE Behave OF comparator IS 
	
	BEGIN

		PROCESS (a, b, clk) 
			BEGIN
				IF(clk = '1') THEN
							
					IF a > b THEN  greater <= '1' ;
					ELSE  greater<= '0' ; 
					END IF ;
					
					IF a < b THEN  less <= '1' ;
					ELSE less <='0' ; 
					END IF ;
					
					IF a = b THEN  equal <= '1' ;
					ELSE equal <='0' ; 
					END IF ;
				
				END IF ;
		END PROCESS ;
	
END Behave ;