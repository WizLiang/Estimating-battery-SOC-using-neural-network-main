`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 23:48:22
// Design Name: 
// Module Name: matrix_mutiply_large
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

module matrix_multiply_large(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire [8191:0] A_flat,  // 32x32 matrix flattened to 1D array (32*32*8)
    input wire [255:0] B_flat,   // 32x1 vector flattened to 1D array (32*8)
    output reg [255:0] C_flat,   // 32x1 result matrix flattened (32*8)
    output reg done
);

// Internal signal definitions
reg [7:0] A[0:31][0:31];  // Two-dimensional reg array for matrix A
reg [7:0] B[0:31];        // One-dimensional reg array for vector B
wire [7:0] products[0:31][0:31];
reg [5:0] row, col;
reg [1:0] state;
localparam IDLE = 0, COMPUTE = 1, FINISH = 2;

// Generate multipliers for each element multiplication
genvar i, j;
generate
    for (i = 0; i < 32; i = i + 1) begin : row_loop
        for (j = 0; j < 32; j = j + 1) begin : col_loop
             mux mult(
                .a(A[i][j]),
                .b(B[j]),
                .result(products[i][j])
            );
        end
    end
endgenerate

// Map flattened input to two-dimensional reg array
integer k, l;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (k = 0; k < 32; k = k + 1) begin
            for (l = 0; l < 32; l = l + 1) begin
                A[k][l] <= 0;
            end
        end
        for (l = 0; l < 32; l = l + 1) begin
            B[l] <= 0;
        end
    end
    else if (ena) begin
        for (k = 0; k < 32; k = k + 1) begin
            for (l = 0; l < 32; l = l + 1) begin
                A[k][l] <= A_flat[(k*32+l)*8 +: 8];
            end
        end
        for (l = 0; l < 32; l = l + 1) begin
            B[l] <= B_flat[l*8 +: 8];
        end
    end
end

// State Machine for controlling matrix multiplication
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        row <= 0;
        done <= 0;
    end
    else begin
        case(state)
            IDLE: begin
                if (ena) begin
                    state <= COMPUTE;
                    row <= 0;
                end
                done <= 0;
            end
            COMPUTE: begin
                if (row < 32) begin
                    C_flat[row*8 +: 8] <= 0;  // Initialize sum
                    for (col = 0; col < 32; col = col + 1) begin
                        C_flat[row*8 +: 8] <= C_flat[row*8 +: 8] + products[row][col];
                    end
                    row <= row + 1;
                end
                else begin
                    state <= FINISH;
                end
            end
            FINISH: begin
                done <= 1;
                if (!ena) begin
                    state <= IDLE;
                end
            end
        endcase
    end
end

endmodule
