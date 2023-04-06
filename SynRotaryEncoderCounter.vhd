LIBRARY ieee;
USE IEEE.math_real.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SynRotaryEncoderCounter IS
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
END SynRotaryEncoderCounter;

ARCHITECTURE Arch OF SynRotaryEncoderCounter IS
    signal counter: STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(MAX)))) - 1 DOWNTO 0);
    SIGNAL noiseless_re_clk, noiseless_dt, noiseless_sw : STD_LOGIC;

    COMPONENT DFlipFlop IS
        PORT (
            AR : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            D : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT DFlipFlop;

    component RotaryEncoderCounter IS
        GENERIC (
            MAX : INTEGER := 4;
            BORNED : STD_LOGIC := '1');
        PORT (
            AR: IN std_logic;
            CLK : IN STD_LOGIC;
            DT : IN STD_LOGIC;
            SW : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(MAX)))) - 1 DOWNTO 0);
            SW_PRESSED : OUT STD_LOGIC);
    END component;
BEGIN

    PROCESS (AR, CLK)
    BEGIN
        IF rising_edge(CLK) THEN
            Q <= counter;
        END IF;
    END PROCESS;

    

    ----------------------------------------------
    ----- components
    ----------------------------------------------
    RO_CLK_cleaned : DFlipFlop PORT MAP(
        AR => AR,
        CLK => CLK,
        D => RE_CLK,
        Q => noiseless_re_clk
    );

    DT_cleaned : DFlipFlop PORT MAP(
        AR => AR,
        CLK => CLK,
        D => DT,
        Q => noiseless_dt
    );

    SW_cleaned : DFlipFlop PORT MAP(
        AR => AR,
        CLK => CLK,
        D => SW,
        Q => noiseless_sw
    );

    RotaryEncoderCounter_inst: RotaryEncoderCounter generic map(
        MAX => MAX,
        BORNED => BORNED
    )port map(
        AR => AR,
        CLK => noiseless_re_clk,
        DT => noiseless_dt,
        SW=>noiseless_sw,
        Q => counter,
        SW_PRESSED => open
    );
END Arch;