`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 16:14:13
// Design Name: 
// Module Name: BarrelShifter_tb
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


module BarrelShifter_tb;


    // Parameters
    parameter WIDTH = 32;

    // Inputs
    reg [WIDTH-1:0] data_in;
    reg [$clog2(WIDTH)-1:0] shift_amt;
    reg [1:0] shift_type;

    // Outputs
    wire [WIDTH-1:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    BarrelShifter #(.WIDTH(WIDTH)) uut (
        .data_in(data_in), 
        .shift_amt(shift_amt), 
        .shift_type(shift_type), 
        .data_out(data_out)
    );

    initial begin
        // Initialize Inputs
        data_in = 32'h0000_0000;
        shift_amt = 0;
        shift_type = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        $display("--- Starting Barrel Shifter Testbench ---");

        // 1. Test Logical Shift Left (LSL) - Mode 2'b00
        shift_type = 2'b00;
        data_in = 32'h0000_000F; // Lower 4 bits set
        shift_amt = 4;
        #10;
        $display("LSL: Input=0x%h, Amt=%d, Output=0x%h (Expected: 0x000000f0)", data_in, shift_amt, data_out);
        
        shift_amt = 16;
        #10;
        $display("LSL: Input=0x%h, Amt=%d, Output=0x%h (Expected: 0x000f0000)", data_in, shift_amt, data_out);

        // 2. Test Logical Shift Right (LSR) - Mode 2'b01
        shift_type = 2'b01;
        data_in = 32'hF000_0000; // Upper 4 bits set
        shift_amt = 4;
        #10;
        $display("LSR: Input=0x%h, Amt=%d, Output=0x%h (Expected: 0x0f000000)", data_in, shift_amt, data_out);
        
        shift_amt = 28;
        #10;
        $display("LSR: Input=0x%h, Amt=%d, Output=0x%h (Expected: 0x0000000f)", data_in, shift_amt, data_out);

        // 3. Test Arithmetic Shift Right (ASR) - Mode 2'b10
        shift_type = 2'b10;
        data_in = 32'h8000_0000; // MSB is 1 (Negative number)
        shift_amt = 4;
        #10;
        $display("ASR (Sign-Ext): Input=0x%h, Amt=%d, Output=0x%h (Expected: 0xf8000000)", data_in, shift_amt, data_out);
        
        data_in = 32'h7000_0000; // MSB is 0 (Positive number)
        shift_amt = 4;
        #10;
        $display("ASR (Zero-Ext): Input=0x%h, Amt=%d, Output=0x%h (Expected: 0x07000000)", data_in, shift_amt, data_out);

        // 4. Test Rotate Right (ROR) - Mode 2'b11
        shift_type = 2'b11;
        data_in = 32'h0000_000F; // F at the bottom
        shift_amt = 4;
        #10;
        $display("ROR: Input=0x%h, Amt=%d, Output=0x%h (Expected: 0xf0000000)", data_in, shift_amt, data_out);
        
        data_in = 32'hA000_000B; 
        shift_amt = 16;
        #10;
        $display("ROR: Input=0x%h, Amt=%d, Output=0x%h (Expected: 0x000ba000)", data_in, shift_amt, data_out);

        $display("--- Testbench Complete ---");
        $finish;
    end
      
endmodule


