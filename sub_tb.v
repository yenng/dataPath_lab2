module sub_tb();
	reg Sub;
	reg [7:0] in1, in2;
	wire [7:0] Out;
	
	initial begin
		Sub	= 0;
		in1	= 1;
		in2	= 2;
	end	

	initial begin
		$display("Sub	in1	in2	Out");
		$monitor("%d	%d	%d	%d",
		Sub, in1, in2, Out);
	end
	





	sub		subTest(Sub, in1, in2, Out);

endmodule