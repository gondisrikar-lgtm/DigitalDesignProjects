`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 16:22:31
// Design Name: 
// Module Name: tb_bcd_up_down_counter
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

module tb_bcd_up_down_counter;

    // Inputs
    reg clk;
    reg reset_n;
    reg up_down;
    reg enable;

    // Outputs
    wire [3:0] q;
    wire tc;

    // Instantiate UUT
    bcd_up_down_counter uut (
        .clk(clk), 
        .reset_n(reset_n), 
        .up_down(up_down), 
        .enable(enable), 
        .q(q), 
        .tc(tc)
    );

    // Clock Generator (50 MHz -> 20ns period)
    always #10 clk = ~clk;

    initial begin
        // Initialize Signals
        clk = 0;
        reset_n = 0;
        up_down = 1;
        enable = 0;

        // Apply Reset
        #30;
        reset_n = 1; // Release reset
        #10;
        enable = 1;  // Enable counting
        
        $display("--- Starting BCD Up/Down Counter Test ---");

        // 1. Test UP Counting (Cycles through 0 to 9 and wraps)
        $display("[UP COUNTING STARTED]");
        repeat (12) begin
            @(posedge clk);
            #1; // Small delay to read stable output post clock edge
            $display("Time=%0t | Up/Down=%b | Count Q=%d | TC=%b", $time, up_down, q, tc);
        end

        // 2. Test Disable Feature
        enable = 0;
        $display("[COUNTING DISABLED]");
        repeat (3) begin
            @(posedge clk);
            #1;
            $display("Time=%0t | Count Frozen Q=%d", $time, q);
        end
        enable = 1; // Re-enable

        // 3. Test DOWN Counting (Cycles through 9 to 0 and wraps)
        up_down = 0; 
        $display("[DOWN COUNTING STARTED]");
        repeat (12) begin
            @(posedge clk);
            #1;
            $display("Time=%0t | Up/Down=%b | Count Q=%d | TC=%b", $time, up_down, q, tc);
        end

        $display("--- Testbench Complete ---");
        $finish;
    end
      
endmodule


