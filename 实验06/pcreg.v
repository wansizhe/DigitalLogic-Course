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
    input clk, //1 λ���룬�Ĵ���ʱ���źţ�������ʱΪPC �Ĵ�����ֵ
    input rst, //1 λ���룬�첽�����źţ��ߵ�ƽʱ��PC �Ĵ�������
               //ע����ena �ź���Чʱ��rst Ҳ�������üĴ���
    input ena, //1 λ����,��Ч�źŸߵ�ƽʱPC �Ĵ�������data_in
               //��ֵ�����򱣳�ԭ�����
    input [31:0] data_in, //32 λ���룬�������ݽ�������Ĵ����ڲ�
    output reg [31:0] data_out //32 λ���������ʱʼ����� PC
                               //�Ĵ����ڲ��洢��ֵ
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
