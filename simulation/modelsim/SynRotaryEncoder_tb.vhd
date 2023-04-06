LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY SynRotaryEncoder_tb IS
END ENTITY;

ARCHITECTURE arch OF SynRotaryEncoder_tb IS
    SIGNAL ar, clk, re_clk, dt, sw, sw_pressed : STD_LOGIC;
    SIGNAL dir : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL dt_delayed : BOOLEAN := false;
    CONSTANT clock_period : TIME := 250 ns;

    COMPONENT SynRotaryEncoder IS
        PORT (
            AR : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            RE_CLK : IN STD_LOGIC;
            DT : IN STD_LOGIC;
            SW : IN STD_LOGIC;
            DIR : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
            SW_PRESSED : OUT STD_LOGIC);
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
            WAIT FOR clock_period ;
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
    SynRotaryEncoder_inst : SynRotaryEncoder PORT MAP(
        AR => ar,
        clk => clk,
        RE_CLK => re_clk,
        DT => dt,
        SW => sw,
        DIR => dir,
        SW_PRESSED => sw_pressed
    );
END ARCHITECTURE;