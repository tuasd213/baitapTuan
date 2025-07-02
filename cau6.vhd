library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau6 is
    Port ( CLK, CLR : in STD_LOGIC;
           Q        : out STD_LOGIC_VECTOR(2 downto 0));
end cau6;

architecture Behavioral of cau6 is
    component jkff6
        Port ( J, K, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;
    signal J0, K0, J1, K1, J2, K2 : STD_LOGIC;
begin
    J0 <= '1';
    K0 <= '1';

    J1 <= not Q0;
    K1 <= not Q0;

    J2 <= not (Q0 or Q1);
    K2 <= not (Q0 or Q1);

    FF0: jkff6 port map(J => J0, K => K0, CLK => CLK, CLR => CLR, Q => Q0);
    FF1: jkff6 port map(J => J1, K => K1, CLK => CLK, CLR => CLR, Q => Q1);
    FF2: jkff6 port map(J => J2, K => K2, CLK => CLK, CLR => CLR, Q => Q2);

    Q <= Q2 & Q1 & Q0;
end Behavioral;
