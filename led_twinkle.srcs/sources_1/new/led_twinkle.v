module led_twinkle(//Led�����0.5�룬����1hzƵ����˸
    Clk,
    Rset_n,
    Led
);
input Clk;
input Rset_n;
output reg Led;//�ڹ��̸�ֵ����и�ֵҪ��reg
//��ʵ��ʹ�õ�FPGA�����Դ�������������Ƶ����50MHZ,����Сʱ��������20ns
//����һ��ʱ�������ص���һ��ʱ�������ص������20ns
reg[24:0]counter;
parameter MCNT=25_000_000-1;
always@(posedge Clk or negedge Rset_n)//���̸�ֵ��䣬ֻ���������źŻ��߸�λ�źŵ���ʱ���������Ż�ִ��
if(!Rset_n)//һ����⵽Rset_n�źŵ��½��ػ���Clk�ź������ص���ʱ����Rset_nΪ�͵�ƽʱִ��
    counter<=0;
else if(counter==MCNT)//0.5s��Ӧ25000000������
    counter<=0;
else    counter<=counter+1'b1;

always@(posedge Clk or negedge Rset_n)
if(!Rset_n)
    Led<=1'b0;
else if(counter==MCNT)
    Led<=!Led;



endmodule