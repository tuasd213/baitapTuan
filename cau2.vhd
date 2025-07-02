library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cau2 is
    Port ( A, B, C : in STD_LOGIC;
           F       : out STD_LOGIC);
end cau2;

architecture NOR_only of cau2 is
    signal A_N, B_N, C_N : STD_LOGIC;
    signal A_N_N, T1_temp, T1, T2_temp, T2, T3_temp, T3 : STD_LOGIC;
    signal T1_N, T2_N, T3_N, OR1, OR2, OR3, F_temp : STD_LOGIC;
begin
    A_N     <= A nor A;
    B_N     <= B nor B;
    C_N     <= C nor C;

    T1_temp <= A_N nor B_N;
    T1      <= T1_temp nor T1_temp;

    T2_temp <= A_N nor C_N;
    T2      <= T2_temp nor T2_temp;

    T3_temp <= B_N nor C_N;
    T3      <= T3_temp nor T3_temp;

    T1_N <= T1 nor T1;
    T2_N <= T2 nor T2;
    T3_N <= T3 nor T3;

    OR1 <= T1_N nor T2_N;
    OR2 <= OR1 nor OR1;
    OR3 <= OR2 nor T3_N;
    F   <= OR3 nor OR3;
end NOR_only;
