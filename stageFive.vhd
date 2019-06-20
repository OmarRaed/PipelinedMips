LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.stageTwoPackage.ALL ;

ENTITY stageFive IS 
     PORT (
		LuiIn, RegWriteIn, MemToReg ,l_half,l_byte: IN STD_LOGIC ;
		A3In : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		AluResult, RD, signImmIn : IN std_logic_vector (31 DOWNTO 0) ;
		writeData, signImmOut : OUT std_logic_vector (31 DOWNTO 0) ;
		LuiOut, RegWriteOut : OUT STD_LOGIC ;
		A3Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END stageFive;

ARCHITECTURE stageFiveArch OF stageFive IS 
	
	SIGNAL mx1_out,mx2_out,half_data,byte_data: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	
	COMPONENT signextender_8 IS 
		PORT( 
			se_in:IN std_logic_vector(7 DOWNTO 0);
			se_out:OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;
	

	BEGIN 

		signImmOut <= signImmIn ;
		LuiOut <= LuiIn ;
		RegWriteOut <= RegWriteIn ;
		A3Out <= A3In ;
		
	    sign_exe_b  : signextender_8 PORT MAP ( RD(7  DOWNTO 0) , byte_data) ;
	    sign_exe_h  : signextender   PORT MAP ( RD(15 DOWNTO 0) , half_data) ;
		MX1		 	: mux_2_1 PORT MAP (MemToReg, AluResult, RD,mx1_out ) ;
		MX2	   	 	: mux_2_1 PORT MAP (l_byte, mx1_out, byte_data, mx2_out) ;
		MX3			: mux_2_1 PORT MAP (l_half, mx2_out, half_data, writeData) ;
		
		
END stageFiveArch ;


