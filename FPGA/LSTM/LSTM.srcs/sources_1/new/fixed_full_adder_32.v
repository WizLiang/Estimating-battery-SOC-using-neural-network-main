`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/04 17:26:48
// Design Name: 
// Module Name: fixed_full_adder_32
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


module fixed_full_adder_32(
    input wire clk,
    input wire rst_n,
    input wire ena,
    input wire [255:0] num1_0_7_flat, // 32��1.0.7��ʽ����, չƽΪ256λ
    input wire [511:0] num1_1_14_flat, // 32��1.1.14��ʽ����, չƽΪ512λ
    output wire [511:0] sum_flat, // 32��1.1.14��ʽ���, չƽΪ512λ
    output wire done
    );

wire [31:0] add_done;    

genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : adder_block
            fixed_point_adder single_adder(
                .clk(clk),
                .rst_n(rst_n),
                .ena(ena),
                .num1_0_7(num1_0_7_flat[i*8 +: 8]),
                .num1_1_14(num1_1_14_flat[i*16 +: 16]),
                .sum(sum_flat[i*16 +: 16]),
                .done(add_done[i])
            );
            // ֱ�ӽ����������ӵ����
        end
    endgenerate
assign done = &add_done;


endmodule
