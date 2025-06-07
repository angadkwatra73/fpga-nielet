`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2025 07:09:31 AM
// Design Name: 
// Module Name: PWM_optimised
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


module PWM_optimised(
    input [2:0] duty_cycle,
    input clk,
    output reg [3:0] pwm
    );
    
     reg [3:0] counter=0;
     integer i;
     always@( posedge clk) begin
     
           if ( counter == 9 ) counter <= 0;
           else   counter <= counter +1;
            
            for ( i=0; i<4 ; i= i +1) begin 
            pwm[i] = (  counter < duty_cycle ) ? 1 : 0; 
            end
       
       
        
         
         end 
endmodule

    
     










