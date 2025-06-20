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
    always #10 Clk=~Clk;//每延时10ns,翻转Clk信号（按位取反)刚好对应一个时钟周期
    
    initial begin
        Rset_n=0;//先复位将D触发器的输出设置为0
        #201;//why201，因为第200ns时Clk刚好到来上升沿，避免Rset_n和Clk同时到来上升沿导致不知道谁先生效
        Rset_n=1;
        #2000_000_000;//演示2秒钟闪烁
        $stop;
     end  
endmodule