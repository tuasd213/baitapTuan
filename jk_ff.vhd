library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port (
        clk : in  STD_LOGIC;
        J   : in  STD_LOGIC;
        K   : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end jk_ff;

architecture Behavioral of jk_ff is
    signal q_int : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (J = '0' and K = '0') then
                q_int <= q_int;
            elsif (J = '0' and K = '1') then
                q_int <= '0';
            elsif (J = '1' and K = '0') then
                q_int <= '1';
            elsif (J = '1' and K = '1') then
                q_int <= not q_int;
            end if;
        end if;
    end process;

    Q <= q_int;
end Behavioral;