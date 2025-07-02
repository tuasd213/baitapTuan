library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau7 is
    Port ( CLK, CLR : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR(2 downto 0));
end cau7;

architecture Behavioral of cau7 is
    component tff7
        Port ( T, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;
    signal T0, T1, T2 : STD_LOGIC;
begin
    T0 <= '1';
    T1 <= not Q0;
    T2 <= not (Q0 or Q1);

    FF0: tff7 port map(T => T0, CLK => CLK, CLR => CLR, Q => Q0);
    FF1: tff7 port map(T => T1, CLK => CLK, CLR => CLR, Q => Q1);
    FF2: tff7 port map(T => T2, CLK => CLK, CLR => CLR, Q => Q2);

    Q <= Q2 & Q1 & Q0;
end Behavioral;
