`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 01:04:48 PM
// Design Name: 
// Module Name: CLA_4bits
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


module CLA_4bits(
    input clk,
    input enable,
    input [3:0] A, B,
    input Cin,
    output [4:0] Q  // load registers, should contain 4 sum bits and carry out
    );
    
    wire [3:0] G, P, S; // generate, propogate, and sum results bits
    wire [4:0] C;   // carry bits
    wire [4:0] Sum; // sum bits
   // wire Cout;
    
    assign C[0] = Cin; // assign initial Cin
    assign G[0] = A[0] & B[0];
    assign P[0] = A[0] ^ B[0];
    assign S[0] = P[0] ^ C[0];
    
    assign C[1] = G[0] | (P[0] & C[0]);
    assign G[1] = A[1] & B[1];
    assign P[1] = A[1] ^ B[1];
    assign S[1] = P[1] ^ (G[0] | (P[0] & C[0]));
    
    assign C[2] = G[1] | (P[1] & G[0]) 
                       | (P[1] & P[0] & C[0]);
    assign G[2] = A[2] & B[2];
    assign P[2] = A[2] ^ B[2];
    assign S[2] = P[2] ^ (G[1] | (P[1] & G[0]) 
                               | (P[1] & P[0] & C[0]));
    
    assign C[3] = G[2] | (P[2] & G[1]) 
                       | (P[2] & P[1] & G[0]) 
                       | (P[2] & P[1] & P[0] & C[0]);
    assign G[3] = A[3] & B[3];
    assign P[3] = A[3] ^ B[3];
    assign S[3] = P[3] ^ (G[2] | (P[2] & G[1]) 
                               | (P[2] & P[1] & G[0]) 
                               | (P[2] & P[1] & P[0] & C[0]));
    
    assign C[4] = G[3] | (P[3] & G[2]) 
                       | (P[3] & P[2] & G[1]) 
                       | (P[3] & P[2] & P[1] & G[0]) 
                       | (P[3] & P[2] & P[1] & P[0] & C[0]);
    
    assign Sum[0] = S[0];
    assign Sum[1] = S[1];
    assign Sum[2] = S[2];
    assign Sum[3] = S[3];
    assign Sum[4] = C[4];
    
    register_logic c1(.clk(clk), .enable(enable), .Data(Sum), .Q(Q));

    
endmodule
