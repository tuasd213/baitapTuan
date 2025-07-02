library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jkff11 is
    Port ( J, K, CLK, CLR : in STD_LOGIC;
           Q : out STD_LOGIC );
end jkff11;

architecture Behavioral of jkff11 is
    signal Q_int : STD_LOGIC := '0';
begin
    process(CLK, CLR)
    begin
        if CLR = '1' then
            Q_int <= '0';
        elsif rising_edge(CLK) then
            case J & K is
                when "00" => Q_int <= Q_int;
                when "01" => Q_int <= '0';
                when "10" => Q_int <= '1';
                when "11" => Q_int <= not Q_int;
                when others => null;
            end case;
        end if;
    end process;
    Q <= Q_int;
end Behavioral;
