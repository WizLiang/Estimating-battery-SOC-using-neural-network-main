`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 19:19:17
// Design Name: 
// Module Name: matrix_multiply_s
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


module matrix_multiply_cl(
    input [7:0] A[0:31][0:1],  // 32x2 matrix
    input [7:0] B[0:1],        // 2x1 matrix
    output reg [7:0] C[0:31]   // 32x1 result matrix
);


// Instantiate multipliers
wire [7:0] products[0:31][0:1];
genvar i,j;
integer k;


generate
    for (j = 0; j < 2; j = j + 1) begin : mult_loop
        for (i = 0; i < 32; i = i + 1) begin
            mux mult(
                .a(A[i][j]),
                .b(B[j]),
                .result(products[i][j])
            );
        end
    end
endgenerate


// Calculate results
always @(*) begin
    for (k = 0; k < 32; k = k + 1) begin
        C[k] = products[k][0] + products[k][1];  // Assuming a simple adder for demonstration
    end
end
endmodule
