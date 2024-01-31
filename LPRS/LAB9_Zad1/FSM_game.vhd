library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity FSM_game is port ( 
	iRST  : in  std_logic;
	iCLK  : in  std_logic;
	iA	   : in  std_logic_vector(1 downto 0);
	iB	   : in  std_logic_vector(1 downto 0);
	oA  	: out std_logic;
	oB  	: out std_logic
	);
end entity;

architecture Behavioral of FSM_game is
	
	type t_state is (DRAW,ALEAD,BLEAD,AWIN,BWIN);
	signal s_state,s_next_state: t_state;
	signal sWIN : std_logic_vector(1 downto 0);

	

	
begin

--registar za pamcenje stanja
	process(iCLK,iRST) begin
		if(iRST = '1') then
			s_state <= DRAW;
		elsif(iCLK 'event and iCLK = '1') then
			s_state <= s_next_state;
		end if;
	end process;

--automat 
	process(s_state,iA,iB) begin
		case(s_state) is
			when DRAW =>
				if(iA = "01") then
					s_next_state <= ALEAD;
				elsif(iB = "01") then 
					s_next_state <= BLEAD;
				end if;
				
			when ALEAD => 
				if(iA = "01") then
					s_next_state <= AWIN;
				elsif(iB = "10") then
					s_next_state <= BLEAD;
				elsif(iB = "01") then
					s_next_state <= DRAW;
				end if;
			
			when BLEAD =>
				if(iB = "01") then
					s_next_state <= BWIN;
				elsif(iA = "10") then
					s_next_state <= ALEAD;
				elsif(iA = "01") then
					s_next_state <= DRAW;
				end if;
			when others => 
				s_next_state <= DRAW;
		end case;
	end process;
	
	--kombinaciono dodeljivanje signalu sWIN
	sWIN <= "01" when s_state = AWIN else
		     "10" when s_state = BWIN else
			  "00";



end Behavioral;
