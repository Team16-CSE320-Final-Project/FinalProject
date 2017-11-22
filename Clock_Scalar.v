`timescale 1ns / 1ns
`define TCQ #1
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 10:26:39 PM
// Design Name: 
// Module Name: fsm
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

module Clock_Scalar
(input clk,
input reset,
output reg scaled_clk);

parameter width = 7;
reg [width-1:0] count;

initial begin
    count = 7'd0;
    scaled_clk = 0;
end

always @ (posedge clk)
    begin
        if ( (reset) || (count == 7'd100))
            count <= `TCQ {width{1'b0}};
        else
        begin
            count <= `TCQ count+1;
        end
    end

always @ (posedge clk)
    begin
        if (reset)
            scaled_clk <= `TCQ 1'b0;
        else if (count == 7'd100)
        begin
            scaled_clk <= `TCQ ! scaled_clk;
        end
    end

endmodule