library ieee;
use ieee.std_logic_1164.all;

entity zad1_tb is 
end entity;

architecture arch of zad1_tb is

signal sA :  std_logic_vector(3 downto 0);
signal sB:  std_logic_vector(1 downto 0);
signal sC: std_logic_vector(3 downto 0);
signal sSEL:  std_logic_vector(2 downto 0);

component zad1 is 
	port(
		iA : in std_logic_vector(3 downto 0);
		iB : in std_logic_vector(1 downto 0);
		iC : in std_logic_vector(3 downto 0);
		iSEL : in std_logic_vector(2 downto 0);
		oRESULT : out std_logic_vector(3 downto 0)
	);
end component;

begin

uut: zad1 port map(
	iA => sA,
	iB => sB,
	iC => sC,
	iSEL => sSEL
);

stimulus: process
begin

sA <= "1011";
sB <= "10";
sC <= "1011";
sSEL <= "000";
wait for 20ns;
sSEL <="010";
wait for 20ns;
sSEL <="100";
wait for 20ns;
sSEL <="110";
wait for 20ns;




end process;

end architecture;