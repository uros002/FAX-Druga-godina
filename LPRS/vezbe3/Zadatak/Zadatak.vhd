library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Zadatak is 
port(
	iA: in std_logic_vector(7 downto 0);
	iB: in std_logic_vector(2 downto 0);
	iSEL: in std_logic_vector(1 downto 0);
	oY: out std_logic_vector(3 downto 0);
	oZERO: out std_logic 
);
end entity;


architecture Test of Zadatak is

signal sCOD : std_logic_vector(2 downto 0);
signal sDEC : std_logic_vector(7 downto 0);
signal sADD_A: std_logic_vector(3 downto 0);
signal sADD_B: std_logic_vector(3 downto 0);
signal sADD: std_logic_vector(3 downto 0);
signal sComp: std_logic_vector(3 downto 0);
signal sShift: std_logic_vector(3 downto 0);
signal sMux: std_logic_vector(3 downto 0);



begin 
--prioritetni koder
	sCOD <= "111" when iA(7) = '1' else
			  "110" when iA(6) = '1' else
			  "101" when iA(5) = '1' else
			  "100" when iA(4) = '1' else
			  "011" when iA(3) = '1' else
			  "010" when iA(2) = '1' else
			  "001" when iA(1) = '1' else
			  "000" when iA(0) = '1' else
			  "000";

--decoder
	sDEC <= "00000001" when iB = "000" else
			  "00000010" when iB = "001" else
			  "00000100" when iB = "010" else
			  "00001000" when iB = "011" else
			  "00010000" when iB = "100" else
			  "00100000" when iB = "101" else
			  "01000000" when iB = "110" else
			  "10000000" when iB = "111" else
			  "00000000";

--sabiranje
	sADD_A <= sCOD(2) & sCOD;
	sADD_B <= iB(2) & iB;
	
	sADD <= sADD_A + sADD_B;
	
--komplementer
	sComp <= not(sADD) + 1;

--shifter aritmeticki za dva mesta desno
	sShift <= sADD(3) & sADD(3) & sADD(3 downto 2);
	
--multiplekser
	sMux <= sComp when iSEL = "00" else
			  sShift when iSEL = "01" else
			  sDEC(7 downto 4) when iSEL = "10" else
			  sDEC(3 downto 0); 
			  
--komparator
oZero <= '1' when sMux = 0 else
			'0';
			
oY <= sMux;


end architecture;