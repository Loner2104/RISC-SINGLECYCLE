`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2024 19:11:29
// Design Name: 
// Module Name: BranchValid
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
module BranchValid(
    input branch,
    input zero,
    input f1,
    input f2,
    input [1:0] Aluop,
    input [2:0] funct3,
    output branchvalid
);
    reg branchvalid_reg;

    assign branchvalid = branchvalid_reg;

    always @(*) begin
        if (Aluop == 2'b01) begin
            case (funct3)
                3'b000: branchvalid_reg = branch && zero;
                3'b001: branchvalid_reg = branch && !zero;
                3'b100: branchvalid_reg = branch && f1;
                3'b101: branchvalid_reg = branch && f2;
                3'b110: branchvalid_reg = branch && f1;
                3'b111: branchvalid_reg = branch && f2;
                default: branchvalid_reg = 0;
            endcase
        end else begin
            branchvalid_reg = 0;
        end
    end
endmodule