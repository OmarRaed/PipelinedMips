LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE stageOnePackage IS

	TYPE muxInputs IS array(0 to 31) of std_logic_vector(31 DOWNTO 0);

	COMPONENT InstructionMemory IS
		PORT (
			clk : IN STD_LOGIC ;									--CLK SIGNAL
			pc : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;					--PC VALUE
			instructionOutput : Out STD_LOGIC_VECTOR (31 DOWNTO 0)	--OUTPUT INSTRUCTION
		) ;
	END COMPONENT InstructionMemory ;
	
	COMPONENT AdderFour IS
		PORT(
			clk : IN STD_LOGIC ;
			PCIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			PCOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT AdderFour ;
	
	COMPONENT pcRegister IS
		PORT( 
			clk: in std_logic; -- clock
			D: in std_logic_vector(31 downto 0); -- data input
			Q: out std_logic_vector(31 downto 0)); -- data output
			
	END COMPONENT pcRegister;
	
	COMPONENT mux_2_1 IS
		PORT(
			sel: IN STD_LOGIC;
			a  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			b  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			c  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT mux_2_1;
	


END PACKAGE stageOnePackage ;