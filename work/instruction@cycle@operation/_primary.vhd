library verilog;
use verilog.vl_types.all;
entity instructionCycleOperation is
    port(
        IRload          : in     vl_logic;
        JMPmux          : in     vl_logic;
        PCload          : in     vl_logic;
        Meminst         : in     vl_logic;
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        IR              : out    vl_logic_vector(2 downto 0);
        Address         : out    vl_logic_vector(4 downto 0)
    );
end instructionCycleOperation;
