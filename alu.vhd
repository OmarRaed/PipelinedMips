LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;   

ENTITY alu IS 
     PORT (
     	srcA, srcB, shamt : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
        unsignedSignal : IN STD_LOGIC ;
		aluControl : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;		
		aluResult : OUT std_logic_vector (31 DOWNTO 0) ;
		zero : OUT STD_LOGIC
	);
END alu;

ARCHITECTURE behav OF alu IS 

	SIGNAL output : STD_LOGIC_VECTOR(31 DOWNTO 0) ;

	BEGIN 
	
	aluResult <= output ;
	
		PROCESS(srcA, srcB, unsignedSignal, aluControl)
		BEGIN
			
			IF aluControl = "0000" THEN
				output <= srcA AND srcB ;
				
			ELSIF aluControl = "0001" THEN
				output <= srcA OR srcB ;
				
			ELSIF aluControl = "0010" THEN
				IF unsignedSignal ='0' THEN
					output <= STD_LOGIC_VECTOR( SIGNED(srcA) + SIGNED(srcB) ) ;
				ELSIF unsignedSignal = '1' THEN
					output <= STD_LOGIC_VECTOR( UNSIGNED(srcA) + UNSIGNED(srcB) ) ;
				END IF ;
					
			ELSIF aluControl = "0011" THEN
				output <= srcA XOR srcB ;
				
			ELSIF aluControl = "0100" THEN
				output <= STD_LOGIC_VECTOR(unsigned(srcB) sll TO_INTEGER(UNSIGNED(shamt))) ;
				
			ELSIF aluControl = "0101" THEN
				output <= STD_LOGIC_VECTOR(unsigned(srcB) srl TO_INTEGER(UNSIGNED(shamt))) ;
				
			ELSIF aluControl = "0110" THEN
				IF unsignedSignal = '0' THEN
					output <= STD_LOGIC_VECTOR( SIGNED(srcA) - SIGNED(srcB) ) ;
				ELSIF unsignedSignal = '1' THEN
					output <= STD_LOGIC_VECTOR( UNSIGNED(srcA) - UNSIGNED(srcB) ) ;
				END IF ;
					
			ELSIF aluControl = "0111" THEN
				IF unsignedSignal = '0' THEN	
					IF (SIGNED(srcA) < SIGNED(srcB))THEN
						output <= "00000000000000000000000000000001" ;
					ELSE
						output <= "00000000000000000000000000000000" ;
					END IF ;
				ELSIF unsignedSignal = '1' THEN
					IF ( UNSIGNED(srcA) < UNSIGNED(srcB) )THEN
						output <= "00000000000000000000000000000001" ;
					ELSE
						output <= "00000000000000000000000000000000" ;
					END IF ;
				END IF ;
			END IF ;
	END PROCESS ;
				
	PROCESS(output)
	BEGIN		

		IF output = "00000000000000000000000000000000" THEN
			zero <= '1' ;
		ELSE
			zero <= '0' ;
		END IF ;
		
	END PROCESS ;
			
END behav ;


