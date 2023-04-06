LIBRARY ieee;
USE IEEE.math_real.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SynRotaryEncoder IS
    PORT (
        AR : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        RE_CLK : IN STD_LOGIC;
        DT : IN STD_LOGIC;
        SW : IN STD_LOGIC;
        DIR : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        SW_PRESSED : OUT STD_LOGIC);
END SynRotaryEncoder;

ARCHITECTURE Arch OF SynRotaryEncoder IS
    TYPE StateType IS (LEFT, RIGHT, IDLE);
    SIGNAL state, next_state : StateType;
    SIGNAL noiseless_re_clk : STD_LOGIC;
    SIGNAL noiseless_dt : STD_LOGIC;
    SIGNAL noiseless_sw : STD_LOGIC;
    signal counter_prev, counter: std_logic_vector(1 downto 0) := (others => '0');

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
            CLK : IN STD_LOGIC;
            DT : IN STD_LOGIC;
            SW : IN STD_LOGIC;
            Q : OUT STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(MAX)))) - 1 DOWNTO 0);
            SW_PRESSED : OUT STD_LOGIC);
    END component;
BEGIN

    PROCESS (AR, CLK)
    BEGIN
        IF AR = '1' THEN
            state <= IDLE;
        ELSIF rising_edge(CLK) THEN
            state <= next_state;
        END IF;
    END PROCESS;

    

    state_next_state_process: process(clk)
    begin
        if counter /= counter_prev then
            if counter_prev = "11" and counter = "00" then
                next_state <= RIGHT;
            elsif counter_prev = "00" and counter = "11" then
                next_state <= LEFT;
            elsif to_integer(unsigned((counter_prev))) > to_integer(unsigned(counter)) then
                next_state <= LEFT;
            elsif to_integer(unsigned((counter_prev))) < to_integer(unsigned(counter)) then
                next_state <= RIGHT;
            end if;
        else 
            next_state <= IDLE;
        end if;
    
    end process;

    state_counter_prev_process: process(state)
    begin
        counter_prev <= counter;
    end process;

    state_dir_process : PROCESS (state)
    BEGIN
        CASE state IS
            WHEN LEFT =>
                DIR <= "10";
            WHEN RIGHT =>
                DIR <= "01";
            WHEN IDLE =>
                DIR <= "00";
        END CASE;
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
        MAX => 4,
        BORNED => '0'
    )port map(
        CLK => noiseless_re_clk,
        DT => noiseless_dt,
        SW=>noiseless_sw,
        Q => counter,
        SW_PRESSED => SW_PRESSED
    );
END Arch;