LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.stageThreePackage.ALL;


ENTITY stageThree IS 
     PORT (
     	LuiIn, RegWriteIn, AluSrcSignal, MemWriteSignalIn, MemToRegSignalIn, shamtSignal, unsignedSignal : IN STD_LOGIC ;
     	A3In : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		AluControlSignal : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
        clk : IN STD_LOGIC ;
		RD1, RD2, signImmIn, shamt : IN STD_LOGIC_VECTOR (31 DOWNTO 0) ;
		AluResult, WriteData, signImmOut : OUT STD_LOGIC_VECTOR (31 DOWNTO 0) ; 
		LuiOut, RegWriteOut, MemWriteSignalOut, MemToRegSignalOut : OUT STD_LOGIC ;
		A3Out : Out STD_LOGIC_VECTOR(4 DOWNTO 0) 

	);
END stageThree;

ARCHITECTURE stageThreeArch OF stageThree IS 

	SIGNAL srcA, srcB, sa : STD_LOGIC_VECTOR(31 downto 0) ;
	SIGNAL zero : STD_LOGIC ;

	BEGIN 

	srcA <= RD1 ;
	WriteData <= RD2 ;
	LuiOut <= LuiIn ;
	RegWriteOut <= RegWriteIn ;
	signImmOut <= signImmIn ;
	MemWriteSignalOut <= MemWriteSignalIn ;
	MemToRegSignalOut <= MemToRegSignalIn ;
	A3Out <= A3In ;
	
		M1 : mux_2_1 PORT MAP (AluSrcSignal, RD2, signImmIn, srcB) ;
		M2 : mux_2_1 PORT MAP (shamtSignal, srcA, shamt, sa) ;
		arethmatic : alu PORT MAP (srcA, srcB, sa, unsignedSignal, AluControlSignal,
										AluResult, zero) ;
		
END stageThreeArch ;


