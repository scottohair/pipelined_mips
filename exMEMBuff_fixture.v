`include "exMEMbuff.v"

module EX_MEM_Buf_fixture;

reg [15:0] data_in_bus;
wire [15:0] data_out_bus;
reg clk, rst;
integer i;
exMEMBuff exmembuf1(.data_in_bus(data_in_bus), .data_out_bus(data_out_bus), .clk(clk), .rst(rst));


   initial begin
      $display("Time\   data_in_bus              \data_out_bus           \clk    \rst");
      $display("-------------------------------------------------------------------------------------------------------------");
      $monitor("%0d\t%b\t%b\t%b\t%b", $time, data_in_bus, data_out_bus, clk, rst);
   end

   initial begin
     for (i = 0; i < 16; i = i + 1) begin
       data_in_bus = i;
       #10;

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
