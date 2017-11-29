
`timescale 1ns / 1ps
`define TCQ #1;

module Synchronizer(
    input logic clk,
    input logic recordButton,
    input logic sampleSwitch,
    reg recordButtonState, sampleSwitchState, delay_1, delay_2,
    output posedge_button,
    output negedge_button,
    output posedge_switch,
    output negedge_switch
    );
    
    
    
    always@(posedge clk)
    begin
        recordButtonState <= recordButton;
        delay_1 <= recordButtonState;
        delay_2 <= delay_1;
        sampleSwitchState <= sampleSwitch;
        delay_1 <= sampleSwitchState;
        delay_2 <= delay_1;
    end
    
    assign posedge_button = delay_1 & ~delay_2;
    assign negedge_button = ~delay_1 & delay_2;
    assign posedge_switch = delay_1 & ~delay_2;
    assign negedge_switch = delay_1 & ~delay_2;
    
endmodule
