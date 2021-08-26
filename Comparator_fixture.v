`include "Comparator.v"

module Comparatorfixture;

reg [15:0] A, B;
wire R;

Comparator comp1(.A(A), .B(B), .R(R));


   initial begin
      $display("Time\tA\t\t\t\tB\t\tR");
      $display("---------------------------------");
      $monitor("%0d\t%b\t%b\t%b", $time, A, B, R);
   end

   initial begin
      A = 1; B = 2;
      #1;
      A = 1; B = 1;
      #1;
      A = 1; B = 3;
      #1;
      A = 1; B = 3;
      #1;
      A = 7; B = 3;
   end
endmodule
