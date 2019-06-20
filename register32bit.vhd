LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--A REGISTER 32 BIT CONSISTS OF TWO 16 BIT REGISTERS CIRCUITS 

ENTITY register32bit IS 
     PORT (
     	D : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
        clk : IN std_logic ;
		WE : IN std_logic ;		--WRITE ENABLE SIGNAL
		Q : OUT std_logic_vector (31 DOWNTO 0) 
	);
END register32bit;

ARCHITECTURE register32bitArch OF register32bit IS 

	--INCLUDING THE 16 BIT REGISTER COMPONENT
	COMPONENT register16bit IS 
     PORT (
     	D : IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
        clk : IN std_logic ;
		WE : IN std_logic ;		--WRITE ENABLE SIGNAL
		Q : OUT std_logic_vector (15 DOWNTO 0) 
	);
	END COMPONENT;

	BEGIN 
	
			--CREATING TWO COMPONENTS OF THE 16 BIT REGISTER CIRCUIT
			F0 : register16bit PORT MAP (D(31 DOWNTO 16)  , clk , WE , Q(31 DOWNTO 16) ) ;
			F1 : register16bit PORT MAP (D(15 DOWNTO 0)  , clk , WE , Q(15 DOWNTO 0) ) ;
			
END register32bitArch ;


