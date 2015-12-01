module	memRAM();
	reg	Clock;
	reg 	[7:0] D;
	reg 	[4:0] Address;
	reg 	WE;
	wire	[7:0] Q;
	
	
	memRAM		part2(Clock,D,Address,WE,Q);
	
endmodule 