`timescale 1ns/1ns

module led_twinkle_tb();

    reg Clk;
    reg Rset_n;
    wire Led;
    
    led_twinkle led_twinkle_inst(
    .Clk(Clk),
    .Rset_n(Rset_n),
    .Led(Led)
);
    initial Clk=1;
    always #10 Clk=~Clk;//ÿ��ʱ10ns,��תClk�źţ���λȡ��)�պö�Ӧһ��ʱ������
    
    initial begin
        Rset_n=0;//�ȸ�λ��D���������������Ϊ0
        #201;//why201����Ϊ��200nsʱClk�պõ��������أ�����Rset_n��Clkͬʱ���������ص��²�֪��˭����Ч
        Rset_n=1;
        #2000_000_000;//��ʾ2������˸
        $stop;
     end  
endmodule