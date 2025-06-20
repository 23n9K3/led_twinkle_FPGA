module led_twinkle(//Led亮灭各0.5秒，即以1hz频率闪烁
    Clk,
    Rset_n,
    Led
);
input Clk;
input Rset_n;
output reg Led;//在过程赋值语句中赋值要用reg
//本实验使用的FPGA板的有源晶振输出方波的频率是50MHZ,即最小时钟周期是20ns
//即上一个时钟上升沿到下一次时钟上升沿到来间隔20ns
reg[24:0]counter;
parameter MCNT=25_000_000-1;
always@(posedge Clk or negedge Rset_n)//过程赋值语句，只有上升沿信号或者复位信号到来时，后面代码才会执行
if(!Rset_n)//一旦检测到Rset_n信号的下降沿或者Clk信号上升沿到来时发现Rset_n为低电平时执行
    counter<=0;
else if(counter==MCNT)//0.5s对应25000000个周期
    counter<=0;
else    counter<=counter+1'b1;

always@(posedge Clk or negedge Rset_n)
if(!Rset_n)
    Led<=1'b0;
else if(counter==MCNT)
    Led<=!Led;



endmodule