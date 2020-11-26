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
    input clk, //�洢��ʱ���źţ�������ʱ��ram �ڲ�д������
    input ena, //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У��������z
    input wena, //�洢��д��Ч�źţ��ߵ�ƽ��Ч����ena ͬʱ��Чʱ�ſ�д�洢��
    input [4:0] addr, //�����ַ��ָ�����ݶ�д�ĵ�ַ
    input [31:0] data_in, //�洢��д������ݣ���clk ������ʱ��д��
    output [31:0] data_out //�洢�����������ݣ�
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
