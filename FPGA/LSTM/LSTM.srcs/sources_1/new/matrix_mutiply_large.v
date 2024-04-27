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

module matrix_multiply_large(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire [8191:0] A_flat,  // 32x32 matrix flattened to 1D array (32*32*8)
    input wire [255:0] B_flat,   // 32x1 vector flattened to 1D array (32*8)
    output reg [255:0] C_flat,   // 32x1 result matrix flattened (32*8)
    output reg done
);

// Parameters for indexing
localparam WIDTH = 8;
localparam A_WIDTH = 32 * WIDTH;
localparam B_WIDTH = WIDTH;
localparam TOTAL_ELEMENTS_A = 32 * 32;
localparam TOTAL_ELEMENTS_B = 32;

// Internal register arrays
reg [7:0] A[0:31][0:31];
reg [7:0] B[0:31];
wire [7:0] products[0:31][0:31];
reg [15:0] sum[0:31];

// Control signals
reg [5:0] i, j;
reg [1:0] state;
localparam IDLE = 0, COMPUTE = 1, FINISH = 2;

// Generate multipliers for each row of matrix A and vector B
genvar row, col;
generate
    for (row = 0; row < 32; row = row + 1) begin : row_mult
        for (col = 0; col < 32; col = col + 1) begin : col_mult
            mux mult(
                .a(A[row][col]),
                .b(B[col]),
                .result(products[row][col])
            );
        end
    end
endgenerate

// Map flattened input to two-dimensional reg array and one-dimensional reg array
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 32; i = i + 1) begin
            for (j = 0; j < 32; j = j + 1) begin
                A[i][j] <= 0;
        end
        for (i = 0; i < 32; i = i + 1) begin
            B[i] <= 0;
        end
        end
    end
    else if (ena) begin
        for (i = 0; i < 32; i = i + 1) begin
            for (j = 0; j < 32; j = j + 1) begin
                A[i][j] <= A_flat[(i * 32 + j) * WIDTH +: WIDTH];
        end
        for (i = 0; i < 32; i = i + 1) begin
            B[i] <= B_flat[i * WIDTH +: WIDTH];
        end
        end
    end
end    

// State Machine for controlling matrix multiplication
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        done <= 0;
    end
    else begin
        case(state)
            IDLE: begin
                if (ena) begin
                    state <= COMPUTE;
                    i <= 0;
                end
                done <= 0;
            end
            COMPUTE: begin
                if (i < 32) begin
                    sum[i] = 0; // Reset sum for current row
                    for (j = 0; j < 32; j = j + 1) begin
                        sum[i] = sum[i] + products[i][j];
                    end
                    C_flat[i*WIDTH +: WIDTH] = sum[i][7:0]; // Assuming sum fits within 8 bits
                    i = i + 1;
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
