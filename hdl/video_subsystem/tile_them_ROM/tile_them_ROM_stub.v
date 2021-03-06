// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (win64) Build 1034051 Fri Oct  3 17:14:12 MDT 2014
// Date        : Sun Dec 07 20:25:57 2014
// Host        : IPA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/pwl/Git
//               Repos/540/final_proj/hdl/video_subsystem/tile_them_ROM/tile_them_ROM_stub.v}
// Design      : tile_them_ROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.3" *)
module tile_them_ROM(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[9:0],douta[11:0]" */;
  input clka;
  input [9:0]addra;
  output [11:0]douta;
endmodule
