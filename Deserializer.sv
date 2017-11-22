`timescale 1ns/1ps
`define TCQ #1

module Deserializer#(
    parameter WORD_LENGTH = 16,
    parameter SYSTEM_FREQUENCY = 100000000,
    parameter SAMPLING_FREQUENCY = 1000000)
(
input logic clock_i, //100Mhz system clock
input logic enable_i, //Enable passed by controller
input logic reset_i,

output logic done_o, //Data is ready
output logic [15:0] data_o, //output 16 bit word

//PDM Microphone inputs
output logic pdm_clk_o,
input logic pdm_data_i,
output logic pdm_lrsel_o = 0
);  

logic [3:0]count = 0;

Clock_Scalar DUT(
    .clk(clock_i),
    .reset(reset_i),
    .scaled_clk(pdm_clk_o)
);

always_ff @(posedge pdm_clk_o)
begin
    if(reset_i)
        begin
        data_o <= `TCQ 16'b0;
        count <= `TCQ 0;
        end 
    else 
        if(enable_i)
          begin
            if(count != 15)
                begin
                data_o[count] <= `TCQ pdm_data_i;
                count <= `TCQ count+1;
                done_o <= `TCQ 0;
                end
            else
                begin
                data_o[count] <= `TCQ pdm_data_i;
                //count <= `TCQ 0;
                done_o <= `TCQ 1;
                end
          end
end

endmodule  