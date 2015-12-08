library verilog;
use verilog.vl_types.all;
entity sub is
    port(
        Sub             : in     vl_logic;
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        \Out\           : out    vl_logic_vector(7 downto 0)
    );
end sub;
