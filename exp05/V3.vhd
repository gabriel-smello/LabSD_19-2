library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_arith.all;

entity top_module is
end top_module;

architecture top_module_arch of top_module is 

    component somador4 is
        port(A, B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(4 downto 0));
    end component;

    component test_bench is
        port(s_dut, s_gm: in std_logic_vector (4 downto 0);
            A, B: out std_logic_vector (3 downto 0));
    end component;    

    component somador_golden is
        port(A, B: in std_logic_vector (3 downto 0);
            S: out std_logic_vector (4 downto 0);
    end component;
    

    signal A, B: std_logic_vector(3 downto 0);
    signal s_dut, s_gm: std_logic_vector(4 downto 0);

begin
    U0: somador4 port map(A,B, s_dut);
    U1: somador_golden port map(A, B, s_gm);
    U2: test_bench port map(s_dut, s_gm, A, B);

end top_module_arch;
