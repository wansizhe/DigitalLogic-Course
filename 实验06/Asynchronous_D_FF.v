`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/08 15:09:22
// Design Name: 
// Module Name: Asynchronous_D_FF
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


module Asynchronous_D_FF(
    input CLK, //ʱ���źţ���������Ч
    input D, //�����ź�D
    input RST_n, //��λ�źţ��͵�ƽ��Ч
    output reg Q1, //����ź�Q
    output reg Q2 //����ź� ?
    );
    always @(posedge CLK or negedge RST_n)
    begin
        if(RST_n==0)
        begin
            Q1<=0;
            Q2<=1;
        end
        else
        begin
            Q1<=D;
            Q2<=~D;
        end
    end
endmodule
