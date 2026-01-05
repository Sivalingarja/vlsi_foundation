module testbench;
    reg clk, reset;
    wire [2:0] north, east;

    traffic_light_controller uut (
        .clk(clk), .reset(reset), 
        .north_light(north), .east_light(east)
    );

    always #5 clk = ~clk; // Clock generation

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;
        $monitor("Time=%0t | State=%b | Timer=%d | North=%b | East=%b", 
                 $time, uut.state, uut.timer, north, east);

        clk=0; reset=1;
        #10 reset=0; // Release reset
        
        #500; // Let it run for 500ns (enough for a few cycles)
        $finish;
    end
endmodule
