library ieee;
use ieee.std_logic_1164.all;

entity registrador is
     port(clk, rst, load, dir, L, R: in std_logic;
        D: in std_logic_vector(3 downto 0);
        Q: out std_logic);
end registrador;

architecture registrador_arch of registrador is
    signal Qbuf std_logic_vector(3 downto 0);
begin
    Q <= Qbuf;
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then Qbuf <= "0000";
            elsif rst = '0' and load = '1' then Qbuf <= D;
            elsif rst = '0' and load = '0' then
                if dir = '0' then
                    if L = '0' then Qbuf <= Qbuf(2) & Qbuf(1) & Qbuf(0) & '0';
                    elsif L = '1' then Qbuf <= Qbuf(2) & Qbuf(1) & Qbuf(0) & '1';
                    end if;
                elsif dir = '1' then
                    if R = '0' then Qbuf <= '0' & Qbuf(3) & Qbuf(2) & Qbuf(1);
                    elsif R = '1' then Qbuf <= '1' & Qbuf(3) & Qbuf(2) & Qbuf(1);
                    end if;
                end if;
            end if;
            end if;
        end if;
    end process;
                end registrador_arch;
                        