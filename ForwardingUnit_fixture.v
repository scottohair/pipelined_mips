`include "ForwardingUnit.v"

module forwardFixture;

reg [3:0] IFEXReg1, IFEXReg2, EXMEMReg1, MEMWBReg1; 
reg WriteEnable;
wire [1:0] out1, out2; 
reg clk, rst;

ForwardingUnit forw(IFEXReg1, IFEXReg2, EXMEMReg1, MEMWBReg1, WriteEnable, out1, out2); 


   initial begin
      $display("Time\tEXMEM1\tIFEX1\tIFEX2\tMEMR1\tWE\tout1\tout2\tclk\trst");
      $display("---------------------------------------------------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, EXMEMReg1, IFEXReg1, IFEXReg2, MEMWBReg1, WriteEnable, out1, out2, clk, rst);
   end

   initial begin
   	  WriteEnable = 1;
      EXMEMReg1 = 3; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 7; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 1; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 7; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 1; MEMWBReg1 = 3; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 1; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 3; WriteEnable = 1;  
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 3; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 1; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 3; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 3; WriteEnable = 1;   
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 3; WriteEnable = 1;  
      #10;
      EXMEMReg1 = 2; IFEXReg1 = 1; IFEXReg2 = 7; MEMWBReg1 = 3; WriteEnable = 1;
   end
   
   
// Setup the clock to toggle every 10 time units
initial
begin
       clk = 1'b0;
       forever #10 clk = ~clk;
end

// Finish the simulation at time 200
initial
begin
       #200 $finish;
end


endmodule