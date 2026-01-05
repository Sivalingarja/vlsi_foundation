module mux_2to1 (
    input a,
    input b,
    input sel,
    output reg out // Fixed: 1-bit reg (removed [3:0])
);

    // Fixed: Combinational logic uses @(*), NO posedge
    always @(*) begin 
        
        if (sel == 1) // Fixed: Use == for comparison
            out = b;
        else
            out = a;
            
    end // Fixed: Added 'end' (You got this one right!)
endmodule
