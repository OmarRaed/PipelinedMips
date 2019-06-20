LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY DataMemory IS
	PORT (
		clk, WE : IN STD_LOGIC ;									--CLK SIGNAL
		Addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;					--PC VALUE
		WD : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
		memoryOutput : Out STD_LOGIC_VECTOR (31 DOWNTO 0)	--OUTPUT INSTRUCTION
	) ;
	END DataMemory ;
	
ARCHITECTURE DataMemoryBehaviour OF DataMemory IS

	--DEFINING AND CREATING THE MEMORY TYPE (32 BIT ROW X 128 BIT COLUMN) ... (4KB)
	TYPE DataMemoryType IS ARRAY (0 TO (2**16)-1) OF STD_LOGIC_VECTOR(31 DOWNTO 0) ;
	SIGNAL memory : DataMemoryType ;
	BEGIN
        memory(0) <= "00000000000000000000000000000000" ;
		memory(1) <= "00000000000000000000000000000001" ;
		memory(2) <= "00000000000000000000000000000010" ;
		memory(3) <= "00000000000000000000000000000011" ;
		memory(4) <= "00000000000000000000000000000100" ;
		memory(5) <= "00000000000000000000000000000101" ;
		memory(6) <= "00000000000000000000000000000110" ;
		memory(7) <= "00000000000000000000000000000111" ;
		memory(8) <= "00000000000000000000000000001000" ;
		memory(9) <= "00000000000000000000000000001001" ;
		memory(10)<= "00000000000000000000000000001010" ;
	
	
		
		DataMemoryProcess : PROCESS(clk, WE, Addr) IS
		
			BEGIN
			
				--IF CLK SIGNAL IS HIGH AND WRITE ENABLE EQUAL ZERO THEN PASS THE OUTPUT VALUE
				IF clk = '1' AND WE = '0' THEN
				
					memoryOutput <= memory(TO_INTEGER(UNSIGNED(Addr(15 downto 0)))) ;
					
				--IF CLK SIGNAL IS HIGH AND WRITE ENABLE EQUAL ONE THEN WRITE TO MEMORY
				ELSIF clk = '1' AND WE = '1' THEN
				
					memory(TO_INTEGER(UNSIGNED(Addr(15 downto 0)))) <= WD ;
					memoryOutput <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;

				ELSE
				
					memoryOutput <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
					
				END IF ;
				
		END PROCESS ;
				
END DataMemoryBehaviour ;

