`include "SignExtend.v"

module SignExtendfixture;

reg clk, rst;
reg [3:0] A;
wire [15:0] SignExtResult;

SignExtend se1(.in(A), .extended_out(SignExtResult));


   initial begin
      $display("Time	  \A        \SignExtResult");
      $display("-------------------------------------------------");
      $monitor("%0d\t%b\t%b", $time, A, SignExtResult);
   end

   initial begin
    A = 4'b0001;
    #10;
    A = 4'b1000;
    #10;
    A = 4'b1111;
    #10;
    A = 4'b1001;
    #10;
    A = 4'b0000;
    #10;
   end

// Setup the clock to toggle
initial
begin
       clk = 1'b0;
       forever #5 clk = ~clk;
end

//Finish the simulation
initial
begin
       #100 $finish;
end
endmodule