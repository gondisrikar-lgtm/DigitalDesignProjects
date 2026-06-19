`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 16:21:28
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(

    );

    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] OP;

    wire [7:0] Y;

    // Instantiate ALU
    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .Y(Y)
    );

    initial begin

        // Test values
        A = 8'd10;
        B = 8'd5;

        // Addition
        OP = 3'b000;
        #10;

        // Subtraction
        OP = 3'b001;
        #10;

        // AND
        OP = 3'b010;
        #10;

        // OR
        OP = 3'b011;
        #10;

        // XOR
        OP = 3'b100;
        #10;

        // Left Shift
        OP = 3'b101;
        #10;

        // Right Shift
        OP = 3'b110;
        #10;

        // Comparison
        OP = 3'b111;
        #10;

        $finish;

    end
endmodule
