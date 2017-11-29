`timescale 1ns/1ps
`define TCQ #1

module Serializer#(
    parameter WORD_LENGTH = 16,
    parameter SYSTEM_FREQUENCY = 100000000,
    parameter SAMPLING_FREQUENCY = 1000000)
(
input logic clock_i, //100Mhz system clock
input logic enable_i, //Enable passed by controller
input logic reset_i,

output logic done_o, //Data is ready
input logic [15:0] data_i, //output 16 bit word

//PWM Microphone inputs
output logic pwm_audio_o,
output logic pwm_sdaudio_o = 1
);

logic [3:0] count = 0;

Clock_Scalar DUT(
    .clk(clock_i),
    .reset(reset_i),
    .scaled_clk(pwm_sdaudio_o)
);

always_ff @(posedge pwm_sdaudio_o)
begin
    if(reset_i)
        begin
        pwm_audio_o <= `TCQ 0;
        count <= `TCQ 0;
        end 
    else 
        if(enable_i)
          begin
            if(count != 15)
                begin
                pwm_audio_o <= `TCQ data_i[count];
                count <= `TCQ count+1;
                done_o <= `TCQ 0;
                end
            else
                begin
                pwm_audio_o <= `TCQ data_i[count];
                //count <= `TCQ 0;
                done_o <= `TCQ 1;
                end
          end
end



endmodule