`timescale 1ns / 1ps

module LED_7seg(
    input logic clk, reset, [3:0]BCD,
    output logic [7:0]SevenSeg
);

//reg  SevenSeg;

always_ff @ (posedge clk or posedge reset)
begin
    if (reset)
    begin
        SevenSeg <= 8'b00000000;
    end
else
begin
case(BCD)

  
    4'h1: SevenSeg <=    8'b01100000;
    4'h2: SevenSeg <=    8'b11011010;
    default: SevenSeg <= 8'b00000000;

endcase
end
end
//assign {segA, segB, segC, segD, segE, segF, segG, segDP} = SevenSeg;
endmodule