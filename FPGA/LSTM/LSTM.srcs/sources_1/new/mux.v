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
    input [DATA_WIDTH -1 :0] a,  // 输入a，1.0.7格式
    input [DATA_WIDTH -1:0] b,  // 输入b，1.0.7格式
    output reg [DATA_WIDTH -1:0] result  // 输出结果，1.0.7格式
);

wire signed [2*DATA_WIDTH -1:0] mult_raw;  // 扩展位宽以存储乘法原始结果

// 执行乘法
assign mult_raw = $signed(a) * $signed(b);

// 格式化结果：取14位小数的前7位（舍入可在这里添加）
always @(mult_raw) begin
    // 将14位小数右移7位，并保持符号位
    result = mult_raw[14:7];  // 从索引14到7，选择中间的8位
end

endmodule
