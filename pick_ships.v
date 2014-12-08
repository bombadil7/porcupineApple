//
///////////////////////////////////////////////////////////////////////////////////////////
// Copyright � 2010-2013, Xilinx, Inc.
// This file contains confidential and proprietary information of Xilinx, Inc. and is
// protected under U.S. and international copyright and other intellectual property laws.
///////////////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer:
// This disclaimer is not a license and does not grant any rights to the materials
// distributed herewith. Except as otherwise provided in a valid license issued to
// you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
// MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
// DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
// INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
// OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
// (whether in contract or tort, including negligence, or under any other theory
// of liability) for any loss or damage of any kind or nature related to, arising
// under or in connection with these materials, including for any direct, or any
// indirect, special, incidental, or consequential loss or damage (including loss
// of data, profits, goodwill, or any type of loss or damage suffered as a result
// of any action brought by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-safe, or for use in any
// application requiring fail-safe performance, such as life-support or safety
// devices or systems, Class III medical devices, nuclear facilities, applications
// related to the deployment of airbags, or any other applications that could lead
// to death, personal injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). Customer assumes the
// sole risk and liability of any use of Xilinx products in Critical Applications,
// subject only to applicable laws and regulations governing limitations on product
// liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
///////////////////////////////////////////////////////////////////////////////////////////
//
//
// Production definition of a 2K program for KCPSM6 in a 7-Series device using a 
// RAMB36E1 primitive.
//
// Note: The complete 12-bit address bus is connected to KCPSM6 to facilitate future code 
//       expansion with minimum changes being required to the hardware description. 
//       Only the lower 11-bits of the address are actually used for the 2K address range
//       000 to 7FF hex.  
//
// Program defined by 'C:\Users\Jordan\Documents\GitHub\porcupineApple\pick_ships.psm'.
//
// Generated by KCPSM6 Assembler: 08 Dec 2014 - 11:32:02. 
//
// Assembler used ROM_form template: ROM_form_7S_2K_14March13.v
//
//
module pick_ships (
input  [11:0] address,
output [17:0] instruction,
input         enable,
input         clk);
//
//
wire [15:0] address_a;
wire [35:0] data_in_a;
wire [35:0] data_out_a;
wire [15:0] address_b;
wire [35:0] data_in_b;
wire [35:0] data_out_b;
wire        enable_b;
wire        clk_b;
wire [7:0]  we_b;
//
//
assign address_a = {1'b1, address[10:0], 4'b1111};
assign instruction = {data_out_a[33:32],  data_out_a[15:0]};
assign data_in_a = {35'b000000000000000000000000000000000000, address[11]};
//
assign address_b = 16'b1111111111111111;
assign data_in_b = {2'h0,  data_out_b[33:32], 16'h0000, data_out_b[15:0]};
assign enable_b = 1'b0;
assign we_b = 8'h00;
assign clk_b = 1'b0;
//
RAMB36E1 # ( .READ_WIDTH_A              (18),
             .WRITE_WIDTH_A             (18),
             .DOA_REG                   (0),
             .INIT_A                    (36'h000000000),
             .RSTREG_PRIORITY_A         ("REGCE"),
             .SRVAL_A                   (36'h000000000),
             .WRITE_MODE_A              ("WRITE_FIRST"),
             .READ_WIDTH_B              (18),
             .WRITE_WIDTH_B             (18),
             .DOB_REG                   (0),
             .INIT_B                    (36'h000000000),
             .RSTREG_PRIORITY_B         ("REGCE"),
             .SRVAL_B                   (36'h000000000),
             .WRITE_MODE_B              ("WRITE_FIRST"),
             .INIT_FILE                 ("NONE"),
             .SIM_COLLISION_CHECK       ("ALL"),
             .RAM_MODE                  ("TDP"),
             .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
             .EN_ECC_READ               ("FALSE"),
             .EN_ECC_WRITE              ("FALSE"),
             .RAM_EXTENSION_A           ("NONE"),
             .RAM_EXTENSION_B           ("NONE"),
             .SIM_DEVICE                ("7SERIES"),
             .INIT_00                   (256'h1F44F0381000F1371100F13411001100F1201100007E00472004200420042004),
             .INIT_01                   (256'h00F00700300F00F0022500B52017D600B620800102F3110302EF02121D551E02),
             .INIT_02                   (256'h017012002017F6209601B62002BA02D101F0002E0800400E400E400E400E30F0),
             .INIT_03                   (256'h02E2B132120502E2B133120402D901A0120302D90190120202D90180120102D9),
             .INIT_04                   (256'hE10011031001E10011021001E10011001000500002E2B130120702E2B1311206),
             .INIT_05                   (256'h1001E10011201001E10011231001E10011221001E10011201001E10011001001),
             .INIT_06                   (256'h11021001E10011001001E10011301001E10011331001E10011321001E1001130),
             .INIT_07                   (256'h111810105000A1200210310F010012005000E10011001001E10011031001E100),
             .INIT_08                   (256'hE10011171001E100110F1001E10011171001E10011171001E10011171001E100),
             .INIT_09                   (256'h1001E10011171001E10011171001E100110B1001E10011171001E10011171001),
             .INIT_0A                   (256'h12105000E100111C1001E100111A1001E100111B1001E10011191001E1001117),
             .INIT_0B                   (256'h2111D00320F8D00220C8D00120C1D000B034F03710005000A1200210310F0100),
             .INIT_0C                   (256'hD00120DAD004301F00C0220430F000D05000F03410002181D080308000C0217A),
             .INIT_0D                   (256'h21819F012181D000300F00F05000F034100120F2D01020ECD00220E6D00820E0),
             .INIT_0E                   (256'h2181D09030F000F021819F102181D00030F000F021811F012181D009300F00F0),
             .INIT_0F                   (256'h2109D0082107D0012105D004301F00C05000F03410012186D00100B021811F10),
             .INIT_10                   (256'h2201D00100B021861E0221861E0821861E0421861E012186210DD010210BD002),
             .INIT_11                   (256'h9101D00B00F0D0181003215A2145D0042130D002211BD00100E0310F01D02181),
             .INIT_12                   (256'h216FD00B9001216F9101D00B9001216F9101D00B9001216F9101D00B9001216F),
             .INIT_13                   (256'hD00B1010216F9101D00B1010216F9101D00B1010216F9101D00B00F0D0181003),
             .INIT_14                   (256'h1001216F9101D00B1001216F9101D00B00F0D0181003216FD00B1010216F9101),
             .INIT_15                   (256'h216F9101D00B00F0D0181003216FD00B1001216F9101D00B1001216F9101D00B),
             .INIT_16                   (256'h9D10216FD00B9010216F9101D00B9010216F9101D00B9010216F9101D00B9010),
             .INIT_17                   (256'h02D511FFF0381001D00D100150001E021F44F03410019D012175D02030F000D0),
             .INIT_18                   (256'hD00421A9D0022192D00100E0310F01D0F03410025000F0341001D10A01F05000),
             .INIT_19                   (256'hD01B900122009101D01A900122009101D00A00F0A1FE8010300F00F021E321C8),
             .INIT_1A                   (256'h0010400E400E400E400E30F000F02200D01D900122009101D01C900122009101),
             .INIT_1B                   (256'h9101D01B101022009101D01A101022009101D00A00F0310F01D0A1FEC1001190),
             .INIT_1C                   (256'h310F01D0A1FEC10011090010300F00F02200D01D101022009101D01C10102200),
             .INIT_1D                   (256'h22009101D01C100122009101D01B100122009101D01A100122009101D00A00F0),
             .INIT_1E                   (256'h901022009101D00A00F0A1FE8010400E400E400E400E30F000F02200D01D1001),
             .INIT_1F                   (256'hF03710FF2200D01D901022009101D01C901022009101D01B901022009101D01A),
             .INIT_20                   (256'h300F00F00800400640064006400630F000F05000F03410045000F03410035000),
             .INIT_21                   (256'hF02410025000D0121080F0231002F0241001621E2217D001D012100150000700),
             .INIT_22                   (256'h226BD0012239D002D012B023D01210AA62B8D001B0385000D01210E0F0231003),
             .INIT_23                   (256'h2250D0012247D004D004301F00C022B822A7D00522A1D0042294D0062276D003),
             .INIT_24                   (256'h5000F023D01210029F0122B8D000300F00F022B8226BD0102262D0022259D008),
             .INIT_25                   (256'hD01210029F1022B8D00030F000F05000F023D01210021F0122B8D009300F00F0),
             .INIT_26                   (256'h22B8D101911FD00B00F05000F023D01210021F1022B8D09030F000F05000F023),
             .INIT_27                   (256'h2283D003901FD10B010090196276D040304090095000F023D0121006D01EF025),
             .INIT_28                   (256'hD01E22B9D01E10FF228F1001228F1002228CD011F0261001B02622B8228AD000),
             .INIT_29                   (256'hF0231004D10BD018B12522B9D0FF90196294D040304090095000F023D0121005),
             .INIT_2A                   (256'h22B822B462B0D0FF901962A7D040304090095000F023D0121003D01E10FF5000),
             .INIT_2B                   (256'hB037500022BF22BED000B03422B950005000F023D01210025000F023D0121005),
             .INIT_2C                   (256'h30FF9011500030FF90015000301F90005000D00F00D0D00E00E0D00A00F0D008),
             .INIT_2D                   (256'h331F0310802010069000C02010035000D01230FF00105000D00230FF00105000),
             .INIT_2E                   (256'h00105000C300331F0310802010041016D000C02010039000C02010075000C300),
             .INIT_2F                   (256'h0000000000000000000000000000000022F75000D017300F00105000D007300F),
             .INIT_30                   (256'hB621F627D6077601B627F62016014C0002C89C099B0C630BD6FFB620F522F621),
             .INIT_31                   (256'h000000000000000000000000000000000000000000000000000000009001B522),
             .INIT_32                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_33                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_34                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_35                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_36                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_37                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_38                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_39                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_3A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_3B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_3C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_3D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_3E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_3F                   (256'h2300000000000000000000000000000000000000000000000000000000000000),
             .INIT_40                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_41                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_42                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_43                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_44                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_45                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_46                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_47                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_48                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_49                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_4A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_4B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_4C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_4D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_4E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_4F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_50                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_51                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_52                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_53                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_54                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_55                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_56                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_57                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_58                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_59                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_5A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_5B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_5C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_5D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_5E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_5F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_60                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_61                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_62                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_63                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_64                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_65                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_66                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_67                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_68                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_69                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_6A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_6B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_6C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_6D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_6E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_6F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_70                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_71                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_72                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_73                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_74                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_75                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_76                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_77                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_78                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_79                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_7A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_7B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_7C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_7D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_7E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INIT_7F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_00                  (256'h0840A186186186186186186186182820820820820A4A215400AD28A022208AAA),
             .INITP_01                  (256'hDDD0A349D09D09D09D0A37777430A342DDDD2210286186186186186186186186),
             .INITP_02                  (256'h888821D069D9D9D9D88A76767676229D9D9D9D88A7676767622DDD02D22222DD),
             .INITP_03                  (256'h8A76767676355429D9D9D9D80D10A7676767603455429D9D9D9D8D0B77408A22),
             .INITP_04                  (256'hD20D0A8AD22A1D0A8742A1D0A8742DDDDD42DDDDDD88D2888A223D88015428A2),
             .INITP_05                  (256'h0000A8282814D34A04D282820820A2222B4AA8A8BD342A228A34D0A8A888D92D),
             .INITP_06                  (256'h000000000000000000000000000000000000000000000000000000082824830A),
             .INITP_07                  (256'h8000000000000000000000000000000000000000000000000000000000000000),
             .INITP_08                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_09                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_0A                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_0B                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_0C                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_0D                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_0E                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
             .INITP_0F                  (256'h0000000000000000000000000000000000000000000000000000000000000000))
 kcpsm6_rom( .ADDRARDADDR               (address_a),
             .ENARDEN                   (enable),
             .CLKARDCLK                 (clk),
             .DOADO                     (data_out_a[31:0]),
             .DOPADOP                   (data_out_a[35:32]), 
             .DIADI                     (data_in_a[31:0]),
             .DIPADIP                   (data_in_a[35:32]), 
             .WEA                       (4'h0),
             .REGCEAREGCE               (1'b0),
             .RSTRAMARSTRAM             (1'b0),
             .RSTREGARSTREG             (1'b0),
             .ADDRBWRADDR               (address_b),
             .ENBWREN                   (enable_b),
             .CLKBWRCLK                 (clk_b),
             .DOBDO                     (data_out_b[31:0]),
             .DOPBDOP                   (data_out_b[35:32]), 
             .DIBDI                     (data_in_b[31:0]),
             .DIPBDIP                   (data_in_b[35:32]), 
             .WEBWE                     (we_b),
             .REGCEB                    (1'b0),
             .RSTRAMB                   (1'b0),
             .RSTREGB                   (1'b0),
             .CASCADEINA                (1'b0),
             .CASCADEINB                (1'b0),
             .CASCADEOUTA               (),
             .CASCADEOUTB               (),
             .DBITERR                   (),
             .ECCPARITY                 (),
             .RDADDRECC                 (),
             .SBITERR                   (),
             .INJECTDBITERR             (1'b0),
             .INJECTSBITERR             (1'b0));
//
//
endmodule
//
////////////////////////////////////////////////////////////////////////////////////
//
// END OF FILE pick_ships.v
//
////////////////////////////////////////////////////////////////////////////////////
