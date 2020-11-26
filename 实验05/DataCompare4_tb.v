`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/02 18:25:46
// Design Name: 
// Module Name: DataCompare4_tb
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
module DataCompare4_tb();
    reg [3:0] iData_a;
    reg [3:0] iData_b;
    reg [2:0] iData;
    wire [2:0] oData;
    
    DataCompare4 inst(
        .iData_a(iData_a),
        .iData_b(iData_b),
        .iData(iData),
        .oData(oData)
        );
    
    initial
    begin
        iData=3'b001;
        #30 iData=3'b010;
        #30 iData=3'b100;
        #30;
    end
    
    initial
    begin
        iData_a=4'b0010;
        #10 iData_a=4'b0100;
        #10 iData_a=4'b1010;
        
        #10 iData_a=4'b0001;
        #10 iData_a=4'b1000;
        #10 iData_a=4'b1111;
        
        #10 iData_a=4'b0011;
        #10 iData_a=4'b1100;
        #10 iData_a=4'b0110;
        #10;
    end
    
    initial
    begin
        iData_b=4'b0100;
        #10 iData_b=4'b0010;
        #10 iData_b=4'b1010;
         
        #10 iData_b=4'b1000;
        #10 iData_b=4'b0001;
        #10 iData_b=4'b1111;
            
        #10 iData_b=4'b1100;
        #10 iData_b=4'b0011;
        #10 iData_b=4'b0110;
        #10;
    end
endmodule
