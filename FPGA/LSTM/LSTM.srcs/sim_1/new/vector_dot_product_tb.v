`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/28 16:15:45
// Design Name: 
// Module Name: vector_dot_product_tb
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

module vector_dot_product_tb;

// Inputs
reg clk;
reg rst_n;
reg ena;
reg [255:0] vector_A;  // 1x32 vector flattened
reg [255:0] vector_B;  // 32x1 vector flattened

// Outputs
wire [15:0] result;     // 1x1 result (scalar)
wire done;

// Instantiate the Unit Under Test (UUT)
vector_dot_product uut (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .vector_A(vector_A),
    .vector_B(vector_B),
    .result(result),
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
    vector_A = 0;
    vector_B = 0;

    // Wait for global reset
    #100;
    rst_n = 1;
    #20;

    // Load data into vector_A and vector_B
    // Example: A is 1x32 vector, B is 32x1 vector
    // For simplicity, assume A and B have the same elements
    vector_A = {32{8'd16}};  // All elements are 1
    vector_B = {32{8'd16}};  // All elements are 1

    // Start the vector dot product
    //#10; // Wait for a moment
    ena = 1;
    #15;
    ena = 0;
    // Wait for done signal
    wait(done == 1);
    #10; // Let's check results after done is asserted

    // Check results
    $display("Output result: %h", result);
//result 0.5  1.1.14  001000000....  h2000
    // Finish test
    

    vector_A = {32{8'd8}};  // All elements are 1
    vector_B = {32{8'd8}};  // All elements are 1
// Start the vector dot product
    #10; // Wait for a moment
    ena = 1;
    #15;
    ena = 0;

    // Wait for done signal
    wait(done == 1);
    #10; // Let's check results after done is asserted
//result 0.125  1.1.14  001000000....  h2000
    

    // Check results
    $display("Output result: %h", result);
    #30;


    vector_A = {32{1'b1,7'd8}};  // All elements are 1
    vector_B = {32{8'd8}};  // All elements are 1
// Start the vector dot product
    #10; // Wait for a moment
    ena = 1;
    #15;
    ena = 0;


    wait(done == 1);
    #10;
    $display("Output result: %h", result);

    $finish;
end

endmodule
