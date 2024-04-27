`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 17:27:40
// Design Name: 
// Module Name: mux
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


module mux#(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH -1 :0] a,  // ����a��1.0.7��ʽ
    input [DATA_WIDTH -1:0] b,  // ����b��1.0.7��ʽ
    output reg [DATA_WIDTH -1:0] result  // ��������1.0.7��ʽ
);

wire signed [2*DATA_WIDTH -1:0] mult_raw;  // ��չλ���Դ洢�˷�ԭʼ���

// ִ�г˷�
assign mult_raw = $signed(a) * $signed(b);

// ��ʽ�������ȡ14λС����ǰ7λ���������������ӣ�
always @(mult_raw) begin
    // ��14λС������7λ�������ַ���λ
    result = mult_raw[14:7];  // ������14��7��ѡ���м��8λ
end

endmodule
