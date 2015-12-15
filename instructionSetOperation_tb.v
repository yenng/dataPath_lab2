module instructionSetOperation_tb();
	reg Aload, Reset, Clock, Sub;
	reg [1:0] Asel;
	reg [7:0] Input, Q;
	wire Aeq0, Apos;
	wire [7:0] Output;
	
	initial begin
		Aload	= 1;
		Reset	= 1;
		Clock	= 0;
		Sub		= 0;
		Asel	= 2'b11;
		Q		= {$random}%256;
		Input	= {$random}%256;
	#2	Reset 	= 0;
	#2	aselChanges();
	#2	Sub = 1;
	#2	aselChanges();
	end	
	always #1 Clock = ~Clock;
	
	initial begin
		$display("Aload	Reset	Sub	Asel	Input	Aeq0	Apos	Q	Output");
		$monitor("%d	%d	%d	%d	%d	%d	%d	%d	%d",
		Aload,Reset,Sub,Asel,Input,Aeq0,Apos,Q,Output);
	end
	
	
	
	
	instructionSetOperation		part3(Aload, Reset, Clock, Sub, Asel, Input, Q, Aeq0, Apos, Output);

	task aselChanges; begin
		while(Asel > 2'b00)
			#2	Asel = Asel - 1;
		#2	Asel = 2'b10;
		end
	endtask
endmodule 