`include "InstructionMemory.v"

module IMFixture;

reg [15:0] data_in;
wire [15:0] data_out;
reg clk, rst;
integer i;
IM im1(.data_in(data_in), .data_out(data_out), .clk(clk), .rst(rst));


   initial begin
      $display("Time\   data_in                 \data_out              \clk    \rst");
      $display("-------------------------------------------------------------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b", $time, data_in, data_out, clk, rst);
   end

   initial begin
     for (i = 0; i < 16; i = i + 1) begin
       data_in = i;
       #5;

     end
    
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
       #100 $finish;
end
endmodule


