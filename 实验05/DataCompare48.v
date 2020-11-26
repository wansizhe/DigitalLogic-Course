`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/31 23:09:08
// Design Name: 
// Module Name: DataCompare4
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


module DataCompare4(
    input [3:0] iData_a,
    input [3:0] iData_b,
    input [2:0] iData,
    output [2:0] oData
    );
    reg [2:0] temp;
    always @(iData or iData_a or iData_b)
    begin
        if(iData_a>iData_b)
        begin
            temp[2]=1;
            temp[1]=0;
            temp[0]=0;
        end
        else if(iData_a<iData_b)
        begin
            temp[2]=0;
            temp[1]=1;
            temp[0]=0;
        end
        else
        begin
            if(iData[2]==1)
            begin
                temp[2]=1;
                temp[1]=0;
                temp[0]=0;
            end
            else if(iData[1]==1)
            begin
                temp[2]=0;
                temp[1]=1;
                temp[0]=0;
            end
            else
            begin
                temp[2]=0;
                temp[1]=0;
                temp[0]=1;
            end
        end
    end
    assign oData=temp;
endmodule
