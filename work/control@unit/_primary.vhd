library verilog;
use verilog.vl_types.all;
entity controlUnit is
    generic(
        start           : integer := 0;
        fetch           : integer := 1;
        decode          : integer := 2;
        load            : integer := 8;
        store           : integer := 9;
        add             : integer := 10;
        sub             : integer := 11;
        Input           : integer := 12;
        jz              : integer := 13;
        jpos            : integer := 14;
        halt            : integer := 15
    );
    port(
        IR              : in     vl_logic_vector(2 downto 0);
        Enter           : in     vl_logic;
        Aeq0            : in     vl_logic;
        Apos            : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        IRload          : out    vl_logic;
        JMPmux          : out    vl_logic;
        PCload          : out    vl_logic;
        Meminst         : out    vl_logic;
        MemWr           : out    vl_logic;
        Aload           : out    vl_logic;
        \Sub\           : out    vl_logic;
        \Halt\          : out    vl_logic;
        Asel            : out    vl_logic_vector(1 downto 0);
        displayState    : out    vl_logic_vector(3 downto 0)
    );
end controlUnit;
