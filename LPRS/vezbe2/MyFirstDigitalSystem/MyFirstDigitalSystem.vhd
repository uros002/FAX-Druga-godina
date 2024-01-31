library ieee;
use ieee.std_logic_1164.all;

-- entitet sa deklaracijom svih ulaza i izlaza
entity MyFirstDigitalSystem is
	port(
		iA : in std_logic; -- 0 ili 1 std_logic_vector 3 downto 0
		iB : in std_logic;
		oY : out std_logic -- poslednji nema tacka zarez
	);
end entity;

-- arhitektura digitalnog sistema
architecture MS of MyFIrstDigitalSystem is
-- interni signali vidljivi samo u arhitekturi

signal sS : std_logic;
-- ...
begin

sS <= iA and iB;
oY <= not(sS);


end architecture;
