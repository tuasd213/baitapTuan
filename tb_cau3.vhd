library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cau3 is
end tb_cau3;

architecture Behavioral of tb_cau3 is
    signal clk_tb : STD_LOGIC := '0';
    signal Q_tb   : STD_LOGIC_VECTOR(2 downto 0);

    component cau3
        Port (
            clk : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

begin
    uut: cau3 port map (
        clk => clk_tb,
        Q   => Q_tb
    );

    clk_process : process
    begin
        while now < 120 ns loop
            clk_tb <= '0';
            wait for 5 ns;
            clk_tb <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

end Behavioral;