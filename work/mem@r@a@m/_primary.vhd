library verilog;
use verilog.vl_types.all;
entity memRAM is
    port(
        Clock           : in     vl_logic;
        \In\            : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        Address         : in     vl_logic_vector(4 downto 0);
        WE              : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0)
    );
end memRAM;
