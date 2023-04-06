LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;
USE IEEE.math_real.ALL;
USE ieee.numeric_std.ALL;

ENTITY RotaryEncoderCounter_tb IS
END ENTITY;

ARCHITECTURE arch OF RotaryEncoderCounter_tb IS
    SIGNAL ar, clk, dt, sw, sw_pressed : STD_LOGIC;
    SIGNAL q : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL delayed : BOOLEAN := false;

    CONSTANT clock_period : TIME := 250 ns;
    COMPONENT RotaryEncoderCounter IS
        GENERIC (
            MAX : INTEGER := 4;
            BORNED : STD_LOGIC := '1');
        PORT (
            AR : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            DT : IN STD_LOGIC;
            SW : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(MAX)))) - 1 DOWNTO 0);
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
        WAIT FOR clock_period * 4 - clock_period;
        clk <= '0';
        WAIT FOR clock_period * 4 - clock_period;
    END PROCESS;

    dt_process : PROCESS
    BEGIN
        IF NOT delayed THEN
            dt <= '0';
            WAIT FOR clock_period;
            delayed <= true;
        END IF;
        dt <= '1';
        WAIT FOR clock_period * 4 - clock_period;
        dt <= '0';
        WAIT FOR clock_period * 4 - clock_period;
    END PROCESS;

    sw_process : PROCESS
    BEGIN
        sw <= '1';
        WAIT FOR clock_period * 2 - clock_period;
        sw <= '0';
        WAIT FOR clock_period * 2 - clock_period;
    END PROCESS;
    RotaryEncoderCounter_inst : RotaryEncoderCounter GENERIC MAP(
        MAX => 8,
        BORNED => '1'
        )PORT MAP(
        AR => ar,
        CLK => clk,
        DT => dt,
        SW => sw,
        Q => q,
        SW_PRESSED => sw_pressed
    );
END ARCHITECTURE;