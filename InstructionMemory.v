//Instruction Memory

module IM(data_in, data_out, clk, rst);

//I/O
input [15:0] data_in;
input clk, rst;
output reg [15:0] data_out;
reg [32:0] reg_file [15:0];

always @ (*)
begin
        reg_file[0] = 16'b0000000000010000;
       	reg_file[1] = 16'b0000000000010001;
       	reg_file[2] = 16'b0010001011110000;
       	reg_file[3] = 16'b0001001001001100;
       	reg_file[4] = 16'b0000010001010100;
       	reg_file[5] = 16'b0000000001001000;
       	reg_file[6] = 16'b0000111111110001;
       	reg_file[7] = 16'b0000001101111110;
       	reg_file[8] = 16'b0000001101011111;
       	reg_file[9] = 16'b0010001100000010;
        reg_file[10] = 16'b1000010110000100;
        reg_file[11] = 16'b1001010110000110;
        reg_file[12] = 16'b1010010110000110;
        reg_file[13] = 16'b0110011000100000;
        reg_file[14] = 16'b0000101000000000;
        reg_file[15] = 16'b0100011001010000;
        reg_file[16] = 16'b0000101000010000;
        reg_file[17] = 16'b0101011000100000;
        reg_file[18] = 16'b0000000000000000;
        reg_file[19] = 16'b0000000000000000;
        reg_file[20] = 16'b1010011110000000;
        reg_file[21] = 16'b0000011101110000;
        reg_file[22] = 16'b1011011110000000;
        reg_file[23] = 16'b1010100110000010;
        reg_file[24] = 16'b0000101110110000;
        reg_file[25] = 16'b0000110011000001;
       	reg_file[26] = 16'b0000101111000000;
       	reg_file[27] = 16'b1110111100100000;
	data_out = reg_file[data_in];
end
endmodule	
