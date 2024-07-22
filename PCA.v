`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 00:40:23
// Design Name: 
// Module Name: PCA
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

module adder #(parameter Width = 32)(
input [Width-1:0] PC,
output [Width-1:0] PCPlus4);
assign PCPlus4 = PC + 4;
endmodule

