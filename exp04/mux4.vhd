library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
    port (D: in STD_Logic_Vector(3 downto 0);
    S : in STD_Logic_Vector(1 downto 0)
    Y : out STD_Logic);
end mux4; 

architecture multiplex_op of mux4 is
begin
     Y <= D(0) when S(1)=0 and S(0)=0) else
     D(1) when  S(1)='0' and S(0)='1') else
     D(2) when  S(1)='1' and S(0)='0') else
     D(3) when  S(1)='1' and S(0)='1') else
     '0';
end multiplex_op;