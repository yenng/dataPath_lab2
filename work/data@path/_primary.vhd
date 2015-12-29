library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        IRload          : in     vl_logic;
        JMPmux          : in     vl_logic;
        PCload          : in     vl_logic;
        Meminst         : in     vl_logic;
        MemWr           : in     vl_logic;
        Aload           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Sub             : in     vl_logic;
        \In\            : in     vl_logic;
        Asel            : in     vl_logic_vector(1 downto 0);
        Input           : in     vl_logic_vector(7 downto 0);
        Aeq0            : out    vl_logic;
        Apos            : out    vl_logic;
        Address         : out    vl_logic_vector(4 downto 0);
        IR              : out    vl_logic_vector(2 downto 0);
        Output          : out    vl_logic_vector(7 downto 0);
        RAM_Q           : out    vl_logic_vector(7 downto 0)
    );
end dataPath;
