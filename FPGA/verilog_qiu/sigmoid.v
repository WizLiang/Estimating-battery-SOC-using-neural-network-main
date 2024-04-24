`timescale 1ns / 1ps

module sigmoid#(
    parameter DATA_WIDTH = 8
)(
    input clk,
    input rst_n,
    input ena,

    // input [DATA_WIDTH-1:0]scale;
    input [2:0]point,
    input [DATA_WIDTH-1:0] act_in,
    output [DATA_WIDTH-1:0] act_out
    );

wire [4:0]raddr;
reg ena_r1;
reg ena_r2;
reg ena_r3;
reg ena_r4;
reg sign_r1;
reg sign_r2;
reg sign_r3;
reg [DATA_WIDTH-1:0] act_in_abs_r;
wire [7:0] k;
wire [7:0] b;
reg [7:0] b_r;
reg [2*DATA_WIDTH-1:0]kx;
reg [2*DATA_WIDTH-1:0]kxb;
reg [2*DATA_WIDTH-1:0] act_out_r;

wire sign = act_in[DATA_WIDTH-1] ? 'b1 :'b0;
wire [DATA_WIDTH-1:0] act_in_abs = (sign) ? {1'b1,~act_in[DATA_WIDTH-2:0] +1'b1} : {1'b0,act_in[DATA_WIDTH-2:0]};

assign raddr =  (act_in_abs[DATA_WIDTH-1:0] >> (point-3)) -1;

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ena_r1 <= 'b0;
        ena_r2 <= 'b0;
        ena_r3 <= 'b0;
        ena_r4 <= 'b0;
        sign_r1 <= 'b0;
        sign_r2 <= 'b0;
        sign_r3 <= 'b0;
    end
    else begin
        ena_r1 <= ena;
        ena_r2 <= ena_r1;
        ena_r3 <= ena_r2;
        ena_r4 <= ena_r3;
        sign_r1 <= sign;
        sign_r2 <= sign_r1;
        sign_r3 <= sign_r2;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        act_in_abs_r <= 'b0;
    end
    else if(ena)begin
         act_in_abs_r <= act_in_abs;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        kx <= 'b0;
    end
    else if(ena_r1)begin
        kx <= act_in_abs_r * k;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        b_r <= 'b0;
    end
    else if(ena_r1)begin
        b_r <= b ;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        kxb <= 'b0;
    end
    else if(ena_r2)begin
        kxb <= (kx>>(1+point)) + b_r;          //k倍 + x倍
    end
end
wire [2*DATA_WIDTH-1:0]kx_t = kx >>1;

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        act_out_r <= 'b0;
    end
    else if(ena_r3)begin
        act_out_r <= (sign_r3) ? 'b1_0000_0000-kxb  :kxb;
    end
end

assign act_out = act_out_r[2+:DATA_WIDTH];

// assign act_out = kxb[2*DATA_WIDTH-1:DATA_WIDTH];

rom64_sigmoid u_rom64_sigmoid (.clk(clk),.rst_n(rst_n),.ren(ena),.raddr(raddr),.datak(k),.datab(b));

endmodule
