library verilog;
use verilog.vl_types.all;
entity \register\ is
    generic(
        data_size       : integer := 8
    );
    port(
        load            : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
end \register\;
