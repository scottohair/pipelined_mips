//ALU comparator module
module Comparator(A, B, R);

// I/O ports
input [15:0] A;
input [15:0] B;
output reg R;


always @( * )
begin
       if (A == B)
          R = 1'b1;
       else
          R = 1'b0;

end

endmodule