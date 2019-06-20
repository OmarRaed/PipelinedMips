LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- register 3 - EX stage to MEM stage

ENTITY regaux3 IS
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
    END ENTITY ;

ARCHITECTURE  regaux3_behave OF regaux3 IS
    BEGIN
        PROCESS(clk)
        BEGIN
            IF( clk'event and clk = '0') THEN
           	
				MemtoReg_m <= MemtoReg_e ;
				MemWrite_m <= MemWrite_e ;
				Lui_m <= Lui_e ;
				RegWrite_m <= RegWrite_e ;
				A3_m <= A3_e ;
				AluResult_m <= AluResult_e ;
				WriteData_m <= WriteData_e;
				SignExt_m <= SignExt_e ;
				L_half_m <= L_half_e ;
			    l_byte_m <= l_byte_e;
			END IF;
        END PROCESS ;
    END ARCHITECTURE ;
