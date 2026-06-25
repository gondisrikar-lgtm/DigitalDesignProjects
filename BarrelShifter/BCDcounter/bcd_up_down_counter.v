`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 16:20:57
// Design Name: 
// Module Name: bcd_up_down_counter
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


    module bcd_up_down_counter (
    input wire clk,       // Clock signal
    input wire reset_n,   // Asynchronous reset (active low)
    input wire up_down,   // 1: Count Up, 0: Count Down
    input wire enable,    // 1: Enable counting, 0: Freeze count
    output reg [3:0] q,   // 4-bit BCD output (0 to 9)
    output wire tc        // Terminal Count (1 when max/min limits reached)
);

    // Synchronous state progression
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            q <= 4'b0000;
        end else if (enable) begin
            if (up_down) begin
                // Counting Up mode: 0 -> 1 -> ... -> 9 -> 0
                if (q >= 4'd9)
                    q <= 4'b0000;
                else
                    q <= q + 1'b1;
            end else begin
                // Counting Down mode: 9 -> 8 -> ... -> 0 -> 9
                if (q == 4'b0000 || q > 4'd9)
                    q <= 4'd9; // Safeguard forces illegal states back to 9
                else
                    q <= q - 1'b1;
            end
        end
    end

    // Terminal Count Logic: Active high when boundary values are hit
    assign tc = (enable && ((up_down && (q == 4'd9)) || (!up_down && (q == 4'b0000))));

endmodule


