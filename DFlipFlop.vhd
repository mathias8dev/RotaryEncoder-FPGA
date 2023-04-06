LIBRARY ieee;
USE IEEE.math_real.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DFlipFlop IS
    PORT (
        AR : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        D : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END DFlipFlop;

ARCHITECTURE Arch OF DFlipFlop IS

BEGIN

    PROCESS (AR, CLK)
    BEGIN
        IF (AR = '1') THEN
            Q <= '0';
        ELSIF rising_edge(CLK) THEN
            Q <= D;
        END IF;
    END PROCESS;
END Arch;