`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 00:59:19
// Design Name: 
// Module Name: ProgramCounter
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


module PCCounter #(parameter Width = 32) 
(input clk, rst, [Width-1:0] PC1, output reg [Width-1:0] PC);

always@(posedge clk)
begin
if(rst == 1)
PC <= 0 ;
else 
//PC <= PC1;
PC <= PC1;
end
endmodule