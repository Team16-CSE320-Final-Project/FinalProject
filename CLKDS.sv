`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2017 01:45:40 PM
// Design Name: 
// Module Name: Calc
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


module CLKDS();

 logic clock_i = 1'b0;
 logic reset_i;
 logic enable_i;
 logic done_o;
 logic [15:0]data_o;
 logic pdm_clk_o;
 logic pdm_data_i;
 logic pdm_lrsel_o;
 
 parameter Time_Period = 10, Delay = 100;
 
 Deserializer DUT(
 .clock_i(clock_i), 
 .reset_i(reset_i), 
 .enable_i(enable_i),
 .done_o(done_o), 
 .data_o(data_o), 
 .pdm_clk_o(pdm_clk_o), 
 .pdm_data_i(pdm_data_i),
 .pdm_lrsel_o(pdm_lrsel_o));
 
 always
 #(Time_Period/2)clock_i = ~clock_i;
 initial begin
 reset_i = 1;
 
 #100
 reset_i = 0;
 pdm_data_i = 1;
 enable_i = 1;
 

 #15000
 enable_i = 1;
 
 #15000
  enable_i = 1;
  
 #15000
  enable_i = 1;
   
 #15000
   enable_i = 0;
 
 
end


endmodule
