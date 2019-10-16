library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_arith.all;

entity test_bench is
    port(s_dut, s_gm: in std_logic_vector (4 downto 0);
        A, B: out std_logic_vector (3 downto 0));
end test_bench;

architecture test_bench_arch of test_bench is 
begin
    process
        variable contbin: std_logic_vector (7 downto 0)
    begin
        report "Iniciando teste" severity NOTE:

        contbin := "00000000";

        for i in 1 to 256 loop
            A <= contbin(7) & contbin(6) & contbin(5) & contbin(4);
            B <= contbin(4) & contbin(3) & contbin(2) & contbin(1);

            assert (s_gm = s_dut) report "Falhou: i = " & integer 'image(i) severity ERROR;
            
            contbin := contbin + 1;
        
        end loop;

        report "Teste finalizado" severity NOTE;
    
        wait;

    end process;
    
end test_bench_arch;
