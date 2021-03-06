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
	
	
	always	#2	in1 = in1 + 1;
	always	#2	in2 = in2 + 2;
	always	#2	Sub = ~Sub;

	sub		subTest(Sub, in1, in2, Out);

endmodule