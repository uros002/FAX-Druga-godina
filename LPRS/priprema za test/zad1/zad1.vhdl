library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity zad1 is 
	port(
	iA : in std_logic_vector(3 downto 0);
	iB : in std_logic_vector(1 downto 0);
	iC : in std_logic_vector(3 downto 0);
	iSEL : in std_logic_vector(2 downto 0);
	oRESULT : out std_logic_vector(3 downto 0)
	);
end entity;

architecture Behavior of zad1 is
	signal sCOMP : std_logic_vector(3 downto 0);
	signal sSEL : std_logic_vector(2 downto 0);
	signal sMUX1 : std_logic_vector(3 downto 0);
	signal sMUX2 : std_logic_vector(3 downto 0);
	signal sDEC : std_logic_vector(3 downto 0);
	signal sFUN : std_logic_vector(3 downto 0);
	signal sASHR : std_logic_vector(3 downto 0);
	
begin
	
	--komplementer 2
	
	sCOMP <= iA(3) & (not(iA(2 downto 0)) + 1);
	
	--DEKODER
	sDEC <= "0001" when iB = "00" else
			  "0010" when iB = "01" else
			  "0100" when iB = "10" else
			  "1000";
			  
	--funkcija 
	sFUN <= iC(2 downto 0) & iC(3);
	
	--aritmeticki pomerac desno 
	sASHR <= iC(3) & iC(3) & iC(3 downto 2);
	
	--mux1
	sMUX1 <= sCOMP when iSEL(2 downto 1) = "00" else
				sDEC when iSEL(2 downto 1) = "01" else 
				sFUN when iSEL(2 downto 1) = "10" else
				sASHR;
				
	--mux2
	sMUX2 <= sMUX1 when iSEL(0) = '0' else
				"0101";
	
	oRESULT <= sMUX2;
	
end architecture;

