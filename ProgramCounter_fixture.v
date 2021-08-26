`include "Program_Counter.v"

module PC_tb;

reg clk, clr;
reg [15:0] in;
wire [15:0] out;

PC my_pc(in, out, clk, rst);

initial
begin
   #1 $monitor("time = %d	", $time, "clk = %b ", clk, "rst = %b ", rst, "  |  in = ", in, "  |  out = ", out );

      clr = 0;
      in = 1;
      #10;
      in = 2;
      #10;
      in = 3;
      #10;
      in = 4;
      #10;
      in = 5;
      #10;
      clr = 1;
      in = 6;
      #10;
      clr = 0;
      in = 7;
      #10;

    $finish;
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
       #40 $finish;
end


endmodule