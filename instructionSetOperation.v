module instructionSetOperation(
	input Aload, Reset, Clock, Sub,
	input [1:0] Asel,
	input [7:0] Input, Q, D,
	output reg Aeq0, Apos,
	output [7:0] Output);
	
	reg [7:0] muxOut1, muxOut2, subOut;
	
	multiplexer #(.data_size(8)) Asel_mux1(Asel[0:0],Input,subOut,muxOut1);
	multiplexer #(.data_size(8)) Asel_mux2(Asel[1:1],Q,muxOut1,muxOut2);
	register #(.data_size(8)) ARegister(Aload, Clock, Reset, muxOut2, Output);
	sub add_sub(Sub, Output, Q, SubOut);
	
	always@(Output) begin
		if (Output == 0) Aeq0 = 1;
		else Aeq0 = 0;
		
		if (Output[7:7] == 1) Apos = 0;
		else Apos = 1;
	end 
endmodule 