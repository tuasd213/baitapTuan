library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau8 is
    Port ( CLK, CLR : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR(2 downto 0));
end cau8;

architecture Behavioral of cau8 is
    component tff8
        Port ( T, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;
    signal T0, T1, T2 : STD_LOGIC;
begin
    T0 <= Q1 and Q2;
    T1 <= Q2;
    T2 <= '1';

    FF0: tff8 port map(T => T0, CLK => CLK, CLR => CLR, Q => Q0);
    FF1: tff8 port map(T => T1, CLK => CLK, CLR => CLR, Q => Q1);
    FF2: tff8 port map(T => T2, CLK => CLK, CLR => CLR, Q => Q2);

    Q <= Q2 & Q1 & Q0;
end Behavioral;
