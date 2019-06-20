LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.datapathPackage.ALL ;

ENTITY datapath IS 
     PORT (
		clk : IN STD_LOGIC 
	 );
END datapath;

ARCHITECTURE datapathArch OF datapath IS 

	SIGNAL pcSrc_2_1, jump_2_1, jr_2_1 : STD_LOGIC ;
	SIGNAL RD1_2_1, PcBranch_2_1 : STD_LOGIC_VECTOR (31 DOWNTO 0)  ;
	SIGNAL jumpAddress_2_1 : STD_LOGIC_VECTOR (27 DOWNTO 0)  ;
	SIGNAL PcPlus4_1, Instruction_1 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	
	SIGNAL LuiIn_5_2, RegWrite_5_2 : STD_LOGIC ;
	SIGNAL Instruction_2, PcPlus4_2, WriteData_5_2, SignImmData_5_2 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	SIGNAL RD1_2, RD2_2, shamt_2, signImm_2 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	SIGNAL LuiOut_2, RegWriteOut_2, unsignedSignal_2, sa_2, MemToRegSignal_2,l_half_2,l_byte_2,nop_2_1, MemWriteSignal_2, AluSrc_2 : STD_LOGIC ;
	SIGNAL AluControl_2: STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	SIGNAL A3In_5_2, A3Out_2: STD_LOGIC_VECTOR(4 DOWNTO 0) ;

	SIGNAL LuiIn_3, RegWriteIn_3, AluSrcSignal_3, MemWriteSignalIn_3, MemToRegSignalIn_3,l_half_3,l_byte_3, shamtSignal_3, unsignedSignal_3 : STD_LOGIC ;
	SIGNAL AluControlSignal_3 : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	SIGNAL RD1_3, RD2_3, signImmIn_3, shamt_3 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	SIGNAL AluResult_3, WriteData_3, signImmOut_3 : STD_LOGIC_VECTOR (31 DOWNTO 0) ; 
	SIGNAL LuiOut_3, RegWriteOut_3, MemWriteSignalOut_3, MemToRegSignalOut_3 : STD_LOGIC ;
	SIGNAL A3In_3, A3Out_3: STD_LOGIC_VECTOR(4 DOWNTO 0) ;

	SIGNAL LuiIn_4, RegWriteIn_4, MemWriteSignal_4,l_half_4,l_byte_4, MemToRegSignalIn_4 : STD_LOGIC ;
	SIGNAL AluResultIn_4, WriteData_4, signImmIn_4 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	SIGNAL AluResultOut_4, RD_4, signImmOut_4 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	SIGNAL LuiOut_4, RegWriteOut_4, MemToRegSignalOut_4 : STD_LOGIC ;
	SIGNAL A3In_4, A3Out_4: STD_LOGIC_VECTOR(4 DOWNTO 0) ;
	

	SIGNAL LuiIn_5, RegWriteIn_5, MemToReg_5 ,l_half_5,l_byte_5: STD_LOGIC ;
	SIGNAL AluResult_5, RD_5, signImmIn_5 : STD_LOGIC_VECTOR (31 DOWNTO 0) ;
	SIGNAL A3In_5 : STD_LOGIC_VECTOR(4 DOWNTO 0) ;
	SIGNAL reset : std_logic ; 

	BEGIN
	reset<= jr_2_1 or jump_2_1 or pcSrc_2_1 ; 
	
	
	
	
	
		S1  : stageOne PORT MAP(pcSrc_2_1, jump_2_1, jr_2_1, nop_2_1,clk, RD1_2_1
				, PcBranch_2_1, jumpAddress_2_1, PcPlus4_1, Instruction_1) ;
				
		S2  : stageTwo PORT MAP(clk, LuiIn_5_2, RegWrite_5_2, A3In_5_2, Instruction_2
				, PcPlus4_2 , WriteData_5_2, SignImmData_5_2 , RD1_2, RD2_2, shamt_2, signImm_2
				, PcBranch_2_1, jumpAddress_2_1 , LuiOut_2, RegWriteOut_2, unsignedSignal_2
				, sa_2, MemToRegSignal_2, MemWriteSignal_2, AluSrc_2,l_half_2,l_byte_2,nop_2_1
				, pcSrc_2_1, jump_2_1, jr_2_1, A3Out_2, AluControl_2);
				
		S3  : stageThree PORT MAP(LuiIn_3, RegWriteIn_3, AluSrcSignal_3 , MemWriteSignalIn_3
				, MemToRegSignalIn_3 , shamtSignal_3, unsignedSignal_3, A3In_3
				, AluControlSignal_3, clk, RD1_3, RD2_3 , signImmIn_3, shamt_3, AluResult_3
				, WriteData_3, signImmOut_3 , LuiOut_3, RegWriteOut_3, MemWriteSignalOut_3
				, MemToRegSignalOut_3, A3Out_3) ;
		
		S4  : stageFour PORT MAP(clk, LuiIn_4, RegWriteIn_4, MemWriteSignal_4, MemToRegSignalIn_4
				, A3In_4, AluResultIn_4 , WriteData_4, signImmIn_4, AluResultOut_4, RD_4
				, signImmOut_4 , LuiOut_4, RegWriteOut_4, MemToRegSignalOut_4, A3Out_4);
	
		S5  : stageFive PORT MAP(LuiIn_5, RegWriteIn_5, MemToReg_5,l_half_5,l_byte_5, A3In_5, AluResult_5
				, RD_5, signImmIn_5 , WriteData_5_2, SignImmData_5_2, LuiIn_5_2, RegWrite_5_2
				, A3In_5_2) ;
				
		A1  : regaux1 PORT MAP(Instruction_1, PcPlus4_1, Instruction_2, PcPlus4_2, clk) ;
		
		A2  : regaux2 PORT MAP(unsignedSignal_2, sa_2, MemToRegSignal_2, MemWriteSignal_2
				, AluControl_2, AluSrc_2, RD1_2, RD2_2, signImm_2, shamt_2, LuiOut_2
				, RegWriteOut_2, A3Out_2,l_half_2,l_byte_2, unsignedSignal_3, shamtSignal_3, MemToRegSignalIn_3
				, MemWriteSignalIn_3 , AluControlSignal_3, AluSrcSignal_3, RD1_3, RD2_3
				, signImmIn_3, shamt_3 , LuiIn_3, RegWriteIn_3, A3In_3,l_half_3,l_byte_3, reset,clk) ;
				
		A3  : regaux3 PORT MAP(MemToRegSignalOut_3, MemWriteSignalOut_3, LuiOut_3, RegWriteOut_3
				, A3Out_3, AluResult_3 , WriteData_3, signImmOut_3,l_half_3,l_byte_3, MemToRegSignalIn_4
				, MemWriteSignal_4, LuiIn_4, RegWriteIn_4, A3In_4
				, AluResultIn_4, WriteData_4, signImmIn_4, l_half_4,l_byte_4,clk) ;
				
		A4  : regaux4 PORT MAP(MemToRegSignalOut_4, LuiOut_4, RegWriteOut_4, A3Out_4, RD_4
				, AluResultOut_4, signImmOut_4,l_half_4,l_byte_4 , MemToReg_5, LuiIn_5, RegWriteIn_5, A3In_5
				, RD_5, AluResult_5, signImmIn_5,l_half_5, l_byte_5 ,clk) ;
	
END datapathArch ;


