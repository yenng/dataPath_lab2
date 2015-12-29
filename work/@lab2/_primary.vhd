library verilog;
use verilog.vl_types.all;
entity Lab2 is
    port(
        Enter           : in     vl_logic;
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        \In\            : in     vl_logic;
        Input           : in     vl_logic_vector(7 downto 0);
        Halt            : out    vl_logic;
        Output          : out    vl_logic_vector(7 downto 0);
        displayState    : out    vl_logic_vector(3 downto 0);
        IR              : out    vl_logic_vector(2 downto 0)
    );
end Lab2;
