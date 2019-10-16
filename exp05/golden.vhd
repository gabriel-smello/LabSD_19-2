library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity somador_golden is
    port(A, B: in std_logic_vector (3 downto 0);
        S: out std_logic_vector (4 downto 0));
end somador_golden;

architecture somador_golden_arch of somador_golden is 
begin

    S <= unsigned(A) + unsigned(B);

end somador_golden_arch;
