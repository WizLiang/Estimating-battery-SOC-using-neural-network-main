`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/03 22:28:45
// Design Name: 
// Module Name: matrix_vector_multiplication_tb
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


module matrix_vector_multiplication_tb;


// Inputs
reg clk;
reg rst_n;
reg ena;
reg [8191:0] matrix_A;
reg [255:0] vector_B;

// Outputs
wire [511:0] result;
wire done;

// Instantiate the Unit Under Test (UUT)
matrix_vector_multiplication uut (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .matrix_A(matrix_A),
    .vector_B(vector_B),
    .result(result),
    .done(done)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = !clk; // Generate a clock with 10 ns period
end

// Initialize inputs and apply test vectors
initial begin
    // Initialize Inputs
    rst_n = 0;
    ena = 0;
    matrix_A = 0;
    vector_B = 0;

    // Wait for global reset
    #100;
    rst_n = 1;

    // Wait for reset to take effect
    #50;

    // Load the matrix and vector
    matrix_A = {1024{8'd8}}; // Just an example, all bits set
    vector_B = {32{8'd8}}; // Just an example, all bits set

    // Enable the matrix multiplication
    #10;
    ena = 1;

    // Monitor when done is asserted
    wait (done == 1);
    #10;

    // Display the result
    $display("Result: %h", result);
    

    // End simulation
    $finish;
end


endmodule

