LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- register 2 - ID stage to EX stage

ENTITY regaux2 IS

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
			  A3_d     	   : IN std_logic_vector(4 DOWNTO 0);
			  L_half_d     : IN std_logic;
			  l_byte_d     : IN std_logic;
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
			  A3_e         : OUT std_logic_vector(4 DOWNTO 0);
			  L_half_e     : OUT std_logic;
			  l_byte_e     : OUT std_logic;
			  reset        : IN  std_logic;
			  clk          : IN  std_logic
			);
END ENTITY ;

ARCHITECTURE regaux2_behave OF regaux2 IS
    BEGIN
        PROCESS(clk,reset)
        BEGIN
			IF (reset = '1') THEN
					Unsignd_e <= '0' ;
					Sa_e   <= '0' ; 
					MemToReg_e <= '0' ;  
					MemWrite_e <= '0' ;
					AluControl_e <= "0000" ;
					ALUSrc_e <= '0' ;
					RD1_e <= "00000000000000000000000000000000" ; 
					RD2_e <= "00000000000000000000000000000000";       
					SignExt_e  <= "00000000000000000000000000000000" ;
					shamt_e <= "00000000000000000000000000000000" ;       
					Lui_e <= '0' ;       
					RegWrite_e <= '0' ;       
					A3_e <= "00000" ;       
					L_half_e <= '0' ;
					l_byte_e <= '0';
			ELSE
				IF( clk'event and clk = '0') THEN
					Unsignd_e <= Unsignd_d ;
					Sa_e   <= Sa_d ; 
					MemToReg_e <= MemToReg_d ;  
					MemWrite_e <= MemWrite_d ;
					AluControl_e <= AluControl_d ;
					ALUSrc_e <= ALUSrc_d ;
					RD1_e <= RD1_d ; 
					RD2_e <= RD2_d ;       
					SignExt_e  <= SignExt_d ;
					shamt_e <= shamt_d ;       
					Lui_e <= Lui_d ;       
					RegWrite_e <= RegWrite_d ;       
					A3_e <= A3_d ;       
					L_half_e <= L_half_d ;
					l_byte_e <= l_byte_d;
				END IF ;
			END IF ;
        END PROCESS;
    END ARCHITECTURE;
