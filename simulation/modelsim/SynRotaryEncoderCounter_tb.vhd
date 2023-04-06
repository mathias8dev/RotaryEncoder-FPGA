LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;
USE ieee.math_real.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SynRotaryEncoderCounter_tb IS
END ENTITY;

ARCHITECTURE arch OF SynRotaryEncoderCounter_tb IS
    CONSTANT clock_period : TIME := 250 ns;
    CONSTANT max : INTEGER := 100;
    constant borned : STD_LOGIC := '1';

    SIGNAL ar, clk, re_clk, dt, sw : STD_LOGIC;
    SIGNAL dt_delayed : BOOLEAN := false;
    SIGNAL counter : STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(max)))) - 1 DOWNTO 0);

    COMPONENT SynRotaryEncoderCounter IS
        GENERIC (
            MAX : INTEGER := 4;
            BORNED : STD_LOGIC := '1');
        PORT (
            AR : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            RE_CLK : IN STD_LOGIC;
            DT : IN STD_LOGIC;
            SW : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(MAX)))) - 1 DOWNTO 0));
    END COMPONENT;
BEGIN

    ar_process : PROCESS
    BEGIN
        ar <= '1';
        WAIT FOR clock_period * 8;
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

    re_clk_process : PROCESS
    BEGIN
        re_clk <= '1';
        WAIT FOR clock_period * 2;
        re_clk <= '0';
        WAIT FOR clock_period * 2;
    END PROCESS;

    dt_process : PROCESS
    BEGIN
        IF NOT dt_delayed THEN
            dt <= '0';
            WAIT FOR clock_period;
            dt_delayed <= true;
        END IF;
        dt <= '1';
        WAIT FOR clock_period * 2;
        dt <= '0';
        WAIT FOR clock_period * 2;
    END PROCESS;

    sw_process : PROCESS
    BEGIN
        sw <= '1';
        WAIT FOR clock_period * 2 - clock_period;
        sw <= '0';
        WAIT FOR clock_period * 2 - clock_period;
    END PROCESS;

    SynRotaryEncoderCounter_inst : SynRotaryEncoderCounter GENERIC MAP(
        MAX => max,
        BORNED => borned
        )PORT MAP(
        AR => ar,
        CLK => clk,
        RE_CLK => re_clk,
        DT => dt,
        SW => sw,
        Q => counter
    );
END ARCHITECTURE;