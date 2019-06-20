LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE stageTwoPackage IS

	TYPE muxInputs IS array(0 to 31) of std_logic_vector(31 DOWNTO 0);

	COMPONENT mux_2_1 IS
		PORT(
			sel: IN STD_LOGIC;
			a  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			b  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			c  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux_2_1bit IS
		PORT(
			sel: IN STD_LOGIC;
			a, b  : IN STD_LOGIC ;
			c  : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT mux_3_5bit IS
		PORT(
			sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			a  : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			b  : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			c  : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			d  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
		
	COMPONENT RegistersFile IS 
		 PORT (
			A1, A2, A3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
			WD3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			clk, WE3 : IN std_logic ;
			Re1, Re2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT;
	
	COMPONENT mux_3_1 IS
		PORT(
			sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			a  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			b  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			c  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			d  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT signextenderFiveBits is 
		port( se_in:in std_logic_vector(4 downto 0);
			se_out:out std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT signextender is 
		port( se_in:in std_logic_vector(15 downto 0);
			se_out:out std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT shiftleft is		
		port (
			A: in std_logic_vector(31 downto 0);
			B: out std_logic_vector(31 downto 0)
		);
	end COMPONENT;
	
	COMPONENT shiftleft28In is
    		port (
			A: in std_logic_vector(27 downto 0);
			B: out std_logic_vector(27 downto 0)
		);
	end COMPONENT;
	
	COMPONENT B_circuits IS 
	PORT (
		rd1, rd2 : IN std_logic_VECTOR(31 DOWNTO 0) ;
		clk : IN STD_LOGIC ;
		selector : IN std_logic_VECTOR(2 DOWNTO 0) ; 
		d_out : OUT std_logic
	);
	END COMPONENT ;

	
	COMPONENT Adder IS
		PORT(
			clk : IN STD_LOGIC ;
			A, B : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
			result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT ;
	
	COMPONENT AluDecoder IS 
		PORT (
			op         : IN STD_LOGIC_VECTOR (3 DOWNTO 0) ; 
			fun        : IN STD_LOGIC_VECTOR (5 DOWNTO 0) ;
			clk        : IN STD_LOGIC ;
			aluControl : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			unsignedSignal, sa : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT MainDecoder IS
		PORT (
			op        : IN std_logic_vector(5 DOWNTO 0);
		clk       : IN std_logic;
		regwrite  : OUT std_logic;
		regdst    : OUT std_logic_vector (1 downto 0);
		alusrc    : OUT std_logic;
		branch    : OUT std_logic;
        memwrite  : OUT std_logic;
		memtoreg  : OUT std_logic;
        aluop     : OUT std_logic_vector(3 DOWNTO 0);	
        jump      : OUT std_logic;
		jr        : OUT std_logic;
		lui       : OUT std_logic;
		B_type  : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		l_half    : OUT std_logic;
		l_byte    : OUT std_logic;
		nop       : OUT std_logic
		) ;
	END COMPONENT ;

	
	
	
	
	
	
END PACKAGE stageTwoPackage ;