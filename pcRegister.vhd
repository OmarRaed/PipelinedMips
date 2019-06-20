library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------------------------------

ENTITY pcRegister IS
	PORT( 
		clk: in std_logic; -- clock
		D: in std_logic_vector(31 downto 0); -- data input
		Q: out std_logic_vector(31 downto 0) -- data output
		);
		
END pcRegister;

----------------------------------------------------

ARCHITECTURE pc_arch OF pcRegister IS

	SIGNAL tempSignal : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000" ;

BEGIN
 
    PROCESS(clk, D)
    BEGIN 
		IF (D = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" )THEN
		    Q<= "00000000000000000000000000000000" ;
		ELSE 
			IF rising_edge(clk) OR clk = '1' THEN
               Q <= tempSignal;
			ELSIF falling_edge(clk) THEN
				tempSignal <= D ;
			END IF;
		END IF ; 
		
    END PROCESS;
	
END pc_arch;