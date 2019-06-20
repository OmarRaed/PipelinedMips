  LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY MainDecoder IS
	PORT (
		op        : IN std_logic_vector(5 DOWNTO 0);
		clk       : IN std_logic;
		regwrite  : OUT std_logic;
		regdst    : OUT std_logic_vector (1 downto 0);
		alusrc    : OUT std_logic;
		branch    : OUT std_logic;
        memwrite  : OUT std_logic;
		memtoreg  : OUT std_logic;
        aluop     : OUT std_logic_vector(3 DOWNTO 0);	
        jump      : OUT std_logic;
		jr        : OUT std_logic;
		lui       : OUT std_logic;
		B_type  : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		l_half    : OUT std_logic;
		l_byte    : OUT std_logic;
		nop       : OUT std_logic
		
	) ;
END MainDecoder ;
	
ARCHITECTURE MainDecoderBehav OF MainDecoder IS

	SIGNAL controlSignals : STD_LOGIC_VECTOR (19 DOWNTO 0) ;
	
	BEGIN
	
		PROCESS (op, clk)		
			
			BEGIN
			
			IF clk = '1' THEN
				
				CASE op IS
					WHEN "000000" => controlSignals <= "10100000010000XXX000" ;	 --Rtype Instruction
					WHEN "001000" => controlSignals <= "10010000000000XXX000" ;  --addi
					WHEN "001001" => controlSignals <= "10010001000000XXX000" ;  --addiu
					WHEN "001100" => controlSignals <= "10010000011000XXX000" ;  --andi
					WHEN "001111" => controlSignals <= "100X00XXXXX001XXX000" ;  --lui
					WHEN "001101" => controlSignals <= "10010000100000XXX000" ;  --ori
					WHEN "001010" => controlSignals <= "10010000101000XXX000" ;  --slti
					WHEN "001011" => controlSignals <= "10010001001000XXX000" ;  --sltiu
					WHEN "001110" => controlSignals <= "10010000110000XXX000" ;  --xori
					WHEN "000111" => controlSignals <= "0XX010X000100X000000" ;  --bgtz
					WHEN "010001" => controlSignals <= "0XX010X000100X001000" ;  --bltz
					WHEN "000100" => controlSignals <= "0XX010X000100X010000" ;  --beq
					WHEN "000101" => controlSignals <= "0XX010X000100X011000" ;  --bne
					WHEN "000001" => controlSignals <= "0XX010X000100X100000" ;  --bgez
					WHEN "000110" => controlSignals <= "0XX010X000100X101000" ;  --blez
					WHEN "000010" => controlSignals <= "0XXXX0XXXXX10XXXX000" ;  --j
					WHEN "000011" => controlSignals <= "110XX0XXXXX10XXXX000" ;  --jal
					WHEN "100011" => controlSignals <= "10010010000000XXX000" ;	--lw
					WHEN "101011" => controlSignals <= "0XX101X000000XXXX000" ;	--sw
					WHEN "100001" => controlSignals <= "10010010000000XXX100" ;	--lh
					WHEN "100000" => controlSignals <= "10010010000000XXX010" ;	--lb
					WHEN "111111" => controlSignals <= "ZZZZZZZZZZZZZZZZZZZ1" ;	--nop
					
					WHEN others   => controlSignals <= "ZZZZZZZZZZZZZZZZZZZZ" ;
				END CASE ;
				
			ELSE
			
				controlSignals <= "ZZZZZZZZZZZZZZZZZZZZ" ;
				
			END IF ;
			
		END PROCESS ;
		
		regwrite <= controlSignals(19) ;
		regdst   <= controlSignals(18 downto 17) ;
		alusrc   <= controlSignals(16) ;
		branch   <= controlSignals(15) ;
		memwrite <= controlSignals(14) ;
		memtoreg <= controlSignals(13) ;
		aluop 	 <= controlSignals(12 DOWNTO 9) ;
        jump     <= controlSignals(8) ;	
		jr       <= controlSignals(7) ;
		lui      <= controlSignals(6) ;
		B_type 	 <= controlSignals(5 DOWNTO 3) ;
		l_half   <= controlSignals(2) ;
		l_byte   <= controlSignals(1) ;
		nop      <= controlSignals(0) ;

END MainDecoderBehav ;

