`timescale 1ns / 1ps

module TrafficLightController_tb;

    // Testbench signals
    reg clk_100MHz;
    wire [6:0] segments;
    wire [3:0] anode;

    // Instantiate the DUT (Device Under Test)
    TrafficLightController dut (
        .clk_100MHz(clk_100MHz),
        .segments(segments),
        .anode(anode)
    );
    
    // Generate 100 MHz clock (10 ns period)
    initial clk_100MHz = 0;
    
    always #5 clk_100MHz = ~clk_100MHz;


    // Monitor outputs
    initial begin
        $display("Time\tAnode\tSegments");
        $monitor("%0t\t%b\t%b", $time, anode, segments);
    end

    // Run simulation f=0or a short time
    initial begin
        #100000;  // Run for 100,000 ns = 100 us
        $finish;
    end

endmodule
