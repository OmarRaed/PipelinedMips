LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE datapathPackage IS

	TYPE muxInputs IS array(0 to 31) of std_logic_vector(31 DOWNTO 0);

	COMPONENT stageOne IS 
		 PORT (
		pcSrc, jump, jr : IN STD_LOGIC ;
        nop,clk : IN std_logic ;
		RD1, PcBranch : IN std_logic_vector (31 DOWNTO 0)  ;
		jumpAddress : IN std_logic_vector (27 DOWNTO 0)  ;
		PcPlus4, Instruction : OUT std_logic_vector (31 DOWNTO 0) 
		);
	END COMPONENT;

	COMPONENT stageTwo IS 
		 PORT (clk, LuiIn, RegWriteIn : IN STD_LOGIC ;
		A3In : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		Instruction, PcPlus4, WriteData, SignImmData : IN std_logic_vector (31 DOWNTO 0) ;
		RD1, RD2, shamt, signImm, PcBranch : OUT std_logic_vector (31 DOWNTO 0) ;
		JumpOut : OUT std_logic_vector (27 DOWNTO 0) ;
		LuiOut, RegWriteOut, unsignedSignal, sa, MemToRegSignal, MemWriteSignal, AluSrc,l_half,l_byte,nop: OUT STD_LOGIC ;
		PcSrc, Jump, Jr: OUT STD_LOGIC ;
		A3Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		AluControl: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0) 
		);
	END COMPONENT;
	
	COMPONENT stageThree IS 
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
	END COMPONENT;
		
	COMPONENT stageFour IS 
		 PORT (
			clk, LuiIn, RegWriteIn, MemWriteSignal, MemToRegSignalIn : IN STD_LOGIC ;
			A3In : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
			AluResultIn, WriteData, signImmIn : IN std_logic_vector (31 DOWNTO 0) ;
			AluResultOut, RD, signImmOut : OUT std_logic_vector (31 DOWNTO 0) ;
			LuiOut, RegWriteOut, MemToRegSignalOut : OUT STD_LOGIC ;
			A3Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) 	
		);
	END COMPONENT;
	
	COMPONENT stageFive IS 
		 PORT (LuiIn, RegWriteIn, MemToReg ,l_half,l_byte: IN STD_LOGIC ;
		A3In : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		AluResult, RD, signImmIn : IN std_logic_vector (31 DOWNTO 0) ;
		writeData, signImmOut : OUT std_logic_vector (31 DOWNTO 0) ;
		LuiOut, RegWriteOut : OUT STD_LOGIC ;
		A3Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT regaux1 IS
		PORT (
			 instruction_f,pcplus4_f : IN std_logic_vector(31 DOWNTO 0);
			 ----------------------	
			 instruction_d,pcplus4_d : OUT std_logic_vector(31 DOWNTO 0); 
			 clk:IN std_logic 
			 );
	END COMPONENT;
	
	COMPONENT regaux2 IS
		PORT (
			  Unsignd_d    : IN std_logic;
			  Sa_d         : IN std_logic;
			  MemToReg_d   : IN std_logic;
			  MemWrite_d   : IN std_logic ;
			  AluControl_d : IN std_logic_vector(3 DOWNTO 0);
			  ALUSrc_d     : IN std_logic;
			  RD1_d        : IN std_logic_vector(31 DOWNTO 0);
			  RD2_d        : IN std_logic_vector(31 DOWNTO 0);
			  SignExt_d    : IN std_logic_vector(31 DOWNTO 0);
			  shamt_d      : IN std_logic_vector(31 DOWNTO 0);
			  Lui_d        : IN std_logic;
			  RegWrite_d   : IN std_logic;
			  A3_d     : IN std_logic_vector(4 DOWNTO 0);
			  L_half_d : IN std_logic;
			  l_byte_d : IN std_logic;
			  --------------------------------------------------
			  Unsignd_e    : OUT std_logic;
			  Sa_e         : OUT std_logic;
			  MemToReg_e   : OUT std_logic;
			  MemWrite_e   : OUT std_logic ;
			  AluControl_e : OUT std_logic_vector(3 DOWNTO 0);
			  ALUSrc_e     : OUT std_logic;
			  RD1_e        : OUT std_logic_vector(31 DOWNTO 0);
			  RD2_e        : OUT std_logic_vector(31 DOWNTO 0);
			  SignExt_e    : OUT std_logic_vector(31 DOWNTO 0);
			  shamt_e      : OUT std_logic_vector(31 DOWNTO 0);
			  Lui_e        : OUT std_logic;
			  RegWrite_e   : OUT std_logic;
			  A3_e     : OUT std_logic_vector(4 DOWNTO 0);
			  L_half_e : OUT std_logic;
			  l_byte_e : OUT std_logic;
			  reset        : IN  std_logic;
			  clk          : IN std_logic
			  );
	END COMPONENT ;

	
	COMPONENT regaux3 IS
		PORT (
          MemtoReg_e   : IN std_logic;
          MemWrite_e   : IN std_logic;
		  Lui_e        : IN std_logic;
		  RegWrite_e   : IN std_logic;
		  A3_e         : IN std_logic_vector(4 DOWNTO 0) ;
          AluResult_e  : IN std_logic_vector(31 DOWNTO 0);
          WriteData_e  : IN std_logic_vector(31 DOWNTO 0);
		  SignExt_e    : IN std_logic_vector(31 DOWNTO 0);
		  L_half_e : IN std_logic;
		  l_byte_e : IN std_logic;
		  ------------------------------------
		  MemtoReg_m   : OUT std_logic;
          MemWrite_m   : OUT std_logic;
		  Lui_m        : OUT std_logic;
		  RegWrite_m   : OUT std_logic;
		  A3_m         : OUT std_logic_vector(4 DOWNTO 0) ;
          AluResult_m  : OUT std_logic_vector(31 DOWNTO 0);
          WriteData_m  : OUT std_logic_vector(31 DOWNTO 0);
		  SignExt_m    : OUT std_logic_vector(31 DOWNTO 0);
		  L_half_m : OUT std_logic;
		  l_byte_m : OUT std_logic;
		  clk          : IN std_logic
			  );
    END COMPONENT ;

	
	COMPONENT regaux4 IS
		PORT (
		  MemtoReg_m   : IN std_logic;
		  Lui_m        : IN std_logic;
		  RegWrite_m   : IN std_logic;
		  A3_m         : IN std_logic_vector(4 DOWNTO 0);
          ReadData_m   : IN std_logic_vector(31 DOWNTO 0);
          AluOut_m     : IN std_logic_vector(31 DOWNTO 0);
		  SignExt_m    : IN std_logic_vector(31 DOWNTO 0);
		  L_half_m : IN std_logic;
		  l_byte_m : IN std_logic;
		  ------------------------------------
		  MemtoReg_l   : OUT std_logic;
		  Lui_l        : OUT std_logic;
		  RegWrite_l   : OUT std_logic;
		  A3_l         : OUT std_logic_vector(4 DOWNTO 0);
          ReadData_l   : OUT std_logic_vector(31 DOWNTO 0);
          AluOut_l     : OUT std_logic_vector(31 DOWNTO 0);
		  SignExt_l    : OUT std_logic_vector(31 DOWNTO 0);
		  L_half_l : OUT std_logic;
		  l_byte_l : OUT std_logic;
		  clk          : IN std_logic
			  );
	END COMPONENT ;
	
END PACKAGE datapathPackage ;