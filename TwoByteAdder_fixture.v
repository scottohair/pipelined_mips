`include "TwoByteAdder.v"

module TwoByteAdderfixture;

reg clk, clr;
reg [15:0] A, B;
wire [15:0] Add_R;

TwoByteAdder add1(.A(A), .R(Add_R));


   initial begin
      $display("Time            \A              \Add_R");
      $display("-------------------------------------------------");
      $monitor("%0d\t%b\t%b", $time, A, Add_R);
   end

   initial begin
    A = 16'b0000000000000001;
    #1;
    A = 16'b0000000001000000;
    #1;
    A = 16'b0010000000000001;
    #1;
    A = 16'b0100000000001001;
    #1;
    A = 16'b0000000010000000;
    #1;
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