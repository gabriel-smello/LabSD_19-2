library ieee;
use ieee.std_logic_1164.all;

entity somador4 is
    port(A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0));
end somador4;

architecture arch of somador4 is
    component somador is
        port (x, y, cin: in std_logic;
        s, cout: out std_logic);
    end component;

        signal C: std_logic_vector(2 downto 0);
        signal S0, S1, S2, S3, S4: std_logic;
begin
    U0: somador port map(A(0), B(0),'0', S0, C(0));
    U1: somador port map(A(1), B(1), C(0), S1, C(1));
    U2: somador port map(A(2), B(2), C(1), S2, C(2));
    U3: somador port map(A(3), B(3), C(2), S3, S4);
    S <= S4 & S3 & S2 & S1 & S0; 
end arch;