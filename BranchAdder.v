module BranchAdder(A, B, R);

// I/O ports
input [15:0] A, B;
output reg signed [15:0] R;


always @( * )
begin
  R = A + (B << 1);
end

endmodule