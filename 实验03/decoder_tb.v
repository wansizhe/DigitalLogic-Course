`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/18 18:01:35
// Design Name: 
// Module Name: decoder_tb
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
module decoder_tb();
    reg [2:0] iData;
    reg [1:0] iEna;
    wire [7:0] oData;
    
    decoder inst(
        .iData(iData),
        .iEna(iEna),
        .oData(oData)
        );
        
    initial
    begin
    iEna=2'b11;
    #10 iEna=2'b01;
    #10 iEna=2'b00;
    #10 iEna=2'b10;
    #80;
    end
    
    initial
    begin
    iData=3'b101;
    #10 iData=3'b011;
    #10 iData=3'b110;
    
    #10 iData=3'b000;
    #10 iData=3'b001;
    #10 iData=3'b010;
    #10 iData=3'b011;
    #10 iData=3'b100;
    #10 iData=3'b101;
    #10 iData=3'b110;
    #10 iData=3'b111;
    #10;
    end

endmodule
