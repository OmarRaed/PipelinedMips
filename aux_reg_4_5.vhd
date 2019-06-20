LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- register 4 - MEM stage to final stage

ENTITY regaux4 IS
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
END ENTITY ;

ARCHITECTURE regaux4_behave OF regaux4 IS
    BEGIN
        PROCESS(clk)
			BEGIN
            IF ( clk'event and clk = '0') THEN
				MemtoReg_l <=MemtoReg_m ;
				ReadData_l <= ReadData_m ;
				AluOut_l <= AluOut_m;
				SignExt_l <= SignExt_m ;
				Lui_l <= Lui_m ;			
				RegWrite_l <= RegWrite_m ;			
				A3_l <= A3_m ;		
				L_half_l <= L_half_m ;
			    l_byte_l <= l_byte_m;				
		  
			END IF;
        END PROCESS;
    END ARCHITECTURE ;
