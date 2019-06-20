library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftleft is
    
	port (
		A: in std_logic_vector(31 downto 0);
		B: out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavioral of shiftleft is
	

	begin
	
	B <= std_logic_vector(shift_left(signed(A), 2));
end behavioral;
