`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 22:13:37
// Design Name: 
// Module Name: matrix_mult0
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

module matrix_mult0(
    input clk,
    input rst_n,
    input ena,
    input [7:0] A[0:31][0:1],  // 32x2 matrix
    input [7:0] B[0:1],        // 2x1 matrix
    output reg [7:0] C[0:31],  // 32x1 result matrix
    output reg done
);

// Internal signals
wire [7:0] products[0:31][0:1];
reg [5:0] index;
reg [1:0] state;
localparam IDLE = 0, COMPUTE = 1, FINISH = 2;

genvar i, j;

// Generate multipliers
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
                    C[index] <= products[index][0] + products[index][1];
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

