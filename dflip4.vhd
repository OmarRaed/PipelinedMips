
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

--A DFLIPFLOP THAT WILL KEEP IT'S VALUE EVEN WHEN CLK SIGNAL IS LOW

ENTITY dFlipFlop IS 
     PORT (
		D: IN std_logic  ;		--INPUT
		clk : IN std_logic ;	--CLK SIGNAL
		WE : IN std_logic ;		--WRITE ENABLE SIGNAL
		Q: OUT std_logic   		--OUTPUT
	);
END dFlipFlop ;

ARCHITECTURE dFlipFlopArch OF dFlipFlop IS 

	BEGIN
	
		PROCESS (D, clk, WE)
			BEGIN 
				IF (clk = '1' AND WE = '1')THEN		--IF CLK SIGNAL IS HIGH...
					IF (D = '0') THEN		--IF INPUT IS LOW THE OUTPUT IS LOW
						Q <= '0' ;
					ELSIF (D = '1') THEN	--IF INPUTS IS HIGH THE OUTPUT IS HIGH
						Q <= '1' ;
					END IF ;   
				END IF ;
		END PROCESS ;
	
END dFlipFlopArch ;