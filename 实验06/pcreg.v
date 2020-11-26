`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/09 22:05:58
// Design Name: 
// Module Name: pcreg
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


module pcreg(
    input clk, //1 位输入，寄存器时钟信号，上升沿时为PC 寄存器赋值
    input rst, //1 位输入，异步重置信号，高电平时将PC 寄存器清零
               //注：当ena 信号无效时，rst 也可以重置寄存器
    input ena, //1 位输入,有效信号高电平时PC 寄存器读入data_in
               //的值，否则保持原有输出
    input [31:0] data_in, //32 位输入，输入数据将被存入寄存器内部
    output reg [31:0] data_out //32 位输出，工作时始终输出 PC
                               //寄存器内部存储的值
    );
    always @(posedge clk or posedge rst)
    begin
        if(rst==1)
        begin
            data_out=8'h00000000;
        end
        else
        begin
            if(ena==1)
                data_out=data_in;
        end
    end
endmodule
