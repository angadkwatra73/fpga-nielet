module PWM ( input clk_100MHz,
             input [1:0] duty_cycle,
             output pwm_wave);
             
             
             wire clk_1KHz;
             
             clockDivider clk_new ( .clk_100MHz(clk_100MHz),
                                    .clk_1KHz(clk_1KHz) );
                                    

             dutyCycle   pulse ( .duty_cycle(duty_cycle),
                                    .clk( clk_1KHz),
                                    .pwm_wave(pwm_wave)); 



endmodule       