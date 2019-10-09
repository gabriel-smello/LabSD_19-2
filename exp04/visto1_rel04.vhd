library ieee;
use iee.std_logic_1164.all;

entity circuito1 is
    port(A, B, C: in STD_Logic;
        X, Y: out STD_Logic);
end circuito1;

architecture arch1 of circuito1 is

    component mux4 is 
        port (D: in STD_Logic_Vector(3 downto 0);
            S : in STD_Logic_Vector(1 downto 0)
            Y : out STD_Logic);
    end component;

    signal entradas1, entradas2: in STD_Logic_Vector(3 downto 0);
    signal F: in STD_Logic_Vector(1 downto 0);

begin

    -- confirmar se a ordem esta correta
    -- entradas1 = "0" & C & not(C) & "1";
    entradas1 = '1' & not(C) & C & '0';
    -- entradas2 = "1" & not(C) & "0" & C;
    entradas2 = C & '0' & not(C) & '1';
    
    -- seletor
    F = A & B;

    -- parte que define como será o mux
    -- D = entradasx
    -- S = F (seletor)
    -- Y = X/Y (saída)
    U0: mux4 port map(entradas1, F, X)
    U1: mux4 port map(entradas2, F, Y)

end arch1;

#Arquivo_UCF_Visto_1
NET "A" LOC = "P11"; #SW0
NET "B" LOC = "L3"; #SW1
NET "C" LOC = "K3"; #SW2
NET "X" LOC = "M5"; #LD0
NET "Y" LOC = "M11"; #LD1