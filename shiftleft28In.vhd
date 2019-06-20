library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftleft28In is
    
	port (
		A: in std_logic_vector(27 downto 0);
		B: out std_logic_vector(27 downto 0)
	);
end shiftleft28In;

architecture behavioral of shiftleft28In is
	

	begin
	
	B <= std_logic_vector(shift_left(signed(A), 2));
end behavioral;
