`timescale 1ns / 1ps


module SevenSeg_tb();
    logic clk=1'b0, reset;
    logic [3:0] BCD;
    //logic segA, segB, segC, segD, segE, segF, segG;
    logic [7:0]SevenSeg;
    
    
    LED_7seg myDisplay(.clk(clk),
                       .reset(reset),
                       .BCD(BCD),
                       .SevenSeg(SevenSeg)
                       );
    
    parameter timePeriod = 10;
    parameter delay = 100;
    always #(timePeriod / 2)clk = ~clk;
    
    initial
    begin
    
    #100 BCD = 4'h0;     
    #100 BCD = 4'h1;
    #100 BCD = 4'h2;
    end
    
endmodule


