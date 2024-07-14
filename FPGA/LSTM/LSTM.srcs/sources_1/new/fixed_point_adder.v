`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/04 10:50:54
// Design Name: 
// Module Name: fixed_point_adder
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

module fixed_point_adder(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire signed [7:0] num1_0_7, // 1.0.7 格式输入
    input wire signed [15:0] num1_1_14, // 1.1.14 格式输入
    output reg signed [15:0] sum, // 1.1.14 格式输出
    output reg done
);
    // 中间变量用于扩展
    reg signed [15:0] extended_num1_0_7;

    // 状态机
    localparam IDLE = 0,
               COMPUTE = 1,
               FINISH = 2;
    reg [1:0] state = IDLE;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // 复位所有输出和内部状态
            sum <= 0;
            extended_num1_0_7 <= 0;
            state <= IDLE;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (ena) begin
                        // 开始计算，扩展数字
                        extended_num1_0_7 <= {{2{num1_0_7[7]}}, num1_0_7[6:0], 7'b0};
                        state <= COMPUTE;
                    end
                end
                COMPUTE: begin
                    // 执行加法
                    sum <= extended_num1_0_7 + num1_1_14;
                    state <= FINISH;
                end
                FINISH: begin
                    // 设置完成标志，返回 IDLE 状态
                    done <= 1;
                    state <= IDLE;
                end
                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule



