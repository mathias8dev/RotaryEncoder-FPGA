LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.ALL;

ENTITY FrequencyDivider_tb IS
END FrequencyDivider_tb;
ARCHITECTURE arch OF FrequencyDivider_tb IS
    SIGNAL areset : STD_LOGIC;
    SIGNAL clk_in : STD_LOGIC;
    SIGNAL clk_out : STD_LOGIC;

    CONSTANT clock_period : TIME := 250 ns;

    COMPONENT FrequencyDivider IS
        GENERIC (
            MULTIPLY_BY : INTEGER := 1;
            DIVIDE_BY : INTEGER := 1
        );
        PORT (
            ARESET : IN STD_LOGIC;
            CLK_IN : IN STD_LOGIC;
            CLK_OUT : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN

    areset_process : PROCESS
    BEGIN
        areset <= '1';
        WAIT FOR clock_period;
        areset <= '0';
        WAIT;
    END PROCESS;

    clk_in_process : PROCESS
    BEGIN
        clk_in <= '1';
        WAIT FOR clock_period / 2;
        clk_in <= '0';
        WAIT FOR clock_period / 2;
    END PROCESS;

    FrequencyDivider_inst : FrequencyDivider GENERIC MAP(
        MULTIPLY_BY => 1,
        DIVIDE_BY => 4
        )PORT MAP(
        ARESET => areset,
        CLK_IN => clk_in,
        CLK_OUT => clk_out
    );
END ARCHITECTURE;