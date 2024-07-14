`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/28 21:14:21
// Design Name: 
// Module Name: matrix_vector_multiplication
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

module matrix_vector_multiplication(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire [8191:0] matrix_A,  // 32x32 matrix flattened to 1D array (32*32*8)
    input wire [255:0] vector_B,   // 32x1 vector flattened to 1D array (32*8)
    output reg [511:0] result,     // 32x1 result vector flattened (32*16)
    output reg done
);

reg [255:0] current_row;
wire [15:0] dot_product_result;
//reg [15:0] sum;
reg [5:0] row_index;
reg compute_enable;
reg [1:0] state;
wire vdp_done;
localparam IDLE = 0, COMPUTE = 1, COLLECT = 2, FINISH = 3;

vector_dot_product vdp(
    .clk(clk),
    .rst_n(rst_n),
    .ena(compute_enable),
    .vector_A(current_row),
    .vector_B(vector_B),
    .result(dot_product_result),
    .done(vdp_done)
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        row_index <= 0;
        compute_enable <= 0;
        result[511:0] <= 0;
        state <= IDLE;
        done <= 0;
        current_row[255:0] <= 0;    
    end else begin
        case(state)
            IDLE: begin
                if (ena) begin
                    row_index <= 0;
                    //compute_enable <= 1;
                    state <= COLLECT;
                    done <= 0;
                end
            end
            COMPUTE: begin
                compute_enable <= 0; // Reset to re-enable computation
                if (vdp_done) begin
                    result[row_index*16 +: 16] <= dot_product_result;
                    
                    if (row_index == 31) begin
                        state <= FINISH;
                    end else begin
                        state <= COLLECT;
                        row_index <= row_index + 1;
                    end
                end
            end
            COLLECT: begin
                current_row <= matrix_A[row_index*256 +: 256];
                compute_enable <= 1; // Re-enable computation for next row
                state <= COMPUTE;
            end
            FINISH: begin
                done <= 1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule

