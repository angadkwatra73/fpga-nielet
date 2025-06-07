module TrafficLightController (
    input clk_100MHz,
    output [6:0] segments,     // Shared segment output (a-g)
    output [3:0] anode         // Active-low anode control
);

    // Internal wires
    wire clk_1KHz;
    wire [1:0] fsm_state;
    wire [27:0] seg_data_flat; // Flattened 4x7-bit segment data

    // 1. Clock Divider
    clockDivider clk_div_inst (
        .clk_100MHz(clk_100MHz),
        .clk_1KHz(clk_1KHz)
    );

    // 2. FSM for signal sequencing
    signalFSM fsm_inst (
        .clk_1KHz(clk_1KHz),
        .fsm_state(fsm_state)
    );

    // 3. Segment Encoder (flattened output)
    SevenSegmentEncoder encoder_inst (
        .fsm_state(fsm_state),
        .seg_data_flat(seg_data_flat)
    );

    // 4. Display Multiplexer (takes flattened data)
    displayMux mux_inst (
        .clk(clk_1KHz),
        .seg_data_flat(seg_data_flat),
        .segments(segments),
        .anode(anode)
    );

endmodule
