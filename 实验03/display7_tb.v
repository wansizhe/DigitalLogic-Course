`timescale 1ns/1ns
module display7_tb();
    reg [3:0] iData;
    wire [6:0] oData;
    display7 inst(
        .iData(iData),
        .oData(oData)
        );
        
    initial
    begin
    iData=4'b0000;
    #10 iData=4'b0001;
    #10 iData=4'b0010;
    #10 iData=4'b0011;
    #10 iData=4'b0100;
    #10 iData=4'b0101;
    #10 iData=4'b0110;
    #10 iData=4'b0111;
    #10 iData=4'b1000;
    #10 iData=4'b1001;
    #10;
    end
endmodule