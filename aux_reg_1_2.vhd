LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- register 1 - IF stage to ID stage

ENTITY regaux1 IS
    PORT (
		 instruction_f,pcplus4_f : IN std_logic_vector(31 DOWNTO 0);
		 ----------------------	
		 instruction_d,pcplus4_d : OUT std_logic_vector(31 DOWNTO 0); 
		 clk:IN std_logic 
	     );
END ENTITY;

ARCHITECTURE regaux1_behave OF regaux1 IS
    BEGIN
        PROCESS(clk)
        BEGIN
            IF( clk'event and clk = '0') THEN
                instruction_d <= instruction_f;
                pcplus4_d <= pcplus4_f;
            END IF;
        END PROCESS;
    END ARCHITECTURE;
