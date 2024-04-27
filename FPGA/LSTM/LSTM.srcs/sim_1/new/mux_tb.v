`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 17:37:25
// Design Name: 
// Module Name: mux_tb
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

module mux_tb(

    );
reg [7:0] a;
reg [7:0] b;
wire [7:0] result;

// ʵ�����˷���ģ��
mux uut (
    .a(a),
    .b(b),
    .result(result)
);

// ��ʼ���Ͳ�������ֵ
initial begin
    // ��ʼ��
    a = 8'b0;
    b = 8'b0;
    #10;  // �ȴ�10����

    // ��������1��0.5 * 0.5 = 0.25
    // 0.5 ��ʾΪ 01000000�����ӦΪ 00100000
    a = 8'b01000000; // 0.5
    b = 8'b01000000; // 0.5
    #10;
    $display("Test 1: %b * %b = %b", a, b, result); // ��ʾ���

    // ��������2��-0.5 * -0.5 = 0.25
    // -0.5 ��ʾΪ 11000000�����ӦΪ 00100000
    a = 8'b11000000; // -0.5
    b = 8'b11000000; // -0.5
    #10;
    $display("Test 2: %b * %b = %b", a, b, result);

    // ��������3��-0.5 * 0.5 = -0.25
    // -0.5 ��ʾΪ 11000000��0.5 ��ʾΪ 01000000�����ӦΪ 11100000
    a = 8'b11000000; // -0.5
    b = 8'b01000000; // 0.5
    #10;
    $display("Test 3: %b * %b = %b", a, b, result);

    // ���Խ���
    $finish;
end

endmodule
