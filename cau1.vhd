library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau1 is
    Port ( A, B, C : in STD_LOGIC;
           F       : out STD_LOGIC);
end cau1;

architecture NAND_only of cau1 is
    signal A_N, T1_temp, T1, T2_temp, T2, T3_temp, T3 : STD_LOGIC;
    signal T1_N, T2_N, T3_N, T12_or, T12_or_N, F_temp : STD_LOGIC;
begin
    A_N     <= A nand A;

    T1_temp <= A_N nand B;
    T1      <= T1_temp nand T1_temp;

    T2_temp <= A_N nand C;
    T2      <= T2_temp nand T2_temp;

    T3_temp <= B nand C;
    T3      <= T3_temp nand T3_temp;

    T1_N    <= T1 nand T1;
    T2_N    <= T2 nand T2;
    T3_N    <= T3 nand T3;

    T12_or      <= T1_N nand T2_N;
    T12_or_N    <= T12_or nand T12_or;

    F_temp <= T12_or_N nand T3_N;
    F      <= F_temp nand F_temp;
end NAND_only;
