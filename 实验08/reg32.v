`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 20:29:43
// Design Name: 
// Module Name: reg32
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


module reg32(
    input clk, //1 位输入，寄存器时钟信号，上升沿时为PC 寄存器赋值
    input rst, //1 位输入，异步重置信号，高电平时将PC 寄存器清零
               //注：当ena 信号无效时，rst 也可以重置寄存器
    input ena, //1 位输入,有效信号高电平时PC 寄存器读入data_in
               //的值，否则保持原有输出
    input [31:0] data_in, //32 位输入，输入数据将被存入寄存器内部
    output [31:0] data_out //32 位输出，工作时始终输出 PC
                               //寄存器内部存储的值
    );
    genvar i;
    generate
    for(i=0;i<32;i=i+1)
    begin:bin
        Dff inst(.CLK(clk),.RST_n(rst),.D(data_in[i]),.ena(ena),.Q1(data_out[i]));
    end
    endgenerate
endmodule
