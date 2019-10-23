library ieee;
use ieee.std_logic_1164.all;

entity FPJK is
    port(PR, CLR, CLK, J, K: in std_logic;
        Q: out std_logic);
end FPJK;

architecture arch1 of FPJK is
    signal JK : std_logic_vector(1 downto 0);
    signal Qbuf : std_logic_vector;

begin
    JK <= J & K;
    Q <= Qbuf;
    process(PR, CLR, CLK)
    begin
        if PR = '1' then Qbuf <= '1';
        elsif CLR = '1' then Qbuf <= '0';
        elsif rising_edge(CLK) then
            case JK is
                when "00" => Qbuf <= Qbuf;
                when "01" => Qbuf <= '0'
                when "10" => Qbuf <= '1'
                when "11" => Qbuf <= not(Qbuf);
            end case;
        end if;
    end process;
end arch1;