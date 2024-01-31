
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity instr_rom is
    Port ( iA : in  STD_LOGIC_VECTOR (7 downto 0);
           oQ : out  STD_LOGIC_VECTOR (14 downto 0));
end instr_rom;

-- ubaciti sadrzaj *.txt datoteke generisane pomocu lprsasm ------
architecture Behavioral of instr_rom is
begin
    oQ <= "100000011000000"  when iA = 0 else
          "000110000000000"  when iA = 1 else
          "000001001000011"  when iA = 2 else
          "000001010001011"  when iA = 3 else
          "100000100000001"  when iA = 4 else
          "000111100100000"  when iA = 5 else
          "000001111100011"  when iA = 6 else
          "000001000000011"  when iA = 7 else
          "000111000000000"  when iA = 8 else
          "100000001000001"  when iA = 9 else
          "000001010010011"  when iA = 10 else
          "000111010010000"  when iA = 11 else
          "100000100000000"  when iA = 12 else
          "000111100100000"  when iA = 13 else
          "000010110000100"  when iA = 14 else
          "010001000011000"  when iA = 15 else
          "100000101000000"  when iA = 16 else
          "100000110000001"  when iA = 17 else
          "000100101101110"  when iA = 18 else
          "110000000101010"  when iA = 19 else
          "000111000000000"  when iA = 20 else
          "000110001001000"  when iA = 21 else
          "000111010010000"  when iA = 22 else
          "010000000001110"  when iA = 23 else
          "100000100000111"  when iA = 24 else
          "000001010010011"  when iA = 25 else
          "000111010010000"  when iA = 26 else
          "000010111111111"  when iA = 27 else
          "100000100000010"  when iA = 28 else
          "000111100100000"  when iA = 29 else
          "000010110010100"  when iA = 30 else
          "010001000100100"  when iA = 31 else
          "100000101000010"  when iA = 32 else
          "000001111111101"  when iA = 33 else
          "000111010010000"  when iA = 34 else
          "010000000011110"  when iA = 35 else
          "010000000100100"  when iA = 36 else
          "000000000000000";
end Behavioral;
------------------------------------------------------------------
