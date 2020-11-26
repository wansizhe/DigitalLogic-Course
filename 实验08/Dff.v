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
    input CLK, //ʱ���źţ���������Ч
    input D, //�����ź�D
    input RST_n, //��λ�źţ��͵�ƽ��Ч
    input ena,
    output reg Q1 //����ź�Q
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
