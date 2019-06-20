LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY AluDecoder IS 
    PORT (
       	op         : IN STD_LOGIC_VECTOR (3 DOWNTO 0) ; 
        fun        : IN STD_LOGIC_VECTOR (5 DOWNTO 0) ;
		clk        : IN STD_LOGIC ;
		aluControl : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		unsignedSignal, sa : OUT STD_LOGIC
	);
END AluDecoder;

ARCHITECTURE AluDecoderArch OF AluDecoder IS 

	SIGNAL aluSignals : STD_LOGIC_VECTOR(5 DOWNTO 0) ;

BEGIN  
PROCESS (op, clk , fun)
		BEGIN
			IF (clk = '1') THEN 			
				CASE op IS					
					WHEN "0000" => aluSignals <= "00100X"  ;	--AddId
					WHEN "1000" => aluSignals <= "10011X"  ;	--AddIU
					WHEN "0001" => aluSignals <= "01100X"  ;	--SubI
					WHEN "0011" => aluSignals <= "00000X"  ;	--AndI
					WHEN "0100" => aluSignals <= "00010X"  ;	--OrI
					WHEN "0101" => aluSignals <= "01110X"  ;	--SLTI
					WHEN "1001" => aluSignals <= "01111X"  ;	--SLTIU
					WHEN "0110" => aluSignals <= "00110X"  ;	--XORI
					WHEN "0010" => 
							IF    (fun ="100000") THEN aluSignals <= "00100X";	--ADD		 
							ELSIF (fun ="100001") THEN aluSignals <= "00101X";	--ADDU				 
							ELSIF (fun ="100010") THEN aluSignals <= "01100X";	--SUB					 
							ELSIF (fun ="100011") THEN aluSignals <= "01101X";	--SUBU					 
							ELSIF (fun ="100100") THEN aluSignals <= "00000X";	--And					 
							ELSIF (fun ="100101") THEN aluSignals <= "00010X";	--OR					 
							ELSIF (fun ="101010") THEN aluSignals <= "01110X";	--SLT					 
							ELSIF (fun ="101011") THEN aluSignals <= "01101X";	--SLTU					 
							ELSIF (fun ="100110") THEN aluSignals <= "00110X";	--XOR					 
							ELSIF (fun ="000000") THEN aluSignals <= "010001";	--SLL					 
							ELSIF (fun ="000100") THEN aluSignals <= "011000";	--SLLV					 
							ELSIF (fun ="000010") THEN aluSignals <= "010101";	--SRL					 
							ELSIF (fun ="000110") THEN aluSignals <= "010100";	--SRLV					 
							ELSIF (fun ="100111") THEN aluSignals <= "10000X";	--NOR
							ELSE
                                    aluSignals <= "ZZZZZZ" ;
							END IF ;
					WHEN OTHERS => aluSignals <= "ZZZZZZ";
				END CASE; 
			ELSE
                aluSignals <= "ZZZZZZ" ;
			END IF ;
	END PROCESS ;
	
	aluControl <= aluSignals(5 DOWNTO 2) ;
	unsignedSignal <= aluSignals(1) ;
	sa <= aluSignals(0) ;
	
END AluDecoderArch ;
	
