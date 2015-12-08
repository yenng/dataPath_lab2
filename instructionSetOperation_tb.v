module instructionSetOperation_tb();
	reg Aload, Reset, Clock, Sub;
	reg [1:0] Asel;
	reg [7:0] Input, Q;
	wire Aeq0, Apos;
	wire [7:0] Output;
	
	initial begin
		Aload	= 0;
		Reset	= 0;
		Clock	= 0;
		Sub		= 0;
		Asel	= 2'b11;
		Q		= 0;
		Input	= 0;
	#2	Reset 	= 1;
	#2	Reset	= 0;
	end	
	always #1 Clock = ~Clock;
	
	initial begin
		$display("Aload	Reset	Sub	Asel	Input	Aeq0	Apos	Q	Output");
		$monitor("%d	%d	%d	%d	%d	%d	%d	%d	%d",
		Aload,Reset,Sub,Asel,Input,Aeq0,Apos,Q,Output);
		aselChanges();
		aselChanges();
	end
	
	
	
	
	instructionSetOperation		part3(Aload, Reset, Clock, Sub, Asel, Input, Q, Aeq0, Apos, Output);

	task aselChanges; begin
		while(Asel > 2'b00)
			#2	Asel = Asel - 1;
		#2	Asel = 2'b11;
			Aload = ~Aload;
		end
	endtask
endmodule 