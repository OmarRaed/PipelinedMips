LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY stageFour IS 
     PORT (
		clk, LuiIn, RegWriteIn, MemWriteSignal, MemToRegSignalIn : IN STD_LOGIC ;
		A3In : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		AluResultIn, WriteData, signImmIn : IN std_logic_vector (31 DOWNTO 0) ;
		AluResultOut, RD, signImmOut : OUT std_logic_vector (31 DOWNTO 0) ;
		LuiOut, RegWriteOut, MemToRegSignalOut : OUT STD_LOGIC ;
		A3Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) 
	);
END stageFour;

ARCHITECTURE stageFourArch OF stageFour IS 
	
	COMPONENT DataMemory IS
		PORT (
			clk, WE : IN STD_LOGIC ;									--CLK SIGNAL
			Addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;					--PC VALUE
			WD : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			memoryOutput : Out STD_LOGIC_VECTOR (31 DOWNTO 0)	--OUTPUT INSTRUCTION
		) ;
	END COMPONENT ;

	BEGIN 

	AluResultOut <= AluResultIn ;
	LuiOut <= LuiIn ;
	RegWriteOut <= RegWriteIn ;
	MemToRegSignalOut <= MemToRegSignalIn ;
	signImmOut <= signImmIn ;
	A3Out <= A3In ;
	
		DM : DataMemory PORT MAP (clk, MemWriteSignal, AluResultIn, WriteData, RD) ;
		
END stageFourArch ;


