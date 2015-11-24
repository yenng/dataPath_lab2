module multiplexer
#(parameter data_size = 8)
(input selector,
input[data_size-1:0] input1, input2,
output reg [data_size-1:0] Output);

always@(selector, input1, input2) begin
	if(selector)
		Output = input1;
	else
		Output = input2;
	end

endmodule 