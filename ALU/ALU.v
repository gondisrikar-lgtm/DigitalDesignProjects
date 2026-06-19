`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 16:11:19
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU#(parameter N = 8)
(
input[N-1:0] A,
input[N-1:0] B,
input[2:0] OP,
output reg[N-1:0] Y
    );
always@(*)
begin
   case(OP)
   
   3'b000: Y = A + B;
   3'b001: Y = A - B;
   3'b010: Y = A & B;
   3'b011: Y = A | B;
   3'b100: Y = A ^ B;
   3'b101: Y = A << B;
   3'b110: Y = A >> B;
   3'b111: Y = (A > B);
   
   default: Y =0;
   endcase
end
endmodule
