LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--A REGISTER 16 BIT CONSISTS OF FOUR 4 BIT REGISTERS CIRCUITS 

ENTITY register16bit IS 
     PORT (
     	D : IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
        clk : IN std_logic ;
		WE : IN std_logic ;		--WRITE ENABLE SIGNAL
		Q : OUT std_logic_vector (15 DOWNTO 0) 
	);
END register16bit;

ARCHITECTURE register16bitArch OF register16bit IS 

	--INCLUDING THE 4 BIT REGISTER COMPONENT
	COMPONENT register4bit IS 
     PORT (
     	D : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
        clk : IN std_logic ;
		WE : IN std_logic ;		--WRITE ENABLE SIGNAL
		Q : OUT std_logic_vector (3 DOWNTO 0) 
	);
	END COMPONENT;

	BEGIN 
	
			--CREATING FOUR COMPONENTS OF THE 4 BIT REGISTER CIRCUIT
			F0 : register4bit PORT MAP (D(15 DOWNTO 12)  , clk , WE , Q(15 DOWNTO 12) ) ;
			F1 : register4bit PORT MAP (D(11 DOWNTO 8)  , clk , WE , Q(11 DOWNTO 8) ) ;
			F2 : register4bit PORT MAP (D(7 DOWNTO 4)  , clk , WE , Q(7 DOWNTO 4) ) ;
			F3 : register4bit PORT MAP (D(3 DOWNTO 0)  , clk , WE , Q(3 DOWNTO 0) ) ;
			
END register16bitArch ;


