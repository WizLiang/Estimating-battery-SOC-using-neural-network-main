// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Apr 27 14:10:16 2024
// Host        : LAPTOP-LSMAA7TB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Desktop/Estimating-battery-SOC-using-neural-network-main/FPGA/LSTM/LSTM.srcs/sources_1/ip/lstm_weight_ih_l1/lstm_weight_ih_l1_stub.v
// Design      : lstm_weight_ih_l1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module lstm_weight_ih_l1(clka, rsta, ena, addra, douta, rsta_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,ena,addra[6:0],douta[255:0],rsta_busy" */;
  input clka;
  input rsta;
  input ena;
  input [6:0]addra;
  output [255:0]douta;
  output rsta_busy;
endmodule
