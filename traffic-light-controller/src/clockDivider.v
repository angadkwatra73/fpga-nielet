module clockDivider (
    input clk_100MHz,
    output reg clk_1KHz
);

    reg [16:0] counter = 0;  // Enough bits to count to 99,999
    initial clk_1KHz = 0;
    always @(posedge clk_100MHz) begin
        if (counter == 17'd49999) begin
            counter <= 0;
            clk_1KHz <= ~clk_1KHz;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule