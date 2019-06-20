LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE stageThreePackage IS

	TYPE muxInputs IS array(0 to 31) of std_logic_vector(31 DOWNTO 0);

	COMPONENT mux_2_1 IS
		PORT(
			sel: IN STD_LOGIC;
			a  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			b  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			c  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT alu IS 
		 PORT (
			srcA, srcB, shamt : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			unsignedSignal : IN STD_LOGIC ;
			aluControl : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;		
			aluResult : OUT std_logic_vector (31 DOWNTO 0) ;
			zero : OUT STD_LOGIC
		);
	END COMPONENT;
	
END PACKAGE stageThreePackage ;