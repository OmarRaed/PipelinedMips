LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.myPackage.ALL;

ENTITY RegistersFile IS 
     PORT (
     	A1, A2, A3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
     	WD3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;
        clk, WE3 : IN std_logic ;
     	Re1, Re2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END RegistersFile;

ARCHITECTURE RegistersFileArch OF RegistersFile IS 
	
	SIGNAL readSignal : muxInputs ;
	SIGNAL 	deMuxSignals : std_logic_vector (31 DOWNTO 0) ;

	BEGIN 
	
		R0 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(0) ,readSignal(0)) ;
		R1 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(1) ,readSignal(1)) ;
		R2 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(2) ,readSignal(2)) ;
		R3 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(3) ,readSignal(3)) ;
		R4 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(4) ,readSignal(4)) ;
		R5 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(5) ,readSignal(5)) ;
		R6 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(6) ,readSignal(6)) ;
		R7 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(7) ,readSignal(7)) ;
		R8 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(8) ,readSignal(8)) ;
		R9 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(9) ,readSignal(9)) ;
		R10 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(10) ,readSignal(10)) ;
		R11 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(11) ,readSignal(11)) ;
		R12 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(12) ,readSignal(12)) ;
		R13 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(13) ,readSignal(13)) ;
		R14 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(14) ,readSignal(14)) ;
		R15 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(15) ,readSignal(15)) ;
		R16 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(16) ,readSignal(16)) ;
		R17 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(17) ,readSignal(17)) ;
		R18 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(18) ,readSignal(18)) ;
		R19 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(19) ,readSignal(19)) ;
		R20 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(20) ,readSignal(20)) ;
		R21 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(21) ,readSignal(21)) ;
		R22 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(22) ,readSignal(22)) ;
		R23 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(23) ,readSignal(23)) ;
		R24 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(24) ,readSignal(24)) ;
		R25 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(25) ,readSignal(25)) ;
		R26 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(26) ,readSignal(26)) ;
		R27 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(27) ,readSignal(27)) ;
		R28 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(28) ,readSignal(28)) ;
		R29 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(29) ,readSignal(29)) ;
		R30 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(30) ,readSignal(30)) ;
		R31 : register32bit PORT MAP (WD3  ,clk ,deMuxSignals(31) ,readSignal(31)) ;
			
		DEMUX : DEMUX1x32 PORT MAP (WE3, clk, A3, deMuxSignals) ;
		
		MUX1 : MUX32x1 PORT MAP (readSignal, clk, A1, Re1) ;
		MUX2 : MUX32x1 PORT MAP (readSignal, clk, A2, Re2) ;
			
			
END RegistersFileArch ;


