`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 19:05:55
// Design Name: 
// Module Name: ram
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


module ram(
    input clk, //存储器时钟信号，上升沿时向ram 内部写入数据
    input ena, //存储器有效信号，高电平时存储器才运行，否则输出z
    input wena, //存储器写有效信号，高电平有效，与ena 同时有效时才可写存储器
    input [4:0] addr, //输入地址，指定数据读写的地址
    input [31:0] data_in, //存储器写入的数据，在clk 上升沿时被写入
    output [31:0] data_out //存储器读出的数据，
    );
    reg [31:0] temp;
    reg [31:0] m[31:0];
    always @(posedge clk)
    begin
        if(ena==0)
            temp<=32'bz;
        else
        begin
            if(wena==0)
                temp=m[addr];
            else
            begin
                temp<=32'bz;
                m[addr]<=data_in;
            end
        end
    end
    assign data_out=temp;
endmodule
