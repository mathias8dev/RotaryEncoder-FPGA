------------------------------------------------
------ Ne multiplie pas une fréquence (voir PLL)
------------------------------------------------

LIBRARY ieee;
USE IEEE.math_real.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FrequencyDivider IS
    GENERIC (
        MULTIPLY_BY : INTEGER := 1;
        DIVIDE_BY : INTEGER := 1
    );
    PORT (
        ARESET : IN STD_LOGIC;
        CLK_IN : IN STD_LOGIC;
        CLK_OUT : OUT STD_LOGIC
    );
END ENTITY FrequencyDivider;

ARCHITECTURE arch OF FrequencyDivider IS
    CONSTANT counter_max : INTEGER := INTEGER(DIVIDE_BY / (2 * MULTIPLY_BY)) - 1;
    TYPE StateType IS (HIGH, LOW, UNDEFINED);
    SIGNAL counter, counter_next : INTEGER RANGE 0 TO counter_max + 1 := 0;
    SIGNAL state, next_state : StateType := UNDEFINED;

BEGIN
    PROCESS (CLK_IN, ARESET)
    BEGIN
        IF ARESET = '1' THEN
            counter <= 0;
            state <= UNDEFINED;
        ELSIF rising_edge(CLK_IN) THEN
            counter <= counter_next;
            state <= next_state;
        END IF;
    END PROCESS;

    state_state_next_process : PROCESS (CLK_IN)
    BEGIN
        IF counter = counter_max THEN
            CASE state IS
                WHEN HIGH =>
                    next_state <= LOW;
                WHEN LOW =>
                    next_state <= HIGH;
                WHEN OTHERS =>
                    next_state <= HIGH;
            END CASE;
        END IF;
    END PROCESS;

    state_counter_next_process : PROCESS (CLK_IN)
    BEGIN
        IF counter_max < 0 THEN
            counter_next <= 0;

        ELSIF counter = counter_max THEN
            counter_next <= 0;
        ELSE
            counter_next <= counter + 1;
        END IF;

    END PROCESS;

    output_clk_out_process : PROCESS (CLK_IN)
    BEGIN
        IF counter_max < 0 THEN
            CLK_OUT <= CLK_IN;
        ELSIF rising_edge(CLK_IN) THEN
            CASE state IS
                WHEN UNDEFINED =>
                    clk_out <= 'U';
                WHEN LOW =>
                    clk_out <= '0';
                WHEN HIGH =>
                    clk_out <= '1';
            END CASE;
        END IF;
    END PROCESS;
END ARCHITECTURE arch;