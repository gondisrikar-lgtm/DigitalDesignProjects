`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 17:00:53
// Design Name: 
// Module Name: TrafficLight_FSM
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


module TrafficLight_FSM(
    input clk,
    input rst,
    output reg [2:0] roadA,
    output reg [2:0] roadB
);

reg [1:0] state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= S0;
    else
    begin
        case(state)
            S0: state <= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S0;
        endcase
    end
end

always @(*)
begin
    case(state)

        S0:
        begin
            roadA = 3'b001;
            roadB = 3'b100;
        end

        S1:
        begin
            roadA = 3'b010;
            roadB = 3'b100;
        end

        S2:
        begin
            roadA = 3'b100;
            roadB = 3'b001;
        end

        S3:
        begin
            roadA = 3'b100;
            roadB = 3'b010;
        end

    endcase
end

endmodule
