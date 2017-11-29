`timescale 1ns / 1ps



module Synchronizer_tb();
    logic clk = 1'b0;
    logic recordButton;
    logic sampleSwitch;
    logic recordButtonState;
    logic sampleSwitchState;
    
    
Synchronizer mySynch( 
    .clk(clk), 
    .recordButton(recordButton), 
    .sampleSwitch(sampleSwitch),   
    .recordButtonState(recordButtonState),
    .sampleSwitchState(sampleSwitchState)
    );
    
     parameter timePeriod = 10;
     parameter delay = 100;
       
     always #(timePeriod / 2)clk = ~clk;  
     initial
     begin
        #100 recordButton = 1'b0;
        #100 recordButton = 1'b1;   
        #100 recordButton = 1'b0;
        
        #100 sampleSwitch = 1'b0;
        #100 sampleSwitch = 1'b1;
        #100 sampleSwitch = 1'b0;
        
     end
    
    
endmodule
