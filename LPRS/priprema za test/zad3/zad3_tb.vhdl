library ieee;
use ieee.std_logic_1164.all;

library work;

entity zad3_tb is 

end entity;

architecture arch of zad3_tb is 

	signal	iCLK :  std_logic;
	signal	iRST :  std_logic;
	signal	iEN:  std_logic;
	signal	iA:  std_logic_vector(7 downto 0);
	signal	iB:  std_logic_vector(4 downto 0);
		signal iC:  std_logic_vector(6 downto 0);
	signal	iD:  std_logic_vector(6 downto 0);
	signal	oRESULT:  std_logic_vector(7 downto 0);
	signal	oCOMP:  std_logic;
	
	constant i_clk_period : time := 5 ns;
	
	begin


	uut: entity work.zad3 
		port map(
			iCLK => iCLK,
			iRST => iRST,
			iEN => iEN,
			iA => iA,
			iB => iB,
			iC => iC,
			iD => iD,
			oRESULT => oRESULT,
			oCOMP => oCOMP
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
		wait for 5.25 * i_clk_period;
		iRST <= '0';
		
		iEN <= '0';
		iA <= "10000000";
		wait for 5 * i_clk_period;
		iA <= "01111111";
		wait for 5 * i_clk_period;
		
		iEN <= '1';
		wait for i_clk_period;
		iEN <= '0';
		
		iB <= "00000";
		wait for 5 * i_clk_period;
		iB <= "00001";
		wait for 5 * i_clk_period;
		iB <= "00011";
		wait for 5 * i_clk_period;
		iB <= "00111";
		wait for 5 * i_clk_period;
		iB <= "01111";
		wait for 5 * i_clk_period;
		iB <= "11111";
		wait for 5 * i_clk_period;
		
		
		iEN <= '1';
		wait for i_clk_period;
		iEN <= '0';
		
		iC <= "0011011";
		iD <= "0011011";
		
		wait for 4* i_clk_period;
		
		iC <= "0001011";
		iD <= "0011011";
	
		wait for 4* i_clk_period;
		
		iEN <= '1';
		wait for i_clk_period;
		iEN <= '0';
		
		wait for 5 * i_clk_period;
		
		iRST <= '1';
		wait for 5.25 * i_clk_period;
		iRST <= '0';
	
	
		iEN <= '0';
		iA <= "00000000";
		wait for 5 * i_clk_period;
		iA <= "01111111";
		wait for 5 * i_clk_period;
	
	end process;
end architecture;