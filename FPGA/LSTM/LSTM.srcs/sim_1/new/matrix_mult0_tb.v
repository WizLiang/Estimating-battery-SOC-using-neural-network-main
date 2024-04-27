`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 22:38:31
// Design Name: 
// Module Name: matrix_mult0_tb
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


module matrix_mult0_tb;

reg clk;
reg rst_n;
reg ena;
reg [7:0] A[0:31][0:1];
reg [7:0] B[0:1];
wire [7:0] C[0:31];
wire done;

// 实例化 matrix_mult0 模块
matrix_mult0 uut (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .A(A),
    .B(B),
    .C(C),
    .done(done)
);

// 时钟生成
always #5 clk = ~clk; // 生成 100 MHz 时钟


// 初始化 A 和 B 矩阵
task initialize_matrices;
    integer i, j;
    begin
        for (i = 0; i < 32; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                A[i][j] = $random % 256; // 随机赋值
            end
        end
        for (i = 0; i < 2; i = i + 1) begin
            B[i] = $random % 256; // 随机赋值
        end
    end
endtask

reg [7:0] expected_C[0:31];

task calculate_expected_result;
    integer i, j;
    begin
        for (i = 0; i < 32; i = i + 1) begin
            expected_C[i] = 0;
            for (j = 0; j < 2; j = j + 1) begin
                expected_C[i] = expected_C[i] + A[i][j] * B[j];
            end
        end
    end
endtask

// 比较输出结果
task check_results;
    integer i;
    reg [7:0] error_margin = 0; // 根据需要设置误差范围
    for (i = 0; i < 32; i = i + 1) begin
        if (C[i] < (expected_C[i] - error_margin) || C[i] > (expected_C[i] + error_margin)) begin
            $display("Mismatch at C[%0d]: Expected %0d, Got %0d", i, expected_C[i], C[i]);
        end
        else begin
                $display("C[%0d] = %0d matches expected result.", i, C[i]);            
        end
    end
endtask

// 检查 C 矩阵结果
// task check_results;
//     integer i;
//     begin
//         for (i = 0; i < 32; i = i + 1) begin
//             $display("C[%0d] = %0d", i, C[i]);
//         end
//     end
// endtask


// 测试逻辑中调用这些任务
initial begin
    initialize_matrices();
    calculate_expected_result();
    #10;
    rst_n = 1;
    #10;
    rst_n = 0;
    #20;
    rst_n = 1;
    #20;

    ena = 1;
    #10;
    ena = 0;
    
    wait (done == 1);
    #10;

    check_results();
    $finish;
end


endmodule

