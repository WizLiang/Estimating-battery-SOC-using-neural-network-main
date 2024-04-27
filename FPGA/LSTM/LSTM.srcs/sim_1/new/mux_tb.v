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

// 实例化乘法器模块
mux uut (
    .a(a),
    .b(b),
    .result(result)
);

// 初始化和测试输入值
initial begin
    // 初始化
    a = 8'b0;
    b = 8'b0;
    #10;  // 等待10纳秒

    // 测试用例1：0.5 * 0.5 = 0.25
    // 0.5 表示为 01000000，结果应为 00100000
    a = 8'b01000000; // 0.5
    b = 8'b01000000; // 0.5
    #10;
    $display("Test 1: %b * %b = %b", a, b, result); // 显示结果

    // 测试用例2：-0.5 * -0.5 = 0.25
    // -0.5 表示为 11000000，结果应为 00100000
    a = 8'b11000000; // -0.5
    b = 8'b11000000; // -0.5
    #10;
    $display("Test 2: %b * %b = %b", a, b, result);

    // 测试用例3：-0.5 * 0.5 = -0.25
    // -0.5 表示为 11000000，0.5 表示为 01000000，结果应为 11100000
    a = 8'b11000000; // -0.5
    b = 8'b01000000; // 0.5
    #10;
    $display("Test 3: %b * %b = %b", a, b, result);

    // 测试结束
    $finish;
end

endmodule
