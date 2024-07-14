`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/28 15:57:16
// Design Name: 
// Module Name: vector_dot_product
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


module vector_dot_product(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire [255:0] vector_A,  // 1x32 vector flattened to 1D array (32*8)
    input wire [255:0] vector_B,  // 32x1 vector flattened to 1D array (32*8)
    output reg signed [15:0] result,      // 1x1 result (scalar)
    output reg done
);

// Internal signal definitions
wire signed [15:0] products[31:0];
reg signed [15:0] sum;
reg [5:0] index;
reg [1:0] state;
localparam IDLE = 0, COMPUTE = 1, FINISH = 2;

// Generate multipliers for vector dot product
genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : mult_loop
        mux mult(
            .a(vector_A[i*8 +: 8]),
            .b(vector_B[i*8 +: 8]),
            .result(products[i])
        );
    end
endgenerate

// State Machine for controlling vector dot product
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sum <= 0;
        index <= 0;
        state <= IDLE;
        done <= 0;
        result[15:0] <= 0;
    end else begin
        case(state)
            IDLE: begin
                if (ena) begin
                    sum <= 0;
                    index <= 0;
                    state <= COMPUTE;
                end
                done <= 0;
            end
            COMPUTE: begin
                done <= 0;
                if (index < 32) begin
                    sum <= sum + products[index];
                    index <= index + 1;
                end else begin
                    state <= FINISH;
                end
            end
            FINISH: begin
                result <= sum;
                done <= 1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
