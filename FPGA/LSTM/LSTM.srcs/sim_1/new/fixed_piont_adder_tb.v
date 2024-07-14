`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/04 16:09:04
// Design Name: 
// Module Name: fixed_piont_adder_tb
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


module fixed_point_adder_tb(

    );

        reg clk;
    reg rst_n;
    reg ena;
    reg signed [7:0] num1_0_7;
    reg signed [15:0] num1_1_14;

    // Outputs
    wire signed [15:0] sum;
    wire done;

    // ʵ����������ģ��
    fixed_point_adder uut (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .num1_0_7(num1_0_7),
        .num1_1_14(num1_1_14),
        .sum(sum),
        .done(done)
    );

    // ʱ������
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // ����һ������Ϊ 10ns ��ʱ���ź�
    end

    // ��������
    initial begin
        // ��ʼ������
        rst_n = 0;
        ena = 0;
        num1_0_7 = 0;
        num1_1_14 = 0;
        
        // ��λϵͳ
        #10;
        rst_n = 1;
        
        // �������� 1
        #10;
        num1_0_7 = 8'b00100000; // 1.0.7 format (+0.025)
        num1_1_14 = 16'b0010000000000000; // 1.1.14 format (+0.5000)
        ena = 1;

        #10;
        ena = 0; // ȷ��ģ��ִֻ��һ�μӷ�����
        
        // �ȴ�����ź�
        wait(done == 1);
        #10;
        
        // �������� 2
        num1_0_7 = 8'b11100000; // 1.0.7 format (-0.25)
        num1_1_14 = 16'b1111000000000000; // 1.1.14 format (-0.25)
        ena = 1;

        #10;
        ena = 0;

        // �ȴ�����ź�
        wait(done == 1);
        #10;
        // �������� 3
        num1_0_7 = 8'b11100000; // 1.0.7 format (-0.25)
        num1_1_14 = 16'b0001000000000000; // 1.1.14 format (0.25)
        ena = 1;
        #10;
        ena = 0;

        // �ȴ�����ź�
        wait(done == 1);


        // ��������
        $finish;
    end


endmodule
