`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 23:10:09
// Design Name: 
// Module Name: matrix_multiply_tb
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


`timescale 1ns / 1ps

module matrix_multiply_tb;

// Inputs
reg clk;
reg rst_n;
reg ena;
reg [511:0] A_flat;   // 32x2 matrix flattened
reg [15:0] B_flat;    // 2x1 vector flattened

// Outputs
wire [255:0] C_flat;  // 32x1 result matrix flattened
wire done;

// Instantiate the Unit Under Test (UUT)
matrix_multiply uut (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .A_flat(A_flat),
    .B_flat(B_flat),
    .C_flat(C_flat),
    .done(done)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz clock
end

// Stimulus here
initial begin
    // Initialize Inputs
    rst_n = 0;
    ena = 0;
    A_flat = 0;
    B_flat = 0;

    // Wait for global reset
    #100;
    rst_n = 1;
    #20;

    // Load data into A and B
    // Example: A is 32x2 matrix, B is 2x1 vector
    // A matrix example: 2 rows of [1, 2; 3, 4] for simplicity repeated
    // B vector example: [1; 2]
    A_flat = {16{8'd64, 8'd64,8'd32, 8'd32}};
    B_flat = {8'd64, 8'd64};

    // Start the matrix multiplication
    #10; // Wait for a moment
    ena = 1;

    // Wait for done signal
    wait(done == 1);
    #10; // Let's check results after done is asserted

    // Check results
    $display("Output C_flat: %h", C_flat);

    // Finish test
    #30;
    $finish;
end

endmodule

