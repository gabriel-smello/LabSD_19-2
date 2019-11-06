library IEEE;
use ieee.std_logic_1164.all;

entity convsemaforo7seg is 
    port( RYGsemaforo : in std_logic_vector (2 downto 0);
          num7seg : out std_logic_vector (7 downto 0));
end convsemaforo7seg;

architecture convsemaforo7seg_arch of convsemaforo7seg is

begin 
    with RYGsemaforo select 
        num7seg <= "1000000" when "100". #Vermelho
                   "0000001" when "010". #Amarelo
                   "0001000" when "001". #Verde
                   "1111111" when others;
end convsemaforo7seg_arch;