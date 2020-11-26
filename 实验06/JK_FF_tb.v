`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/09 19:47:29
// Design Name: 
// Module Name: JK_FF_tb
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

`timescale 1ns/1ns
module JK_FF_tb();
    reg CLK; //时钟信号，上升沿有效
    reg J; //输入信号J
    reg K; //输入信号K
    reg RST_n; //复位信号，低电平有效
    wire Q1; //输出信号Q
    wire Q2; //输出信号 ?
    
    JK_FF inst(
        .CLK(CLK),
        .J(J),
        .K(K),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
        );
    initial
    begin
        RST_n=0;
        #5 RST_n=1;
        #35 RST_n=0;
        #5;
    end
    initial
    begin
            CLK=0;
            #5 CLK=1;
            #5 CLK=0;
            #5 CLK=1;
            #5 CLK=0;
            #5 CLK=1;
            #5 CLK=0;
            #5 CLK=1;
            #5 CLK=0;
            #5;
    end
    initial
    begin
            J=1;
            #10 J=0;
            #10 J=1;
            #10 J=0;
            #15;
    end
    initial
    begin
        K=0;
        #10 K=1;
        #20 K=0;
        #15;
    end
endmodule
