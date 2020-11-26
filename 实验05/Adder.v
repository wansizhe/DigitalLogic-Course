`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/31 23:39:50
// Design Name: 
// Module Name: Adder
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


module Adder(
    input iSA,
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [8:0] oData,
    output oData_C
    );
    reg [8:0] temp; 
    reg c;
    always @(iSA or iData_a or iData_b)
    begin
        temp=9'b00000000;
        c=0;
        if(iSA==0)
        begin
            temp=iData_a+iData_b;
            c=temp[8];
        end
        else
        begin
            if(iData_a[7]==0&&iData_b[7]==0)
            begin
                temp[8]=1'b0;
                temp[7:0]=iData_a[6:0]+iData_b[6:0];
                c=temp[7];
            end
            else if(iData_a[7]==1&&iData_b[7]==1)
            begin
                temp[8]=1'b1;
                temp[7:0]=iData_a[6:0]+iData_b[6:0];
                c=temp[7];
            end
            else if(iData_a[7]==1&&iData_b[7]==0)
            begin
                if(iData_a[6:0]<=iData_b[6:0])
                begin
                    temp[8]=1'b0;
                    temp[7:0]=iData_b[6:0]-iData_a[6:0];
                    c=1'b0;
                end
                else
                begin
                    temp[8]=1'b1;
                    temp[7:0]=iData_a[6:0]-iData_b[6:0];
                    c=1'b0;
                end
            end
            else
            begin
                if(iData_a[6:0]>=iData_b[6:0])
                begin
                    temp[8]=1'b0;
                    temp[7:0]=iData_a[6:0]-iData_b[6:0];
                    c=1'b0;
                end
                else
                begin
                    temp[8]=1'b1;
                    temp[7:0]=iData_b[6:0]-iData_a[6:0];
                    c=1'b0;
                end
            end
        end
    end
    assign oData=temp;
    assign oData_C=c;
endmodule
