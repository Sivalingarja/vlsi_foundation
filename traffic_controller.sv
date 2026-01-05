module traffic_light_controller (
    input clk,
    input reset,
    output reg [2:0] north_light, // 3 bits: Red, Yellow, Green
    output reg [2:0] east_light
);
    // Define States using readable names (Parameters)
    parameter [1:0] NORTH_G = 2'b00, // North Green
                    NORTH_Y = 2'b01, // North Yellow
                    EAST_G  = 2'b10, // East Green
                    EAST_Y  = 2'b11; // East Yellow

    reg [1:0] state, next_state;
    reg [3:0] timer; // A 4-bit timer to count seconds

    // 1. STATE MEMORY (Sequential Logic)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= NORTH_G;
            timer <= 0;
        end else begin
            // Move to next state only if timer hits limit
            if (timer == 4'd10) begin // Change light every 10 clocks
                state <= next_state;
                timer <= 0; // Reset timer
            end else begin
                timer <= timer + 1; // Keep counting
            end
        end
    end

    // 2. NEXT STATE LOGIC (Combinational Logic)
    // This decides "Where do we go next?"
    always @(*) begin
        case (state)
            NORTH_G: next_state = NORTH_Y;
            NORTH_Y: next_state = EAST_G;
            EAST_G:  next_state = EAST_Y;
            EAST_Y:  next_state = NORTH_G;
            default: next_state = NORTH_G;
        endcase
    end

    // 3. OUTPUT LOGIC (Combinational Logic)
    // 3'b100 = Red, 3'b010 = Yellow, 3'b001 = Green
    always @(*) begin
        // Default Red/Red to stay safe
        north_light = 3'b100; 
        east_light  = 3'b100;
        
        case (state)
            NORTH_G: begin
                north_light = 3'b001; // North Green
                east_light  = 3'b100; // East Red
            end
            NORTH_Y: begin
                north_light = 3'b010; // North Yellow
                east_light  = 3'b100; // East Red
            end
            EAST_G: begin
                north_light = 3'b100; // North Red
                east_light  = 3'b001; // East Green
            end
            EAST_Y: begin
                north_light = 3'b100; // North Red
                east_light  = 3'b010; // East Yellow
            end
        endcase
    end
endmodule
