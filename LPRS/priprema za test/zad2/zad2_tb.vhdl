library ieee;
use ieee.std_logic_1164.all;

library work;

entity zad2_tb is 

end entity;

architecture arch of zad2_tb is

	constant i_clk_period : time := 5 ns;

	signal	iCLK :  std_logic;
	signal	iRST:  std_logic;
	signal	iEN :  std_logic;
	signal	iLOAD:  std_logic;
	signal	iDATA:  std_logic_vector(7 downto 0);
	signal	oCODE:  std_logic_vector(2 downto 0);
	signal	oGREAT:  std_logic;
	signal	oZERO:  std_logic;
	signal   sEN: std_logic;

begin

	uut: entity work.zad2 
		port map(
			iCLK => iCLK,
			iRST => iRST,
			iEN => iEN,
			iLOAD => iLOAD,
			iDATA => iDATA,
			oCODE => oCODE,
			oGREAT => oGREAT,
			oZERO => oZERO
		);

	clk_p: process
	begin
		iCLK <= '1';
		wait for i_clk_period/2;
		iCLK <= '0';
		wait for i_clk_period/2;
	end process;

	stimulus: process
	begin
		
		iRST <= '1';
		wait for 3.25 *i_clk_period;
		iRST <= '0';
		
		iDATA <= "00011010";
		iLOAD <= '1';
		wait for i_clk_period;
		iEN <= '0';
		iLOAD <= '0';
		wait for i_clk_period;
		iEN <= '1';
		wait for 14* i_clk_period;
		iEN <= '0'; 
		wait for 5* i_clk_period;
		
		
		
		iDATA <= "11001101";
		iLOAD <= '1';
		wait for i_clk_period;
		iEN <= '0';
		iLOAD <= '0';
		wait for i_clk_period;
		iEN <= '1';
		wait for 14* i_clk_period;
		iEN <= '0';
		wait for 5* i_clk_period;
		
		
		
		
	end process;
	
	
end architecture;