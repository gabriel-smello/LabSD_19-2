library ieee;
use ieee.std_logic_1164.all;

entity circuito2 is
    port(A, B, C, D, E, F, G: in STD_Logic_Vector(6 downto 0);
        S: out STD_Logic);
end circuito2;

architecture arch of circuito2 is
    
    component mux8 is 
        port(D: in STD_Logic_Vector(7 downto 0);
            S: in STD_Logic_Vector(2 downto 0);
            Y: out STD_Logic);
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

#Arquivo_UFC_Visto_2
NET "A" LOC = "P11"; #SWO
NET "B" LOC = "L3"; #SW1
NET "C" LOC = "K3"; #SW2
NET "D" LOC = "B4"; #SW3
NET "E" LOC = "G3"; #SW4
NET "F" LOC = "F3"; #SW5
NET "G" LOC = "E2"; #SW6
NET "S" LOC = "M5"; #LD0