library ieee;
use ieee.std_logic_1164.all;

entity circuito2 is
    port(A, B, C, D, E, F, G: in STD_Logic_Vector(6 downto 0);
        S: out STD_Logic);
end circuito2;

architecture arch of circuito2 is
    
    component mux8 is 
        port(S: in STD_LOGIC_VECTOR(2 downto 0);
            D: in STD_LOGIC_VECTOR(7 downto 0);
            Y: out STD_LOGIC);
    end component;

    component dec4x16 is
        port(A: in STD_Logic_Vector(3 downto 0);
            Y: out STD_Logic_Vector(15 downto 0));
    end component;

    signal entradas_decod : in STD_Logic_Vector(3 downto 0);
    signal conexao : in STD_Logic_Vector(15 downto 0);
    signal entradas_mux : in STD_Logic_Vector(7 downto 0);
    signal selec : in STD_Logic_Vector(2 downto 0);

begin
    entradas_decod <= A & B & C & D;
    entradas_mux <= "1" & conexao(10) or conexao(11) & "0" & conexao(15) or conexao(9) & "1" or conexao(7) & conexao(15) or conexao(0) & "0" ;
    selec <= E & F & G;
    U0 : dec4x16 port map(entradas_decod, conexao)
    U1 : mux8 port map(entradas_mux, selec, S) 

        
end arch;
