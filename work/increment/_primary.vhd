library verilog;
use verilog.vl_types.all;
entity increment is
    port(
        Input           : in     vl_logic_vector(4 downto 0);
        Output          : out    vl_logic_vector(4 downto 0)
    );
end increment;
