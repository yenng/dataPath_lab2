module sub(
	input Sub,
	input [7:0] in1, in2,
	output reg [7:0] Out);
	
	always@(in1,in2,Sub) begin
		if(!Sub) Out = in1 + in2;
		else begin
		if(in1 > in2)
			Out = in1 - in2;
		else if(in2 > in2)
			Out = in2 - in1;
		else 
			Out = 0;
		end
	end 
endmodule 