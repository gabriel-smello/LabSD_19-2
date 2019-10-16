library ieee;
use ieee.std_logic_1164.all;

entity somador is 
    port (x, y, cin: in std_logic;
        s, cout: out std_logic);
end somador;

architecture arch of somador is
    begin
        s <= x XOR y XOR cin;
        cout <= (x and y) or (cin and x) or (cin and y);
end arch;