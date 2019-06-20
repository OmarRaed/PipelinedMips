LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.stageOnePackage.ALL;


ENTITY stageOne IS 
     PORT (
     	pcSrc, jump, jr : IN STD_LOGIC ;
        nop,clk : IN std_logic ;
		RD1, PcBranch : IN std_logic_vector (31 DOWNTO 0)  ;
		jumpAddress : IN std_logic_vector (27 DOWNTO 0)  ;
		PcPlus4, Instruction : OUT std_logic_vector (31 DOWNTO 0) 
	);
END stageOne;

ARCHITECTURE stageOneArch OF stageOne IS 

	SIGNAL PcPlus4Signal, M1Out, M2Out, M3OUT,jumpAddressPC : STD_LOGIC_VECTOR(31 downto 0) ;
	SIGNAL PCSignal : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000" ;
	SIGNAL X : STD_LOGIC_VECTOR(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	BEGIN
	
		PcPlus4 <= PcPlus4Signal ;
		jumpAddressPC <= PcPlus4Signal(31 DOWNTO 28) & jumpAddress ;
		X<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;  
		M1 : mux_2_1 PORT MAP (pcSrc, PcPlus4Signal, PcBranch, M1Out) ;
		M2 : mux_2_1 PORT MAP (jump, M1Out, jumpAddressPC, M2Out) ;
		M3 : mux_2_1 PORT MAP (jr, M2Out, RD1, M3Out) ;
		pc : pcRegister PORT MAP (clk, M3Out, PCSignal) ;
		addFour : AdderFour PORT MAP (clk, PCSignal, PcPlus4Signal) ;
		INST_Mem:InstructionMemory PORT MAP (clk , PCSignal , Instruction ) ; 
			
END stageOneArch ;


