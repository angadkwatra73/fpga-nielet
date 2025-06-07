module SevenSegmentEncoder (
    input [1:0] fsm_state,                 // FSM state from signalFSM
    output reg [27:0] seg_data_flat        // Flattened 4-digit 7-segment output (4 x 7 = 28 bits)
);

    reg [6:0] seg_data [3:0];              // Internal 2D array for digit segments

    always @(*) begin
        case (fsm_state)
            2'b00: begin // "STOP"
                seg_data[3] = ~7'b01101101; // 'S'
                seg_data[2] = ~7'b01111000; // 'T'
                seg_data[1] = ~7'b00111111; // 'O'
                seg_data[0] = ~7'b01110011; // 'P'
            end

            2'b01: begin // "----"
                seg_data[3] = ~7'b01000000;
                seg_data[2] = ~7'b01000000;
                seg_data[1] = ~7'b01000000;
                seg_data[0] = ~7'b01000000;
            end

            2'b10: begin // "--GO"
                seg_data[3] = ~7'b00000000; // blank
                seg_data[2] = ~7'b00111101; // 'G'
                seg_data[1] = ~7'b00111111; // 'O'
                seg_data[0] = ~7'b00000000; // blank
            end

            default: begin // blank all
                seg_data[3] = ~7'b00000000;
                seg_data[2] = ~7'b00000000;
                seg_data[1] = ~7'b00000000;
                seg_data[0] = ~7'b00000000;
            end
        endcase
    end

    // Pack into flattened output
    always @(*) begin
        seg_data_flat = {seg_data[3], seg_data[2], seg_data[1], seg_data[0]};
    end

endmodule
