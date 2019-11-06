library IEEE;
use IEEE.std_logic_1164.all;

entity exp8visto1 is
    port( clock : in std_logic;
          reset : in std_logic;
          enable : in std_logic;
          load : in std_logic;
          dezload : in std_logic_vector(3 downto 0);
          uniload : in std_logic_vector(3 downto 0);
          dezena : out std_logic_vector(3 downto 0);
          unidade : out std_logic_vector(3 downto 0));
end exp8visto1;

architecture exp8visto1_arch of exp8visto1 is
    --inserir sinais e componentes aqui
begin 

    --inserir implemnetação aqui

end exp8visto1_arch;

