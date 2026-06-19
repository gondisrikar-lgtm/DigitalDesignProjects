`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 17:02:19
// Design Name: 
// Module Name: TrafficLight_FSM_tb
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


module TrafficLight_FSM_tb;

reg clk;
reg rst;

wire [2:0] roadA;
wire [2:0] roadB;

TrafficLight_FSM uut(
    .clk(clk),
    .rst(rst),
    .roadA(roadA),
    .roadB(roadB)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #100;

    $finish;
end

endmodule
