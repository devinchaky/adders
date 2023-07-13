`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2023 08:50:40 PM
// Design Name: 
// Module Name: RCA_4bits
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


module RCA_4bits(
    input clk,
    input enable,
    input [3:0] A, B,
    input Cin,
    output [4:0] Q
    );
    
    wire [4:0] Data;
    wire [2:0] Cout;
    
    full_adder c1(.A(A[0]), .B(B[0]), .Cin(Cin), .S(Data[0]), .Cout(Cout[0]));
    full_adder c2(.A(A[1]), .B(B[1]), .Cin(Cout[0]), .S(Data[1]), .Cout(Cout[1]));
    full_adder c3(.A(A[2]), .B(B[2]), .Cin(Cout[1]), .S(Data[2]), .Cout(Cout[2]));
    full_adder c4(.A(A[3]), .B(B[3]), .Cin(Cout[2]), .S(Data[3]), .Cout(Data[4]));
    
    register_logic c5(.clk(clk), .enable(enable), .Data(Data), .Q(Q));
    
endmodule
