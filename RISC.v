`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 01:03:12
// Design Name: 
// Module Name: RISC
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
module RISC(input clk,rst);
wire [63:0] d,e,Writedata,immediateout, RD1,RD2, Mux1output, ALUOut, DataOutput, shiftoutput,Mux10output;
wire [31:0] RD, PC, PCPlus4;
wire [31:0] branchaddress,PCinput;
wire [3:0] Control; 
wire [1:0] Aluop,MemtoReg;
wire [31:0]PCaddress;
wire f1,f2,funct7;
wire [4:0] R1,R2,W1;
wire [2:0] funct3;
assign funct7 = RD[30];
assign funct3 = RD[14:12];
assign R1 = RD[19:15];
assign R2 = RD[24:20];
assign W1 = RD[11:7];
MUX #(32)M9(PCaddress,ALUOut[31:0],jump,PCinput);
PCCounter P1(clk,rst,PCinput,PC);
adder A1(PC,PCPlus4);
instructionmemory I1(PC,RD);
mainController M1(RD[6:0],ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,jump,Asel,Aluop);
Registerfile RG1(clk,RegWrite,R1,R2,W1,Writedata,RD1,RD2);
immediategeneration S1(RD[31:0],immediateout);
MUX #(64)M4(RD2,immediateout,ALUSrc,Mux1output);
ALUControl A3(Aluop,funct7,funct3,Control);
MUX #(64)M10(RD1,PC,Asel,Mux10output);
assign d = {{32{Mux10output[31]}},Mux10output[31:0]};
ALU A2(Control,d,Mux1output,ALUOut,Zero,f1,f2,overflow);
DataMemory D1(clk,MemWrite,MemRead,ALUOut,RD2,DataOutput);
assign e = {{32{PCPlus4[31]}},PCPlus4[31:0]};
MUX1 #(64)M2(ALUOut,DataOutput,e,MemtoReg,Writedata);
BranchValid B1(Branch,Zero,f1,f2,Aluop,funct3,branchvalid);
shift S12(immediateout,shiftoutput);
add A23(PC,shiftoutput[31:0],branchaddress);
MUX #(32)M3(PCPlus4,branchaddress,branchvalid,PCaddress);
endmodule

