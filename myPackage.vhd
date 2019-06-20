LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE myPackage IS

	TYPE muxInputs IS array(0 to 31) of std_logic_vector(31 DOWNTO 0);

	COMPONENT RegistersFile IS 
		 PORT (
			A1, A2, A3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
			WD3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			clk, WE3 : IN std_logic ;
			Re1, Re2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT RegistersFile;
	
	COMPONENT MUX32x1 IS 
		 PORT (
			A : IN muxInputs ;								--MUX INPUT
			clk : IN std_logic ;							--CLK SIGNAL
			Sel : IN std_logic_vector (4 DOWNTO 0)   ;		--SELECTOR
			MOUT : OUT std_logic_vector (31 DOWNTO 0) 		--MUX OUTPUT
		);
	END COMPONENT MUX32x1;
	
	COMPONENT DEMUX1x32 IS 
		 PORT (
			A : IN std_logic ;								--MUX INPUT
			clk : IN std_logic ;							--CLK SIGNAL
			Sel : IN std_logic_vector (4 DOWNTO 0) ; 		--SELECTOR
			MOUT: OUT std_logic_vector (31 DOWNTO 0)   		--MUX OUTPUT
		);
	END COMPONENT DEMUX1x32;
	
	COMPONENT register32bit IS 
		 PORT (
			D : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			clk : IN std_logic ;
			WE : IN std_logic ;		--WRITE ENABLE SIGNAL
			Q : OUT std_logic_vector (31 DOWNTO 0) 
		);
	END COMPONENT register32bit;

END PACKAGE myPackage ;