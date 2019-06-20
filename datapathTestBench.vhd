LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.datapathPackage.ALL ;

ENTITY datapathTestBench IS 
END datapathTestBench;

ARCHITECTURE behav OF datapathTestBench IS 

	COMPONENT datapath IS 
		 PORT (
			clk : IN STD_LOGIC 
		 );
	END COMPONENT ;
	
	--CLK SIGNAL
	SIGNAL clk : STD_LOGIC ;
	
	BEGIN 
	
		--CREATING A DEVICE UNDER TEST OF THE FINAL COMPONENT
		DUT : datapath PORT MAP (clk) ;
		
		--CLK PROCESS
		clk_process : PROCESS
		BEGIN
			clk <= '1' ;
			WAIT FOR 10 ns ;
			clk <= '0' ;
			WAIT FOR 10 ns ;
		END PROCESS ;
END behav ;


