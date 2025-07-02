library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tff5 is
    Port ( T, CLK, CLR : in STD_LOGIC;
           Q : out STD_LOGIC );
end tff5;

architecture Behavioral of tff5 is
    signal Q_int : STD_LOGIC := '0';
begin
    process(CLK, CLR)
    begin
        if CLR = '1' then
            Q_int <= '0';
        elsif rising_edge(CLK) then
            if T = '1' then
                Q_int <= not Q_int;
            end if;
        end if;
    end process;
    Q <= Q_int;
end Behavioral;
