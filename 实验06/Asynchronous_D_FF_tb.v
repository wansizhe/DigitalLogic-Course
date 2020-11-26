`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/09 17:37:20
// Design Name: 
// Module Name: Asynchronous_D_FF_tb
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
module Asynchronous_D_FF_tb();
    reg CLK; //ʱ���źţ���������Ч
    reg D; //�����ź�D
    reg RST_n; //��λ�źţ��͵�ƽ��Ч
    wire Q1; //����ź�Q
    wire Q2; //����ź� ?
    
    Asynchronous_D_FF inst(
            .CLK(CLK),
            .D(D),
            .RST_n(RST_n),
            .Q1(Q1),
            .Q2(Q2)
            );
        
        initial
                begin
                    RST_n=0;
                    #10 RST_n=1;
                    #30 RST_n=0;
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
                    D=1;
                    #20 D=0;
                    #10 D=1;
                    #15;
                end

endmodule
