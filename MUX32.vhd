LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.myPackage.ALL;

ENTITY MUX32x1 IS 
     PORT (
		A : IN muxInputs ;								--MUX INPUT
        clk : IN std_logic ;							--CLK SIGNAL
       	Sel : IN std_logic_vector (4 DOWNTO 0)   ;		--SELECTOR
		MOUT : OUT std_logic_vector (31 DOWNTO 0) 		--MUX OUTPUT
	);
END MUX32x1;

ARCHITECTURE MUX32x1Arch OF MUX32x1 IS 
	BEGIN
		PROCESS (A, clk, Sel)
		BEGIN
			IF (clk = '1') THEN 			--IF CLK IS HIGH THEN SELECT OUTPUT
				CASE Sel IS					--CASE STATMENT TO CHECK THE SELECTOR VALUE
					WHEN "00000" => MOUT <= A(0)  ;	
					WHEN "00001" => MOUT <= A(1)  ;			
					WHEN "00010" => MOUT <= A(2)  ;		
					WHEN "00011" => MOUT <= A(3)  ;	
					WHEN "00100" => MOUT <= A(4)  ;
					WHEN "00101" => MOUT <= A(5)  ;
					WHEN "00110" => MOUT <= A(6)  ;
					WHEN "00111" => MOUT <= A(7)  ;
					WHEN "01000" => MOUT <= A(8)  ;
					WHEN "01001" => MOUT <= A(9)  ;
					WHEN "01010" => MOUT <= A(10) ;
					WHEN "01011" => MOUT <= A(11) ;
					WHEN "01100" => MOUT <= A(12) ;
					WHEN "01101" => MOUT <= A(13) ;
					WHEN "01110" => MOUT <= A(14) ;
					WHEN "01111" => MOUT <= A(15) ;					
					WHEN "10000" => MOUT <= A(16) ;
					WHEN "10001" => MOUT <= A(17) ;
					WHEN "10010" => MOUT <= A(18) ;
					WHEN "10011" => MOUT <= A(19) ;
					WHEN "10100" => MOUT <= A(20) ;
					WHEN "10101" => MOUT <= A(21) ;
					WHEN "10110" => MOUT <= A(22) ;
					WHEN "10111" => MOUT <= A(23) ;
					WHEN "11000" => MOUT <= A(24) ;
					WHEN "11001" => MOUT <= A(25) ;
					WHEN "11010" => MOUT <= A(26) ;
					WHEN "11011" => MOUT <= A(27) ;
					WHEN "11100" => MOUT <= A(28) ;
					WHEN "11101" => MOUT <= A(29) ;
					WHEN "11110" => MOUT <= A(30) ;
					WHEN "11111" => MOUT <= A(31) ;
					WHEN OTHERS => MOUT <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				END CASE;
			ELSE							--ELSE IF CLK IS LOW OUTPUT IS OPEN CIRCUIT
				MOUT <="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			END IF;
	END PROCESS;
	
END MUX32x1Arch ;



