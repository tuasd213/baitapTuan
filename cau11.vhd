library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau11 is
    Port ( CLK, CLR : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR(2 downto 0));
end cau11;

architecture Behavioral of cau11 is
    component jkff11
        Port ( J, K, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;
    signal J0, K0, J1, K1, J2, K2 : STD_LOGIC;
begin
    J0 <= (not Q2 and not Q1 and not Q0) or
          (not Q2 and Q1 and not Q0) or
          (Q2 and not Q1 and Q0);

    K0 <= (not Q2 and not Q1 and Q0) or
          (Q2 and not Q1 and not Q0) or
          (Q2 and Q1 and Q0);

    J1 <= (not Q2 and Q1 and not Q0) or
          (Q2 and not Q1 and Q0);

    K1 <= (not Q2 and not Q1 and Q0) or
          (Q2 and Q1 and Q0);

    J2 <= (not Q2 and not Q1 and Q0) or
          (not Q2 and Q1 and not Q0);

    K2 <= (not Q2 and not Q1 and not Q0) or
          (Q2 and Q1 and Q0);

    FF0: jkff11 port map(J => J0, K => K0, CLK => CLK, CLR => CLR, Q => Q0);
    FF1: jkff11 port map(J => J1, K => K1, CLK => CLK, CLR => CLR, Q => Q1);
    FF2: jkff11 port map(J => J2, K => K2, CLK => CLK, CLR => CLR, Q => Q2);

    Q <= Q2 & Q1 & Q0;
end Behavioral;
