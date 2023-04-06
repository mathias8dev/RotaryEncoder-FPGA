LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;
ENTITY DFlipFlop_tb IS
END ENTITY;

ARCHITECTURE arch OF DFlipFlop_tb IS
    SIGNAL ar, clk, d, q : STD_LOGIC;
    CONSTANT clock_period : TIME := 250 ns;

    COMPONENT DFlipFlop IS
        PORT (
            AR : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            D : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT DFlipFlop;
BEGIN

    ar_process : PROCESS
    BEGIN
        ar <= '1';
        WAIT FOR 4 * clock_period;
        ar <= '0';
        WAIT;
    END PROCESS;

    clk_process : PROCESS
    BEGIN
        clk <= '1';
        WAIT FOR clock_period / 2;
        clk <= '0';
        WAIT FOR clock_period / 2;
    END PROCESS;

    d_process : PROCESS
    BEGIN
        d <= '1';
        WAIT FOR clock_period * 3 - clock_period / 2;
        d <= '0';
        WAIT FOR clock_period * 4;
    END PROCESS;

    DFlipFlop_inst : DFlipFlop PORT MAP(
        AR => ar,
        CLK => clk,
        D => d,
        Q => q
    );
END ARCHITECTURE;