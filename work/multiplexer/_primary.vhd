library verilog;
use verilog.vl_types.all;
entity multiplexer is
    generic(
        data_size       : integer := 8
    );
    port(
        selector        : in     vl_logic;
        input1          : in     vl_logic_vector;
        input2          : in     vl_logic_vector;
        Output          : out    vl_logic_vector
    );
end multiplexer;
