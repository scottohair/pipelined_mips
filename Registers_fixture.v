`include "Registers.v"

module RegFixture;

reg [3:0] ReadReg1, ReadReg2, WriteReg1, WriteReg2;
reg [15:0] WriteData1, WriteData2;
wire [15:0] RegOut1, RegOut2;
reg WriteEnable, clk, rst;
integer i;

Registers reg1(.ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .WriteReg1(WriteReg1), .WriteReg2(WriteReg2),
         .WriteData1(WriteData1), .WriteData2(WriteData2), .RegOut1(RegOut1), .RegOut2(RegOut2), .WriteEnable(WriteEnable), .clk(clk), .rst(rst));

   initial begin
      $display("Time\    RReg1   RReg2    WReg1   WReg2         WriteData1           WriteData2                 RegOut1             RegOut2             WE    clk   rst");
      $display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, ReadReg1, ReadReg2, WriteReg1, WriteReg2, WriteData1, WriteData2, RegOut1, RegOut2, WriteEnable, clk, rst);
   end

   initial begin
     rst = 0;
     #10;
     rst = 1;
     for (i = 0; i < 16; i = i + 1) begin
       ReadReg1 = i;
       ReadReg2 = i;
       #5;

     end
     for (i = 0; i < 16; i = i + 1) begin
       ReadReg1 = i;
       ReadReg2 = i;
       #5;

     end
   end

   initial begin
     //Test writing to registers
     #20
     WriteEnable = 1;
     WriteReg2 = 4'b1101;
     WriteData2 = 16'b1010101010101010;
     #10
     WriteEnable = 0;
     #20
     WriteReg1 = 4'b1111;
     WriteData1 = 16'b1111111111111111;
     #40
     rst = 0;
     #10
     rst = 1;
   end

// Setup the clock to toggle every 10 time units
initial
begin
       clk = 1'b0;
       forever #5 clk = ~clk;
end

// Finish the simulation at time 200
initial
begin
       #200 $finish;
end
endmodule

