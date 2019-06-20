LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY InstructionMemory IS
	PORT (
		clk : IN STD_LOGIC ;									--CLK SIGNAL
		pc : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;					--PC VALUE
		instructionOutput : Out STD_LOGIC_VECTOR (31 DOWNTO 0)	--OUTPUT INSTRUCTION
	) ;
END InstructionMemory ;
	
ARCHITECTURE InstructionMemoryBehaviour OF InstructionMemory IS

	--DEFINING AND CREATING THE MEMORY TYPE (32 BIT ROW X 128 BIT COLUMN) ... (4KB)
	TYPE InstructionMemoryType IS ARRAY (0 TO (2**16)-1) OF STD_LOGIC_VECTOR(31 DOWNTO 0) ;
	SIGNAL instructions : InstructionMemoryType ;
	
	BEGIN
	
				--INSTRUCTIONS
		instructions(0)  <= "00111100000010000000000000001101" ; -- lui $t0,13
		instructions(1)  <= "00111100000010010000000000001000" ; -- lui $t1,8
		instructions(2)  <= "00111100000000000000000000000000" ; -- lui $0,0
		instructions(3)  <= "00111100000010100001101001111101" ; -- lui $t2,3898
		instructions(4)  <= "00111100000010111010101111001101" ; -- lui $t3,43981
		instructions(5)  <= "00111100000011000000000000001000" ; -- lui $t4,6781
		-- START 
		instructions(6)  <= "00000001000010010100000000100000" ; -- add $t0,$t0,$t1 
		instructions(7)  <= "00100001001010000000000000000100" ; -- addi $t0,$t1,4 
		instructions(8) <= "00100101001010001111111111111111" ; -- addiu $t0,$t1,65535 
		instructions(9) <= "10101101001010110000000000000000" ; -- sw $t3,0($t1)
		instructions(10) <= "10001101001010010000000000000000" ; -- lw $t1,0($t1)
		instructions(11) <= "10000001000010000000000000000000" ; -- lb $t0,0($t0)
		instructions(12) <= "10000101000010000000000000000000" ; -- lh $t0,0($t0)
		instructions(13) <= "00000001010010110100000000100111" ; -- nor $t0,$t2,$t3
		instructions(14) <= "00000001010010110100000000100101" ; -- or $t0,$t2,$t3
		instructions(15) <= "00110101010010000111101100000000" ; -- ori $t0,$t2,31488
		instructions(16) <= "00000001001010000100000000101010" ; -- slt $t0,$t1,$t0
		instructions(17) <= "00101001001010000000000000000101" ; -- slti $t0,$t1,5
		instructions(18) <= "00101101001010001000000000000101" ; -- sltiu $t0,$t1,65541
		instructions(19) <= "00000001001010100100000000101011" ; -- sltu $t0,$t1,$t2
		instructions(20) <= "00000001001010010100000000100010" ; -- sub $t0,$t1,$t1
		instructions(21) <= "00000001001010100100000000100011" ; -- subu $t0,$t1,$t2
		instructions(22) <= "00000001010010110100000000100110" ; -- xor $t0,$t2,$t3
		instructions(23) <= "00111001010010001011000100100011" ; -- xori $t0,$t1,45347
		instructions(24) <= "00000001001000000100000010000000" ; -- sll $t0,$t1,2
		instructions(25) <= "00000001001011000100000000000100" ; -- sllv $t0,$t1,$t4
		instructions(26) <= "00000001001000000100000010000010" ; -- srl $t0,$t1,2
		instructions(27) <= "00000001001011000100000000000110" ; -- srlv $t0,$t1,$t4
		instructions(28) <= "00111100000011010000000000000001" ; -- lui $t5,1		
		instructions(29) <= "00010001001010000000000000010010" ; -- beq $t0,$t1,label
		instructions(30) <= "00001000000000000000000000100011" ; -- j addr(35)
		instructions(31) <= "10101101101010000000000000000000" ; -- sw $t0,$0($t5)
		instructions(32) <= "10001101101010000000000000000000" ; -- lw $t0,$0($t5)
		instructions(33) <= "10000001000010000000000000000000" ; -- lb $t0,0($t0)
		instructions(34) <= "10000101000010000000000000000000" ; -- lh $t0,0($t0)
		instructions(35) <= "00111100000100000000000000010100" ;
		instructions(36) <= "00111100000100010000000000000110" ;
		instructions(37) <= "00111100000100100000000000000110" ;
		instructions(38) <= "00111100000100110000000000000110" ;
		instructions(39) <= "00111100000101000000000000000110" ;
		instructions(40) <= "00111100000101010000000000000110" ;
		instructions(41) <= "00000010000100111001000000100000" ;
		instructions(42) <= "10101110000100010000000000000000" ; -- SW , Rs = 16 , Rt = 17
		instructions(43) <= "00111100000100000000000000010100" ;
		instructions(44) <= "00111100000100000000000000010100" ;
		instructions(45) <= "00000000000100101001100010000000" ; -- sll $19,$18,2
		instructions(46) <= "00111100000100000000000000010100" ;
		instructions(47) <= "00111100000100000000000000010100" ;
		instructions(48) <= "10001110000100110000000000000000" ; -- LW , Rs = 16 , Rt = 17
		instructions(49) <= "00001000000000000000000000001000" ; -- LW , Rs = 16 , Rt = 17
		instructions(50) <= "00111100000100000000000000010100" ;
		instructions(51) <= "00111100000100000000000000010100" ;
		instructions(52) <= "00111100000100000000000000010100" ;
		instructions(53) <= "00111100000100000000000000010100" ;
		instructions(54) <= "00111100000100000000000000010100" ;
		
		
		
		InstructionMemoryProcess : PROCESS(clk, pc) IS
			BEGIN
				IF clk = '1' OR clk'event THEN
					instructionOutput <= instructions(TO_INTEGER(UNSIGNED(pc(15 downto 0))/4)) ;
				END IF ;
			END PROCESS ;
				
END InstructionMemoryBehaviour ;

