`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 22:52:08
// Design Name: 
// Module Name: matrix_multiply
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


module matrix_multiply(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire [511:0] A_flat,  // 32x2 matrix flattened to 1D array (32*2*8)
    input wire [15:0] B_flat,   // 2x1 vector flattened to 1D array (2*8)
    output reg [255:0] C_flat,  // 32x1 result matrix flattened (32*8)
    output reg done
);

// Internal signal definitions
reg [7:0] A[0:31][0:1];  // Two-dimensional reg array for matrix A
reg [7:0] B[0:1];        // One-dimensional reg array for vector B
wire [7:0] products[0:31][0:1];
reg [5:0] index;
reg [1:0] state;
localparam IDLE = 0, COMPUTE = 1, FINISH = 2;

// Generate multipliers and sum for matrix multiplication
genvar i, j;
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

// Map flattened input to two-dimensional reg array
integer k, l;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (k = 0; k < 32; k = k + 1) begin
            for (l = 0; l < 2; l = l + 1) begin
                A[k][l] <= 0;
            end
        end
        for (l = 0; l < 2; l = l + 1) begin
            B[l] <= 0;
        end
    end
    else if (ena) begin
        for (k = 0; k < 32; k = k + 1) begin
            for (l = 0; l < 2; l = l + 1) begin
                A[k][l] <= A_flat[(k*2+l)*8 +: 8];
            end
        end
        for (l = 0; l < 2; l = l + 1) begin
            B[l] <= B_flat[l*8 +: 8];
        end
    end
end

// State Machine for controlling matrix multiplication
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        index <= 0;
        done <= 0;
    end
    else begin
        case(state)
            IDLE: begin
                if (ena) begin
                    state <= COMPUTE;
                    index <= 0;
                end
                done <= 0;
            end
            COMPUTE: begin
                if (index < 32) begin
                    C_flat[index*8 +: 8] <= products[index][0] + products[index][1];
                    index <= index + 1;
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