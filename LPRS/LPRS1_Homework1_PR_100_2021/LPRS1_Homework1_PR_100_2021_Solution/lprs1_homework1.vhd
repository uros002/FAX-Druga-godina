
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Libraries.

entity lprs1_homework1 is
	port(
		i_x   :  in std_logic_vector(3 downto 0);
		i_y   :  in std_logic_vector(3 downto 0);
		i_z   :  in std_logic_vector(1 downto 0);
		i_sel :  in std_logic_vector(1 downto 0);
		o_res : out std_logic_vector(3 downto 0);
		o_cmp : out std_logic_vector(1 downto 0);
		o_enc : out std_logic_vector(1 downto 0)
	);
end entity;


architecture arch of lprs1_homework1 is
	-- Signals...
	signal s_shl : std_logic_vector(3 downto 0);
	signal s_shr : std_logic_vector(3 downto 0);
	signal s_dec : std_logic_vector(3 downto 0);
	signal s_add : std_logic_vector(3 downto 0);
	signal s_sub : std_logic_vector(3 downto 0);
	signal s_const0 : std_logic_vector(3 downto 0);
	signal s_const1 : std_logic_vector(3 downto 0);
	signal s_mux : std_logic_vector(3 downto 0);
	
	
	
begin
	-- Design.
	
	--shifter levo aritmeticki na i_x
	s_shl <= i_x(2 downto 0) & '0';
	
	--shifter desno logicki na i_y
	s_shr <= '0' & i_y(3 downto 1);
	
	--postavljane jedinice na redno mesto u zavisnosti od vrednosti i_z
	s_dec <= "0001" when i_z = "00" else
				"0010" when i_z = "01" else
				"0100" when i_z = "10" else
				"1000";
				
	--sabiranje s_shl i s_shr 
	s_add <= s_shl + s_shr;
	
	--oduzimanje s_dec sa i_x 
	s_sub <= s_dec - i_x;
	
	--dodela s_const0 i s_const1
	s_const0 <= "0111";
	s_const1 <= "1001";
	
	--multiplekser
	s_mux <= s_sub when i_sel = "00" else
				s_add when i_sel = "01" else
				s_const1 when i_sel = "10" else
				s_const0;
				
	--dodela vrednosti signala s_mux na o_res
	o_res <= s_mux;
	
	--komparator za signal o_cmp
	o_cmp(0) <= '1' when s_mux = 0 else
					'0';
					
	o_cmp(1) <= '1' when s_mux > "0110" else
					'0';
				
	-- prioritetni koder za o_enc 
	o_enc <= "11" when s_mux(3) = '1' else
				"10" when s_mux(2) = '1' else
				"01" when s_mux(1) = '1' else
				"11";
	
end architecture;
