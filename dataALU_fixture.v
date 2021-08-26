`include "dataALU.v"

module dataALUfixture;

reg [16:0] Op1, Op2;
reg [3:0] Control;
wire [31:0] ALU_out;
reg clk, rst, signFlag;

dataALU alu(.Op1(Op1), .Op2(Op2), .Control(Control), .data_out(ALU_out), .signFlag(signFlag));


   initial begin
      $display("Time\top1\t\t\top2\t\t\tControl\t\tALUout\t\t\t\tSF\tclk\trst");
      $display("---------------------------------------------------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, Op1, Op2, Control, ALU_out, signFlag, clk, rst);
   end

   initial begin
      Op1 = 1; Op2 = 2; Control = 4'b0000;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0001;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0010;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0011;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0100;  
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0101;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0110;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b0111;   
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b1000;  
      #10;
      Op1 = 1; Op2 = 2; Control = 4'b1001;
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