`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/12 17:24:30
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a, //32 位输入，操作数1
    input [31:0] b, //32 位输入，操作数2
    input [3:0] aluc, //4 位输入，控制 alu 的操作
    output [31:0] r, //32 位输出，由a、b 经过aluc 指定的操作生成
    output zero, //0 标志位
    output carry, // 进位标志位
    output negative, // 负数标志位
    output overflow // 溢出标志位
);
    wire [13:0]z;
    wire [5:0]c;
    wire [1:0]v;
    wire [13:0]n;
    wire [31:0] tr[13:0];
    reg tn,tc,tz,tv;
    reg [31:0] ttr;
    Addu inst0(.a(a),.b(b),.r(tr[0]),.z(z[0]),.c(c[0]),.n(n[0]));
    Add inst1(.a(a),.b(b),.r(tr[1]),.z(z[1]),.v(v[0]),.n(n[1]));
    Subu inst2(.a(a),.b(b),.r(tr[2]),.z(z[2]),.c(c[1]),.n(n[2]));
    Sub inst3(.a(a),.b(b),.r(tr[3]),.z(z[3]),.v(v[1]),.n(n[3]));
    And inst4(.a(a),.b(b),.r(tr[4]),.z(z[4]),.n(n[4]));
    Or inst5(.a(a),.b(b),.r(tr[5]),.z(z[5]),.n(n[5]));
    Xor inst6(.a(a),.b(b),.r(tr[6]),.z(z[6]),.n(n[6]));
    Nor inst7(.a(a),.b(b),.r(tr[7]),.z(z[7]),.n(n[7]));
    Lui inst8(.a(a),.b(b),.r(tr[8]),.z(z[8]),.n(n[8]));
    Slt inst9(.a(a),.b(b),.r(tr[9]),.z(z[9]),.n(n[9]));
    Sltu inst10(.a(a),.b(b),.r(tr[10]),.z(z[10]),.n(n[10]),.c(c[2]));
    Sra inst11(.a(a),.b(b),.r(tr[11]),.z(z[11]),.n(n[11]),.c(c[3]));
    Sl inst12(.a(a),.b(b),.r(tr[12]),.z(z[12]),.n(n[12]),.c(c[4]));
    Srl inst13(.a(a),.b(b),.r(tr[13]),.z(z[13]),.n(n[13]),.c(c[5]));
    
    always @(*)
    begin
        case (aluc)
        4'b0000:
        begin
            ttr=tr[0];
            tn=n[0];
            tz=z[0];
            tc=c[0];
            //tv=v[0];
        end
        4'b0010:
        begin
            ttr=tr[1];
            tn=n[1];
            tz=z[1];
            //tc=c[0];
            tv=v[0];
        end
        4'b0001:
        begin
            ttr=tr[2];
            tn=n[2];
            tz=z[2];
            tc=c[1];
            //tv=v[0];
        end
        4'b0011:
        begin
            ttr=tr[3];
            tn=n[3];
            tz=z[3];
            //tc=c[3];
            tv=v[1];
        end           
        4'b0100:
        begin
            ttr=tr[4];
            tn=n[4];
            tz=z[4];
            //tc=c[2];
            //tv=v[0];
        end
        4'b0101:
        begin
            ttr=tr[5];
            tn=n[5];
            tz=z[5];
            //tc=c[0];
            //tv=v[0];
        end
        4'b0110:
        begin
            ttr=tr[6];
            tn=n[6];
            tz=z[6];
            //tc=c[0];
            //tv=v[0];
        end             
        4'b0111:
        begin
            ttr=tr[7];
            tn=n[7];
            tz=z[7];
            //tc=c[0];
            //tv=v[0];
        end
        4'b1000:
        begin
            ttr=tr[8];
            tn=n[8];
            tz=z[8];
            //tc=c[2];
            //tv=v[0];
        end
        4'b1001:
        begin
            ttr=tr[8];
            tn=n[8];
            tz=z[8];
            //tc=c[2];
            //tv=v[0];
        end
        4'b1011:
        begin
            ttr=tr[9];
            tn=n[9];
            tz=z[9];
            //tc=c[3];
            //tv=v[0];
        end                                
        4'b1010:
        begin
            ttr=tr[10];
            tn=n[10];
            tz=z[10];
            tc=c[2];
            //tv=v[0];
        end
        4'b1100:
        begin
            ttr=tr[11];
            tn=n[11];
            tz=z[11];
            tc=c[3];
            //tv=v[0];
        end
        4'b1111:
        begin
            ttr=tr[12];
            tn=n[12];
            tz=z[12];
            tc=c[4];
            //tv=v[0];
        end                        
        4'b1110:
        begin
            ttr=tr[12];
            tn=n[12];
            tz=z[12];
            tc=c[4];
            //tv=v[0];
        end
        4'b1101:
        begin
            ttr=tr[13];
            tn=n[13];
            tz=z[13];
            tc=c[5];
            //tv=v[0];
        end
        default:
        begin
        end               
        endcase
    end
    assign r=ttr;
    assign zero=tz;
    assign carry=tc;
    assign negative=tn;
    assign overflow=tv;
endmodule

module Addu(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=a+b;
        
        tz=(tr==32'b0)?1:0;
        
        if(tr<a||tr<b) tc=1;
        else tc=0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Add(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n,
    output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    reg tv;
    always @(*)
    begin
        tr=a+b;
        
        tz=(tr==32'b0)?1:0;
        
        tn=tr[31];
        
        if(a[31]==b[31]&&tr[31]!=a[31]) tv=1;
        else tv=0;
        
        //if(tv==1) tr=32'd0;
    end
    assign r=tr;
    assign z=tz;
    //assign c=tc;
    assign n=tn;
    assign v=tv;
endmodule 

module Subu(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=a-b;
        
       tz=(tr==32'b0)?1:0;
        
        if(a<b) tc=1;
        else tc=0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Sub(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n,
    output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    reg tv;
    always @(*)
    begin
        tr=a-b;
        
        tz=(tr==32'b0)?1:0;
        
        tn=tr[31];
        
        if(a[31]!=b[31]&&tr[31]!=a[31]) tv=1;
        else tv=0;
    end
    assign r=tr;
    assign z=tz;
    //assign c=tc;
    assign n=tn;
    assign v=tv;
endmodule 

module And(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=a&b;
        
        tz=(tr==32'b0)?1:0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
   // assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Or(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=a|b;
        
        tz=(tr==32'b0)?1:0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
   // assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Xor(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=a^b;
        
        tz=(tr==32'b0)?1:0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
   // assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Nor(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=~(a|b);
        
        tz=(tr==32'b0)?1:0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
   // assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Lui(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    //reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr={b[15:0],16'b0};
        
        tz=(tr==32'b0)?1:0;
        
        //tc=0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    //assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Slt(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    //output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        if(a[31]==0&&b[31]==1) tr=0;
        else if(a[31]==1&&b[31]==0) tr=1;
        else if(a[31]==1&&b[31]==1) tr=(a[30:0]<b[30:0])?1:0;
        else tr=(a[30:0]<b[30:0])?1:0;
        
        tz=(a==b)?1:0;
        
        //tc=0;
        
        tn=tr; 
    end
    assign r=tr;
    assign z=tz;
    //assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Sltu(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=(a<b)?1:0;
        
        tz=(a==b)?1:0;
        
        tc=(a<b)?1:0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Sra(
    input [31:0]a,
    input signed [31:0]b,
    output [31:0]r,
    output z,
    output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=b>>>a;
        
        tz=(tr==32'b0)?1:0;
        
        if(a==0) tc=0;
        else if(a<32'd33) tc=b[a-32'd1];
        else tc=b[31];
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Sl(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=b<<a;
        
        tz=(tr==32'b0)?1:0;
        
        if(a==0) tc=0;
        else if(a<32'd33) tc=b[32'd32-a];
        else tc=0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

module Srl(
    input [31:0]a,
    input [31:0]b,
    output [31:0]r,
    output z,
    output c,
    output n
    //output v
    );
    reg [31:0]tr;
    reg tz;
    reg tc;
    reg tn;
    //reg tv;
    always @(*)
    begin
        tr=b>>a;
        
        tz=(tr==32'b0)?1:0;
        
        if(a==0) tc=0;
        else if(a<32'd33) tc=b[a-32'd1];
        else tc=0;
        
        tn=tr[31]; 
    end
    assign r=tr;
    assign z=tz;
    assign c=tc;
    assign n=tn;
    //assign v=tv;
endmodule 

