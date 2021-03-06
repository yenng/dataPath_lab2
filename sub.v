module sub(
	input Sub,
	input [7:0] in1, in2,
	output reg [7:0] Out);
	
	always@(in1,in2,Sub) begin
		if(!Sub) Out = in1 + in2;
		else 
			Out = in1 - in2;
	end 
endmodule 