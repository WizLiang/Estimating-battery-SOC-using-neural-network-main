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
    input wire [255:0] nums1_0_7, // 32��1.0.7��ʽ����
    input wire [511:0] nums1_1_14, // 32��1.1.14��ʽ����
    output reg [511:0] sums, // 32��1.1.14��ʽ�������
    output reg done
);
    // �м����������չ
    reg signed [15:0] extended_nums1_0_7[0:31]; // ��չ�����ֵ����
    reg signed [15:0] local_sums[31:0];

    integer i;

    // ״̬��
    localparam IDLE = 0,
               COMPUTE = 1,
               FINISH = 2;
    reg [1:0] state = IDLE;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // ��λ����������ڲ�״̬
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
                        // ��ʼ���㣬��չ����
                        for (i = 0; i < 32; i = i + 1) begin
                        extended_nums1_0_7[i] <= {nums1_0_7[i*8+7], 1'b0, nums1_0_7[i*8+6:0], 7'b0};
                        end
                        state <= COMPUTE;
                    end
                end
                COMPUTE: begin
                    // ִ�мӷ�
                    for (i = 0; i < 32; i = i + 1) begin
                        //extended_num1_0_7[i] <= {num1_0_7[i*8+7], 1'b0, num1_0_7[i*8+6:0], 7'b0};
                        local_sums[i] <= extended_nums1_0_7[i] + nums1_1_14[i*16 +: 16];
                    end
                    //sum <= extended_num1_0_7 + num1_1_14;
                    state <= FINISH;
                end
                FINISH: begin
                    // ������ɱ�־������ IDLE ״̬
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


