library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau9 is
    Port ( CLK, CLR : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR(2 downto 0));
end cau9;

architecture Behavioral of cau9 is
    component dff9
        Port ( D, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;
    signal D0, D1, D2 : STD_LOGIC;
begin
    D0 <= (not Q2 and not Q1 and Q0) or (not Q2 and Q1 and not Q0) or (Q2 and not Q1 and not Q0);
    D1 <= (not Q2 and Q0) or (Q1 and not Q0);
    D2 <= (Q1 and Q0) or (Q2 and not Q0);

    FF0: dff9 port map(D => D0, CLK => CLK, CLR => CLR, Q => Q0);
    FF1: dff9 port map(D => D1, CLK => CLK, CLR => CLR, Q => Q1);
    FF2: dff9 port map(D => D2, CLK => CLK, CLR => CLR, Q => Q2);

    Q <= Q2 & Q1 & Q0;
end Behavioral;
