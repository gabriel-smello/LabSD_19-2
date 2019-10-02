library ieee;
use ieee.std_logic_1164.all;

entity mux8 is
     port(S: in STD_LOGIC_VECTOR(0 to 2);
          D: in STD_LOGIC_VECTOR(0 to 7);
	     Y: out STD_LOGIC);
end mux8; 

# S entrada bus de 3 bits.
# D entrada bus de 8 bits.
# Y saída de 1 bit.

architecture multiplex_op of mux8 is
begin
     Y <= D(0) when (S(2)=0 and S(1)=0 and S(0)=0) else
     D(1) when (S(2)='0' and S(1)='0' and S(0)='1') else
     D(2) when (S(2)='0' and S(1)='1' and S(0)='0') else
     D(3) when (S(2)='0' and S(1)='1' and S(0)='1') else
     D(4) when (S(2)='1' and S(1)='0' and S(0)='0') else
     D(5) when (S(2)='1' and S(1)='0' and S(0)='1') else
     D(6) when (S(2)='1' and S(1)='1' and S(0)='0') else
     D(7) when (S(2)='1' and S(1)='1' and S(0)='1') else
     '0';
end multiplex_op;