`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 23:17:12
// Design Name: 
// Module Name: selector321
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


module selector321(
    input [31:0] iC00,
    input [31:0] iC01,
    input [31:0] iC02,
    input [31:0] iC03,
    input [31:0] iC04,
    input [31:0] iC05,
    input [31:0] iC06,
    input [31:0] iC07,
    input [31:0] iC08,
    input [31:0] iC09,
    input [31:0] iC10,
    input [31:0] iC11,
    input [31:0] iC12,
    input [31:0] iC13,
    input [31:0] iC14,
    input [31:0] iC15,
    input [31:0] iC16,
    input [31:0] iC17,
    input [31:0] iC18,
    input [31:0] iC19,
    input [31:0] iC20,
    input [31:0] iC21,
    input [31:0] iC22,
    input [31:0] iC23,
    input [31:0] iC24,
    input [31:0] iC25,
    input [31:0] iC26,
    input [31:0] iC27,
    input [31:0] iC28,
    input [31:0] iC29,
    input [31:0] iC30,
    input [31:0] iC31,
    input [4:0] iS,
    input ena,//高电平有效，可以读数据
    output [31:0] oZ
    );
    reg [31:0]temp[31:0];
    reg [31:0]t;
    always @(*)
    begin
        temp[0]=iC00;
        temp[1]=iC01;
        temp[2]=iC02;
        temp[3]=iC03;
        temp[4]=iC04;
        temp[5]=iC05;
        temp[6]=iC06;
        temp[7]=iC07;
        temp[8]=iC08;
        temp[9]=iC09;
        temp[10]=iC10;
        temp[11]=iC11;
        temp[12]=iC12;
        temp[13]=iC13;
        temp[14]=iC14;
        temp[15]=iC15;
        temp[16]=iC16;
        temp[17]=iC17;
        temp[18]=iC18;
        temp[19]=iC19;
        temp[20]=iC20;
        temp[21]=iC21;
        temp[22]=iC22;
        temp[23]=iC23;
        temp[24]=iC24;
        temp[25]=iC25;
        temp[26]=iC26;
        temp[27]=iC27;
        temp[28]=iC28;
        temp[29]=iC29;
        temp[30]=iC30;
        temp[31]=iC31;
        if(ena==1)
            t<=temp[iS];
        else
            t=32'bz;
    end
    assign oZ=t;
endmodule
