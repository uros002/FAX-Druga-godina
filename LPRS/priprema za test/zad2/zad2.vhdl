library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity zad2 is 
	port(
		iCLK : in std_logic;
		iRST: in std_logic;
		iEN : in std_logic;
		iLOAD: in std_logic;
		iDATA: in std_logic_vector(7 downto 0);
		oCODE: out std_logic_vector(2 downto 0);
		oGREAT: out std_logic;
		oZERO: out std_logic
	);
end entity;

architecture Behavior of zad2 is 

signal sEN : std_logic;
signal sSHR : std_logic_vector(7 downto 0);
signal sCOUNT: std_logic_vector(3 downto 0);


begin 

--brojac
process(iCLK,iRST) begin
	if(iRST = '1') then 
		sCOUNT<= (others => '0');
	elsif(iCLK 'event and iCLK = '1') then
		if(iEN = '1') then
			sCOUNT <= sCOUNT + 1;
		end if;
	end if;
end process;

sEN <= sCOUNT(0);

--pomeracki registar

process(iRST,iCLK,iLOAD) begin 
	if(iRST = '1') then 
		sSHR <= (others => '0');
	elsif(iCLK 'event and iCLK = '1') then
		if(iLOAD = '1') then
			sSHR <= iDATA;
		else
			if(sEN = '0') then
				sSHR <= '0' & sSHR(7 downto 1);
			end if;
		end if;
	end if;
end process;


-- oGREAT
	
	oGREAT <= '1' when sCOUNT > "0100" else
				 '0';
				 
--oZERO

	oZERO <= '1' when sSHR = 0 else
				'0';

--prioritetni koder 
	
	oCODE <= "000" when sSHR(0) = '1' else
				"001" when sSHR(1) = '1' else
				"010" when sSHR(2) = '1' else
				"011" when sSHR(3) = '1' else
				"100" when sSHR(4) = '1' else
				"101" when sSHR(5) = '1' else
				"110" when sSHR(6) = '1' else
				"111";
				
	


end architecture;