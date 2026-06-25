`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 16:11:42
// Design Name: 
// Module Name: BarrelShifter
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



    module BarrelShifter #(parameter WIDTH = 32) (
    input wire [WIDTH-1:0] data_in,
    input wire [$clog2(WIDTH)-1:0] shift_amt,
    input wire [1:0] shift_type, // 2'b00: LSL, 2'b01: LSR, 2'b10: ASR, 2'b11: ROR
    output reg [WIDTH-1:0] data_out
);

    integer i;
    reg [WIDTH-1:0] rotated_data;

    always @(*) begin
        // Rotate/Shift Stage
        case(shift_type)
            2'b00: rotated_data = data_in << shift_amt; // Logical Shift Left
            2'b01: rotated_data = data_in >> shift_amt; // Logical Shift Right
            2'b10: rotated_data = $signed(data_in) >>> shift_amt; // Arithmetic Shift Right
            2'b11: rotated_data = (data_in >> shift_amt) | (data_in << (WIDTH - shift_amt)); // Rotate Right
            default: rotated_data = data_in;
        endcase
        
        data_out = rotated_data;
    end
endmodule


