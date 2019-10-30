library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina_refri is 
    port(clock, reset : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR(1 downto 0);
        R, V, C : out STD_LOGIC);
end maquina_refri;

architecture maquina_refri_arch of maquina_refri is

    type estado is (inicio, vinte_cinco, cinquenta, setenta_cinco, um_real,um_real_e_vinte_cinco, troco_vinte_cinco, troco_cinquenta, troco_setenta_cinco);
    
    signal current_state, next_state : estado;

begin

    sync_proc: process(clock, reset)
    begin
        if(reset='1') then
            current_state <= inicio;
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
                    next_state <= cinquenta;
                elsif (A = "10") then
                    next_state <= setenta_cinco;
                elsif (A = "11") then
                    next_state <= troco_vinte_cinco;
                else
                    next_state <= vinte_cinco;
                end if;

            when cinquenta =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= setenta_cinco;
                elsif (A = "10") then
                    next_state <= um_real_e_vinte_cinco;
                elsif (A = "11") then
                    next_state <= troco_cinquenta;
                else
                    next_state <= cinquenta;
                end if;

            when setenta_cinco =>
            R <= '0'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= um_real;
                elsif (A = "10") then
                    next_state <= um_real_e_vinte_cinco;
                elsif (A = "11") then
                    next_state <= troco_setenta_cinco;
                else
                    next_state <= setenta_cinco;
                end if;
            
            when um_real =>
            R <= '1'; V <= '0'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
            
            when um_real_e_vinte_cinco =>
            R <= '1'; V <= '1'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;

            when troco_vinte_cinco =>
            R <= '0'; V <= '1'; C <= '0';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
            
            when troco_cinquenta =>
            R <= '0'; V <= '0'; C <= '1';
                if(A = "01") then
                    next_state <= vinte_cinco;
                elsif (A = "10") then
                    next_state <= cinquenta;
                else
                    next_state <= inicio;
                end if;
        
            when troco_setenta_cinco =>
            R <= '0'; V <= '1'; C <= '1';
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