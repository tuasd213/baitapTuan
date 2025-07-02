library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff9 is
    Port ( D, CLK, CLR : in STD_LOGIC;
           Q : out STD_LOGIC );
end dff9;

architecture Behavioral of dff9 is
    signal Q_int : STD_LOGIC := '0';
begin
    process(CLK, CLR)
    begin
        if CLR = '1' then
            Q_int <= '0';
        elsif rising_edge(CLK) then
            Q_int <= D;
        end if;
    end process;
    Q <= Q_int;
end Behavioral;
