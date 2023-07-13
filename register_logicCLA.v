`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 08:15:45 PM
// Design Name: 
// Module Name: register_logic
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


module register_logic(
    input clk, 
    input enable,
    input [4:0] Data,
    output reg [4:0] Q
    );
    
    initial Q=0;
    always @(posedge clk) begin
        if (enable)
            Q <= Data;
        else
            Q <= Q;
      end
    
endmodule
