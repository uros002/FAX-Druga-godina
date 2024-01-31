library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity zad3 is 
	port(
		iCLK : in std_logic;
		iRST : in std_logic;
		iEN: in std_logic;
		iA: in std_logic_vector(7 downto 0);
		iB: in std_logic_vector(4 downto 0);
		iC: in std_logic_vector(6 downto 0);
		iD: in std_logic_vector(6 downto 0);
		oRESULT: out std_logic_vector(7 downto 0);
		oCOMP: out std_logic
	);	
end entity;

architecture Behavior of zad3 is
	signal sSHR : std_logic_vector(7 downto 0);
	signal sFUN : std_logic_vector(7 downto 0);
	signal sSUM:  std_logic_vector(7 downto 0);
	signal sCOUNT: std_logic_vector(4 downto 0);
	signal sCONST: std_logic_vector(7 downto 0);
	signal sMUX: std_logic_vector(7 downto 0);
	signal sRESULT: std_logic_vector(7 downto 0);
	signal sMUX_SEL: std_logic_vector(1 downto 0);
	signal	sA:  std_logic_vector(7 downto 0);
	signal	sB:  std_logic_vector(4 downto 0);
	signal	sD:  std_logic_vector(6 downto 0);
	signal sC: std_logic_vector(6 downto 0);
	signal sRESULT_C: std_logic_vector(7 downto 0);
	
	
	begin
	
	--komplement 2 za ulaze
		sA <= (not(iA)) + 1;
		sB <= (not(iB)) + 1;
		sc <= iC(6) & not(iC(5 downto 0) + 1);
		sD <= iD(6) & not(iD(5 downto 0) + 1);
		
	--sifter 
	
	sSHR <= sA(7) & sA(7) & sA(7) & sA(7) & sA(7 downto 4);
	
	--funkcija
	sFUN <= "000" & (sB + 7);
	
	--sabirac
	
	sSUM <= (sC(6) & sC) + (sD(6) & sD);
	
	--konstanta
	sCONST <= "00010010";

	--brojac
	process(iCLK,iRST) begin
		if(iRST = '1') then
			sCOUNT <= (others => '0');
		elsif(iCLK 'event and iCLK = '1') then
			if(iEN = '1') then 
				if(sCOUNT = 24) then
					sCOUNT <= (others => '0');
				else
					sCOUNT <= sCOUNT + 1;
				end if;
			end if;
		end if;
	end process;
	
	sMUX_SEL <= sCOUNT(1 downto 0);
	
	--mux
	sRESULT <= sSHR when sMUX_SEL = "00" else
				  sFUN when sMUX_SEL = "01" else
				  sSUM when sMUX_SEL = "10" else
				  sCONST;
				  
	sRESULT_C <= (not(sRESULT)) + 1;
	
	oRESULT <= sRESULT;
	
	--komparator
	oCOMP <= '1' when sRESULT > 0 else
				'0';
	
	
end architecture;