library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau3 is
    Port (
        clk : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR (2 downto 0)
    );
end cau3;

architecture Behavioral of cau3 is
    signal q0, q1, q2 : STD_LOGIC;
    signal j0, k0, j1, k1, j2, k2 : STD_LOGIC;
begin

    j0 <= '1';  
    k0 <= '1';

    j1 <= q0;
    k1 <= q0;

    j2 <= q0 and q1;
    k2 <= q0 and q1;

    FF0: entity work.jk_ff port map(clk => clk, J => j0, K => k0, Q => q0);
    FF1: entity work.jk_ff port map(clk => clk, J => j1, K => k1, Q => q1);
    FF2: entity work.jk_ff port map(clk => clk, J => j2, K => k2, Q => q2);

    Q <= q2 & q1 & q0;


end Behavioral;