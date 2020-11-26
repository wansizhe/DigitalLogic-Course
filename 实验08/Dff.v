`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 20:32:04
// Design Name: 
// Module Name: Dff
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


module Dff(
    input CLK, //时钟信号，上升沿有效
    input D, //输入信号D
    input RST_n, //复位信号，低电平有效
    input ena,
    output reg Q1 //输出信号Q
    );
    always @(negedge CLK or posedge RST_n)
    begin
        if(RST_n==1)
        begin
            Q1<=0;
        end
        else
        begin
            if(ena==1)
            begin
                Q1<=D;
            end
        end
    end
endmodule
