`include "TwotoOnemux.v"
`include "Program_Counter.v"
`include "InstructionMemory.v"
`include "TwoByteAdder.v"

module IMFixture;

//General
reg clk, rst;

wire [15:0] PC_Out;
//Multiplexer
reg [15:0] IF_Mux_A;
reg [15:0] IF_Mux_B;
reg [15:0] IF_Mux_Sel;
wire [15:0] IF_Mux_Out;
TwotoOnemux my_mux( .a(PC_Out), .b(IF_Mux_B), .s(IF_Mux_Sel), .out(IF_Mux_Out) );

//Program Counter
PC my_pc(.in(IF_Mux_Out), .out(PC_Out), .clk(clk), .rst(rst));

//Instruction Memory
wire [15:0] IM_Out;
IM im1(.data_in(PC_Out), .data_out(IM_Out), .clk(clk), .rst(rst));

//IF Adder
wire [15:0] TwoByteAdderOut;
TwoByteAdder add1(.A(PC_Out), .R(TwoByteAdderOut));


initial
begin
  $display("Time\   TwoByteAdderOut                 \IF_Mux_B               \IF_Mux_Sel                IF_Mux_Out          PC_Out                  IM_Out                \clk    \rst");
  $display("-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
  $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, TwoByteAdderOut, IF_Mux_B, IF_Mux_Sel, IF_Mux_Out, PC_Out, IM_Out, clk, rst);
end


initial
begin
      rst = 0;
      #10
      rst = 1;
      IF_Mux_B = 0; IF_Mux_Sel= 1'b1; //1 will select top mux input on Datapath Diagram
      #10;
      IF_Mux_B = 1; IF_Mux_Sel= 1'b1;
      #10;
      IF_Mux_B = 2; IF_Mux_Sel= 1'b1;
      #10;
      IF_Mux_B = 3; IF_Mux_Sel= 1'b1;
      #10;
      IF_Mux_B = 4; IF_Mux_Sel= 1'b1;
      #10;
      IF_Mux_B = 5; IF_Mux_Sel= 1'b1;
      #10;
      IF_Mux_B = 6; IF_Mux_Sel= 1'b1;
      #20;
      IF_Mux_B = 7; IF_Mux_Sel= 1'b1;
      #20;

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

