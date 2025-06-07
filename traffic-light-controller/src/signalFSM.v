module signalFSM (
    input clk_1KHz,
           // Abstracted segment output (you may remove this if using external encoder)
    output reg [1:0] fsm_state       // FSM state output
);
    
    // State Encoding
    parameter STATE_STOP = 2'd0;
    parameter STATE_DASH = 2'd1;
    parameter STATE_GO   = 2'd2;

    reg [1:0] current_state, next_state;
    reg [12:0] state_counter;

    // Duration in ms
    parameter STOP_DURATION = 13'd2000;
    parameter DASH_DURATION = 13'd2000;
    parameter GO_DURATION   = 13'd2000;

    // Initialize state
    initial begin
        current_state = STATE_STOP;
        state_counter = 0;
        fsm_state=current_state;
    end

    // State register and counter
    always @(posedge clk_1KHz) begin
        if ((current_state == STATE_STOP && state_counter == STOP_DURATION) ||
            (current_state == STATE_DASH && state_counter == DASH_DURATION) ||
            (current_state == STATE_GO   && state_counter == GO_DURATION)) begin
            current_state <= next_state;
            state_counter <= 13'd0;
        end else begin
            state_counter <= state_counter + 1;
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            STATE_STOP: next_state = STATE_DASH;
            STATE_DASH: next_state = STATE_GO;
            STATE_GO:   next_state = STATE_STOP;
            default:    next_state = STATE_STOP;
        endcase
         fsm_state = current_state;  
    end

    // Output logic
   
   

endmodule
