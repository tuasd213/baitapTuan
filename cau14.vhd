library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau14 is
    Port ( CLK, CLR : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR(2 downto 0));
end cau14;

architecture Behavioral of cau14 is
    component tff14
        Port ( T, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;
    signal T0, T1, T2 : STD_LOGIC;
begin
    T0 <= (not Q2 and not Q1 and not Q0) or
          (not Q2 and Q1 and not Q0) or
          (Q2 and not Q1 and Q0);

    T1 <= (not Q2 and not Q1 and Q0) or
          (not Q2 and Q1 and Q0) or
          (Q2 and not Q1 and not Q0);

    T2 <= (not Q2 and Q1 and Q0) or
          (Q2 and not Q1 and not Q0);

    FF0: tff14 port map(T => T0, CLK => CLK, CLR => CLR, Q => Q0);
    FF1: tff14 port map(T => T1, CLK => CLK, CLR => CLR, Q => Q1);
    FF2: tff14 port map(T => T2, CLK => CLK, CLR => CLR, Q => Q2);

    Q <= Q2 & Q1 & Q0;
end Behavioral;
