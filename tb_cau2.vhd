library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cau2 is
end tb_cau2;

architecture Behavioral of tb_cau2 is
    component cau2
        Port ( A, B, C : in STD_LOGIC;
               F       : out STD_LOGIC );
    end component;

    signal A_tb, B_tb, C_tb, F_tb : STD_LOGIC;

begin
    UUT: cau2
        port map (
            A => A_tb,
            B => B_tb,
            C => C_tb,
            F => F_tb
        );

    process
    begin
        for i in 0 to 7 loop
            A_tb <= std_logic'val((i / 4) mod 2);
            B_tb <= std_logic'val((i / 2) mod 2);
            C_tb <= std_logic'val(i mod 2);
            wait for 10 ns;
        end loop;
        wait;
    end process;

end Behavioral;
