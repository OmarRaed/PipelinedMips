LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY AdderFour IS
	PORT(
		clk : IN STD_LOGIC ;
		PCIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
		PCOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END AdderFour ;

ARCHITECTURE Behav OF AdderFour IS

	BEGIN 
		
		PROCESS(PCIN ,clk) 
			BEGIN
				IF clk = '1' THEN
					PCOUT <= PCIN + 4 ;
				END IF ;
		END PROCESS ;
		
END Behav ;
		