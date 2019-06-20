LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--A REGISTER 4 BIT CONSISTS OF FOUR DFLIPFLOP CIRCUITS 

ENTITY register4bit IS 
     PORT (
     	D : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
        clk : IN std_logic ;
		WE : IN std_logic ;		--WRITE ENABLE SIGNAL
		Q : OUT std_logic_vector (3 DOWNTO 0) 
	);
END register4bit;

ARCHITECTURE register4bitArch OF register4bit IS 

	--INCLUDING THE DFLIPFLOP COMPONENT
	COMPONENT dFlipFlop IS 
		 PORT (
			D: IN std_logic  ;
			clk : IN std_logic ;
			WE : IN std_logic ;		--WRITE ENABLE SIGNAL
			Q : OUT std_logic 	  
	  );
	END COMPONENT ;

	BEGIN 
	
			--CREATING FOUR COMPONENTS OF THE DFLIPFLOP CIRCUIT
			F0 : dFlipFlop PORT MAP (D(0)  , clk , WE , Q(0) ) ;
			F1 : dFlipFlop PORT MAP (D(1) , clk , WE , Q(1)  ) ;
			F2: dFlipFlop PORT MAP (D(2)  , clk , WE , Q(2)  ) ;
			F3 : dFlipFlop PORT MAP (D(3)  , clk , WE , Q(3) ) ;
			
END register4bitArch ;


