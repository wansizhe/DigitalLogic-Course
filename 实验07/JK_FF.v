module JK_FF(
    input CLK, //ʱ���źţ���������Ч
    input J, //�����ź�J
    input K, //�����ź�K
    input RST_n, //��λ�źţ��͵�ƽ��Ч
    output reg Q1, //����ź�Q
    output reg Q2 //����ź� ?
    );
    always @(posedge CLK or negedge RST_n)
    begin
        if(RST_n==0)
        begin
            Q1<=0;
            Q2<=1;
        end
        else
        begin
        if(J!=K)
        begin
            Q1<=J;
            Q2<=K;
        end
        else if(J==1&&K==1)
        begin
            Q1<=Q2;
            Q2<=Q1;
        end
        end
    end
endmodule