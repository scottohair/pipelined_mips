//Two to One Multiplexer

module ForwardingUnit(IFEXReg1, IFEXReg2, EXMEMReg1, MEMWBReg1, WriteEnable, out1, out2); 

input [3:0] IFEXReg1, IFEXReg2, EXMEMReg1, MEMWBReg1; 
input WriteEnable;
output reg [1:0] out1, out2; 

// used in procedural statement 
always @ (*) 
	if (WriteEnable) begin
		if (IFEXReg1 == EXMEMReg1) 	//MEM Stage contains ALUOperand
			out1 = 2'b01;	//top mux
		else if (IFEXReg2 == EXMEMReg1)
			out2 = 2'b01;	//bottom mux	
		else if (IFEXReg1 == MEMWBReg1) 	//MEM Stage contains ALUOperand
			out1 = 2'b11;	//top mux
		else if (IFEXReg2 == MEMWBReg1)
			out2 = 2'b11;	//bottom mux
		else begin							//lets default to the top selector
			out1 = 2'b00;	//top mux
			out2 = 2'b00;	//bottom mux
		end
	end
endmodule

