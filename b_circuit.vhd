library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY B_circuits IS 
	PORT (
		rd1, rd2 : IN std_logic_VECTOR(31 DOWNTO 0) ;
		clk : IN STD_LOGIC ;
		selector : IN std_logic_VECTOR(2 DOWNTO 0) ; 
		d_out : OUT std_logic
	);
END B_circuits ;


ARCHITECTURE Behave OF B_circuits IS 



	
	
COMPONENT comparator IS 
	PORT (
		a, b : IN std_logic_VECTOR(31 DOWNTO 0) ;
		clk : IN STD_LOGIC ;
		greater,less,equal : OUT std_logic
	);
END COMPONENT ;

	
COMPONENT MUX_spec IS
	PORT(
	a,b,c,d,f,e:IN STD_LOGIC;
	SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	y:OUT STD_LOGIC);
END COMPONENT;
SIGNAL sel_sig :std_logic_VECTOR (2 DOWNTO 0 );
SIGNAL a_sig,b_sig,c_sig,d_sig,f_sig,e_sig,G_sig,L_sig,equal_sig,clk_sig: STD_LOGIC;


	BEGIN
	    sel_sig <= selector ; 
		clk_sig <= clk ;
		a_sig <=G_sig ;
		b_sig <=L_sig ;
		c_sig <=equal_sig ;
		d_sig <=not equal_sig ;		
		e_sig <=equal_sig or G_sig;
		f_sig <=equal_sig or L_sig ;
		
		cmp :comparator PORT MAP (rd1,rd2,clk_sig,G_sig,L_sig,equal_sig) ; 
		mux :MUX_spec PORT MAP (a_sig,b_sig,c_sig,d_sig,e_sig,f_sig,sel_sig,d_out);
	
END Behave ;