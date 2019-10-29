library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina_refri is 
    port(clock, reset : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR(1 downto 0)
        L, V, C : out STD_LOGIC);
end maquina_refri;

architecture maquina_refri_arch of maquina_refri is

    type estado is (inicio, vinte_cinco, ciquenta, setenta_cinco, um_real,um_real_e_vinte_cinco, troco_vinte_cinco, troco_cinquenta, troco_setenta_cinco); -- TERMINAR
    
    signal current_state, next_state : estado;

begin

    sync_proc: process(clock, reset)
    begin
        if(reset='1') then
            current_state <= st_inicio;
        elsif rising_edge(clock) then
            current_state <= next_state;
        end if;
    end process sync_proc;

    comb_proc: process(current_state, A)
    begin
        case current_state is
            when inicio =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;

            when vinte_cinco =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;

            when cinquenta =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
            
            when um_real =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
            
            when um_real_e_vinte_cinco =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;

            when troco_vinte_cinco =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
            
            when troco_cinquenta =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
        
            when troco_setenta_cinco =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;

        end case;
    end process comb_proc;
end maquina_refri_arch ;