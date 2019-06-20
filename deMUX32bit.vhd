LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DEMUX1x32 IS 
     PORT (
		A : IN std_logic ;								--MUX INPUT
        clk : IN std_logic ;							--CLK SIGNAL
       	Sel : IN std_logic_vector (4 DOWNTO 0) ; 		--SELECTOR
		MOUT: OUT std_logic_vector (31 DOWNTO 0)   		--MUX OUTPUT
	);
END DEMUX1x32;

ARCHITECTURE DEMUX1x32Arch OF DEMUX1x32 IS 
	BEGIN
		PROCESS (A, clk, Sel)
		BEGIN
			IF (clk = '1') THEN 			--IF CLK IS HIGH THEN SELECT OUTPUT
				CASE Sel IS					--CASE STATMENT TO CHECK THE SELECTOR VALUE
					WHEN "00000" => MOUT <= (OTHERS => '0')  ;	
									MOUT(0) <= A  ;
					WHEN "00001" => MOUT <= (OTHERS => '0')  ;	
									MOUT(1) <= A  ;			
					WHEN "00010" => MOUT <= (OTHERS => '0')  ;	
									MOUT(2) <= A  ;		
					WHEN "00011" => MOUT <= (OTHERS => '0')  ;	
									MOUT(3) <= A  ;	
					WHEN "00100" => MOUT <= (OTHERS => '0')  ;	
									MOUT(4) <= A  ;
					WHEN "00101" => MOUT <= (OTHERS => '0')  ;	
									MOUT(5) <= A  ;
					WHEN "00110" => MOUT <= (OTHERS => '0')  ;	
									MOUT(6) <= A  ;
					WHEN "00111" => MOUT <= (OTHERS => '0')  ;	
									MOUT(7) <= A  ;
					WHEN "01000" => MOUT <= (OTHERS => '0')  ;	
									MOUT(8) <= A  ;
					WHEN "01001" => MOUT <= (OTHERS => '0')  ;	
									MOUT(9) <= A  ;
					WHEN "01010" => MOUT <= (OTHERS => '0')  ;	
									MOUT(10) <= A ;
					WHEN "01011" => MOUT <= (OTHERS => '0')  ;	
									MOUT(11) <= A ;
					WHEN "01100" => MOUT <= (OTHERS => '0')  ;	
									MOUT(12) <= A ;
					WHEN "01101" => MOUT <= (OTHERS => '0')  ;	
									MOUT(13) <= A ;
					WHEN "01110" => MOUT <= (OTHERS => '0')  ;	
									MOUT(14) <= A ;
					WHEN "01111" => MOUT <= (OTHERS => '0')  ;	
									MOUT(15) <= A ;					
					WHEN "10000" => MOUT <= (OTHERS => '0')  ;	
									MOUT(16) <= A ;
					WHEN "10001" => MOUT <= (OTHERS => '0')  ;	
									MOUT(17) <= A ;
					WHEN "10010" => MOUT <= (OTHERS => '0')  ;	
									MOUT(18) <= A ;
					WHEN "10011" => MOUT <= (OTHERS => '0')  ;	
									MOUT(19) <= A ;
					WHEN "10100" => MOUT <= (OTHERS => '0')  ;	
									MOUT(20) <= A ;
					WHEN "10101" => MOUT <= (OTHERS => '0')  ;	
									MOUT(21) <= A ;
					WHEN "10110" => MOUT <= (OTHERS => '0')  ;	
									MOUT(22) <= A ;
					WHEN "10111" => MOUT <= (OTHERS => '0')  ;	
									MOUT(23) <= A ;
					WHEN "11000" => MOUT <= (OTHERS => '0')  ;	
									MOUT(24) <= A ;
					WHEN "11001" => MOUT <= (OTHERS => '0')  ;	
									MOUT(25) <= A ;
					WHEN "11010" => MOUT <= (OTHERS => '0')  ;	
									MOUT(26) <= A ;
					WHEN "11011" => MOUT <= (OTHERS => '0')  ;	
									MOUT(27) <= A ;
					WHEN "11100" => MOUT <= (OTHERS => '0')  ;	
									MOUT(28) <= A ;
					WHEN "11101" => MOUT <= (OTHERS => '0')  ;	
									MOUT(29) <= A ;
					WHEN "11110" => MOUT <= (OTHERS => '0')  ;	
									MOUT(30) <= A ;
					WHEN "11111" => MOUT <= (OTHERS => '0')  ;	
									MOUT(31) <= A ;
					WHEN OTHERS => MOUT <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				END CASE;        
			ELSE							--ELSE IF CLK IS LOW OUTPUT IS OPEN CIRCUIT
				MOUT <="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			END IF;
	END PROCESS;
	
END DEMUX1x32Arch ;




