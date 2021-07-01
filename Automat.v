`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 03:50:20 PM
// Design Name: 
// Module Name: Automat
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


module Automat(clk, reset, B1, B5, B10, R1, R5, STICLA);
    input clk, reset, B1, B5, B10;
    output R1, R5, STICLA;
    reg R1, R5, STICLA;
    reg [2:0] currentState, nextState;
    
    //  s0 = 000 -  stare initiala
    //  s1 = 001 -  s-a introdus un leu
    //  s2 = 010 -  s-au introdus 2 lei
    //  s3 = 011 - s-au introdus 10 lei
    //  s4 = 100 -  s-au introdus 5 lei
    //  s5 = 101 - se da rest primul leu
    //  s6 = 110 -  se da rest ultimul leu
    
    always @(posedge clk)
    begin
        if (~reset)
            currentState <= nextState;
        else
            currentState <= 3'b000;
    end
    
    always @(negedge clk)
    begin
        R1 = 0;
        R5 = 0;
        STICLA = 0;
    end

    always @(currentState, B1, B5, B10)
    begin
        case(currentState)
            3'b00:begin
                if(B1)
                    nextState <= 3'b001;
                if(B5)
                    nextState <= 3'b100;
                if(B10)
                    nextState <= 3'b011;
            end
            3'b001:begin
                if(B1)
                    nextState <= 3'b010;
            end
            3'b010:begin
                if(B1)
                    nextState <= 3'b110;
            end
            3'b011:begin
                R5 <= 1;
                nextState <= 3'b100;
            end
            3'b100:begin
                R1 <= 1;
                nextState <= 3'b101;
            end
            3'b101:begin
                R1 <= 1;
                nextState <= 3'b110;
            end
            3'b110:begin
                STICLA <= 1;
                nextState <= 3'b000;
            end
            default:begin
                nextState <= 3'b000;
            end
        endcase
    end
endmodule
