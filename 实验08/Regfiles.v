`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 20:16:25
// Design Name: 
// Module Name: Regfiles
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


module Regfiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    wire [31:0]out[31:0];
    wire [31:0]wa;
    decoder dwa(.iData(waddr),.iEna(we),.oData(wa));
    genvar i;
    generate
    for(i=0;i<32;i=i+1)
    begin:bin
        reg32 inst(.clk(clk),.rst(rst),.ena(wa[i]),.data_in(wdata),.data_out(out[i]));
    end
    endgenerate
    selector321 s1(
        .iC00(out[0]),.iC01(out[1]),.iC02(out[2]),.iC03(out[3]),.iC04(out[4]),.iC05(out[5]),.iC06(out[6]),.iC07(out[7]),
        .iC08(out[8]),.iC09(out[9]),.iC10(out[10]),.iC11(out[11]),.iC12(out[12]),.iC13(out[13]),.iC14(out[14]),.iC15(out[15]),
        .iC16(out[16]),.iC17(out[17]),.iC18(out[18]),.iC19(out[19]),.iC20(out[20]),.iC21(out[21]),.iC22(out[22]),.iC23(out[23]),
        .iC24(out[24]),.iC25(out[25]),.iC26(out[26]),.iC27(out[27]),.iC28(out[28]),.iC29(out[29]),.iC30(out[30]),.iC31(out[31]),
        .iS(raddr1),.ena(~we),.oZ(rdata1)
        );
    selector321 s2(
        .iC00(out[0]),.iC01(out[1]),.iC02(out[2]),.iC03(out[3]),.iC04(out[4]),.iC05(out[5]),.iC06(out[6]),.iC07(out[7]),
        .iC08(out[8]),.iC09(out[9]),.iC10(out[10]),.iC11(out[11]),.iC12(out[12]),.iC13(out[13]),.iC14(out[14]),.iC15(out[15]),
        .iC16(out[16]),.iC17(out[17]),.iC18(out[18]),.iC19(out[19]),.iC20(out[20]),.iC21(out[21]),.iC22(out[22]),.iC23(out[23]),
        .iC24(out[24]),.iC25(out[25]),.iC26(out[26]),.iC27(out[27]),.iC28(out[28]),.iC29(out[29]),.iC30(out[30]),.iC31(out[31]),
        .iS(raddr2),.ena(~we),.oZ(rdata2)
        );
endmodule
