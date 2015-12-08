library verilog;
use verilog.vl_types.all;
entity instructionSetOperation is
    port(
        Aload           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        Sub             : in     vl_logic;
        Asel            : in     vl_logic_vector(1 downto 0);
        Input           : in     vl_logic_vector(7 downto 0);
        Q               : in     vl_logic_vector(7 downto 0);
        Aeq0            : out    vl_logic;
        Apos            : out    vl_logic;
        Output          : out    vl_logic_vector(7 downto 0)
    );
end instructionSetOperation;
