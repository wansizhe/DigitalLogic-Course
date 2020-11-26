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
    input clk, //1 λ���룬�Ĵ���ʱ���źţ�������ʱΪPC �Ĵ�����ֵ
    input rst, //1 λ���룬�첽�����źţ��ߵ�ƽʱ��PC �Ĵ�������
               //ע����ena �ź���Чʱ��rst Ҳ�������üĴ���
    input ena, //1 λ����,��Ч�źŸߵ�ƽʱPC �Ĵ�������data_in
               //��ֵ�����򱣳�ԭ�����
    input [31:0] data_in, //32 λ���룬�������ݽ�������Ĵ����ڲ�
    output [31:0] data_out //32 λ���������ʱʼ����� PC
                               //�Ĵ����ڲ��洢��ֵ
    );
    genvar i;
    generate
    for(i=0;i<32;i=i+1)
    begin:bin
        Dff inst(.CLK(clk),.RST_n(rst),.D(data_in[i]),.ena(ena),.Q1(data_out[i]));
    end
    endgenerate
endmodule
