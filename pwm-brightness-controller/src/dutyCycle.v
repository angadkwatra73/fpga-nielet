`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2025 05:18:27 AM
// Design Name: 
// Module Name: dutyCycle
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


module dutyCycle(
    input [1:0] duty_cycle,
    input clk,
    output reg pwm_wave
    );
    
    reg[4:0] counter =0;
    initial pwm_wave=0;
    
    always@ ( posedge clk) begin 
        case ( duty_cycle)
            2'b00:  pwm_wave<=1;
            2'b01: begin
                   if ( counter == 5 ) begin 
                        counter<=0;
                        pwm_wave = ~ pwm_wave;
                    end else begin 
                          counter <= counter + 1;                    
                    end
                    end
            2'b10: begin
                   if ( counter == 5 ) begin 
                        counter<=0;
                        pwm_wave = ~ pwm_wave;
                    end else begin 
                    counter <= counter + 1;                    
                    end
                    end
            2'b11: pwm_wave<=0;
        endcase
       end
    
    
    
    
endmodule
