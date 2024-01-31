library ieee;
use ieee.std_logic_1164.all;

entity Zadatak_tb is
end entity;

architecture MS of Zadatak_tb is

signal sCOD : std_logic_vector(2 downto 0);
signal sDEC : std_logic_vector(7 downto 0);
signal sADD_A: std_logic_vector(3 downto 0);
signal sADD_B: std_logic_vector(3 downto 0);
signal sADD: std_logic_vector(3 downto 0);
signal sComp: std_logic_vector(3 downto 0);
signal sShift: std_logic_vector(3 downto 0);
signal sMux: std_logic_vector(3 downto 0);
signal sA: std_logic_vector(7 downto 0);
signal sB: std_logic_vector(2 downto 0);
signal sY: std_logic_vector(3 downto 0);
signal sZero: std_logic;
signal sSEL: std_logic_vector(1 downto 0);

component Zadatak is 
port(
	iA: in std_logic_vector(7 downto 0);
	iB: in std_logic_vector(2 downto 0);
	iSEL: in std_logic_vector(1 downto 0);
	oY: out std_logic_vector(3 downto 0);
	oZero: out std_logic 
);
end component;

begin 

uut: Zadatak port map (
	iA => sA,
	iB => sB,
	iSEL => sSEL,
	oY => sY,
	oZero => sZero
);

stimulus : process
begin
	sA <= "00000101";
	sB <= "100";
	
	sSEL <= "00";
	wait for 100 ns;
	
	sSEL <= "01";
	wait for 100 ns;
	
	sSEL <= "10";
	wait for 100 ns;
	
	sSEL <= "11";
	wait;
end process;

end architecture;
