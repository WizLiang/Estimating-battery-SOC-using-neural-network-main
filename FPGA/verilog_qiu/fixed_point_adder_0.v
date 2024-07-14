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
    input wire [255:0] nums1_0_7, // 32个1.0.7格式的数
    input wire [511:0] nums1_1_14, // 32个1.1.14格式的数
    output reg [511:0] sums, // 32个1.1.14格式的输出和
    output reg done
);
    // 中间变量用于扩展
    reg signed [15:0] extended_nums1_0_7[0:31]; // 扩展后的数值数组
    reg signed [15:0] local_sums[31:0];

    integer i;

    // 状态机
    localparam IDLE = 0,
               COMPUTE = 1,
               FINISH = 2;
    reg [1:0] state = IDLE;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // 复位所有输出和内部状态
            sums <= 0;
            for (i = 0; i < 32; i = i + 1) begin
            extended_nums1_0_7[i] <= 0;
            local_sums[i] <= 0;
            end
            
            state <= IDLE;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (ena) begin
                        // 开始计算，扩展数字
                        for (i = 0; i < 32; i = i + 1) begin
                        extended_nums1_0_7[i] <= {nums1_0_7[i*8+7], 1'b0, nums1_0_7[i*8+6:0], 7'b0};
                        end
                        state <= COMPUTE;
                    end
                end
                COMPUTE: begin
                    // 执行加法
                    for (i = 0; i < 32; i = i + 1) begin
                        //extended_num1_0_7[i] <= {num1_0_7[i*8+7], 1'b0, num1_0_7[i*8+6:0], 7'b0};
                        local_sums[i] <= extended_nums1_0_7[i] + nums1_1_14[i*16 +: 16];
                    end
                    //sum <= extended_num1_0_7 + num1_1_14;
                    state <= FINISH;
                end
                FINISH: begin
                    // 设置完成标志，返回 IDLE 状态
                    for (i = 0; i < 32; i = i + 1) begin
                        sums[i*16 +: 16] <= local_sums[i];
                    end
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


