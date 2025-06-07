module displayMux (
    input clk,
    input wire [27:0] seg_data_flat,     // Flattened 4x7 segment data
    output reg [6:0] segments,           // Segment output (a-g)
    output reg [3:0] anode               // Active-low anode control
);

    reg [1:0] toggle = 2'b00;

    // Extract individual 7-bit segment values from flat input
    wire [6:0] seg0 = seg_data_flat[6:0];
    wire [6:0] seg1 = seg_data_flat[13:7];
    wire [6:0] seg2 = seg_data_flat[20:14];
    wire [6:0] seg3 = seg_data_flat[27:21];

    // Toggle through 4 digits on every clock cycle
    always @(posedge clk) begin
        toggle <= toggle + 1;
    end

    always @(*) begin
        case (toggle)
            2'b00: begin
                segments = seg0;
                anode = 4'b1110;
            end
            2'b01: begin
                segments = seg1;
                anode = 4'b1101;
            end
            2'b10: begin
                segments = seg2;
                anode = 4'b1011;
            end
            2'b11: begin
                segments = seg3;
                anode = 4'b0111;
            end
        endcase
    end

endmodule
