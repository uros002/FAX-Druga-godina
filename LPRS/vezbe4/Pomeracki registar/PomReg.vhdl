library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PomReg is port (
	iRST: in std_logic;
	iCLK: in std_logic;
	iLOAD: in std_logic;
	iARITH: in std_logic;
	iSHR: in std_logic;
	iSHL: in std_logic;
	iDATA: in std_logic_vector(7 downto 0);
	oSHREG : out std_logic_vector(7 downto 0)
);
end entity;

architecture Behavioral of PomReg is

signal sSHREG: std_logic_vector(7 downto 0);

begin 
	process(iCLK,iRST) is
	begin
		if(iRST = '1') then
			sSHREG <= "00000000";
		elsif(iCLK 'event and iCLK = '1') then
			if(iLOAD = '1') then
				sSHREG <= iDATA;
			elsif(iSHL = '1' and iSHL = '0') then -- ulevo
				if(iARITH = '1') then
					sSHREG <= sSHREG(6 downto 0) & '0';	--aritmeticko ulevo
				else
					sSHREG <= sSHREG(6 downto 0) & '0'; --logicko ulevo
				end if;
			elsif(iSHL = '0' and iSHL = '1') then --udesno
				if(iARITH = '1') then
					sSHREG <= 	sSHREG(7) & sSHREG(7 downto 1); --aritmeticko udesno
				else
					sSHREG <= 	'0' & sSHREG(7 downto 1); --logicko udesno
				end if;
		   end if;
		end if;
	end process;
	
	oSHREG <= sSHREG;
	
end Behavioral;
