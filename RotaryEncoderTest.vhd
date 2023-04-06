LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY RotaryEncoderTest IS PORT (
    AR : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    RE_CLK : IN STD_LOGIC;
    DT : IN STD_LOGIC;
    SW : IN STD_LOGIC;
    DIR : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    SW_PRESSED : OUT STD_LOGIC
);

END RotaryEncoderTest;

ARCHITECTURE arch OF RotaryEncoderTest IS
    SIGNAL clk_15 : STD_LOGIC;

    --------------------------------------------------
    --- component
    ------------------------------------------------
    COMPONENT SynRotaryEncoder IS PORT (
        AR : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        RE_CLK : IN STD_LOGIC;
        DT : IN STD_LOGIC;
        SW : IN STD_LOGIC;
        DIR : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        SW_PRESSED : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT FrequencyDivider IS
    GENERIC (
        MULTIPLY_BY : INTEGER := 3;
        DIVIDE_BY : INTEGER := 10000000
    );
    PORT (
        clk_in : IN STD_LOGIC;
        areset : IN STD_LOGIC;
        clk_out : OUT STD_LOGIC
    );
    END COMPONENT;
BEGIN

    -----------------------------------------------------
    ---- component_inst
    ------------------------------------------
    FrequencyDivider_inst : FrequencyDivider GENERIC MAP(
		MULTIPLY_BY => 3,
		DIVIDE_BY => 5000000
	 ) PORT MAP(
        areset => AR,
        clk_in => CLK,
        clk_out => clk_15
    );

    SynRotaryEncoder_inst : SynRotaryEncoder PORT MAP(
        AR => '0',
        clk => clk_15,
        RE_CLK => RE_CLK,
        DT => DT,
        SW => SW,
        DIR => DIR,
        SW_PRESSED => SW_PRESSED
    );
END ARCHITECTURE arch;