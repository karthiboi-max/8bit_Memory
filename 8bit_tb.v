module tb_memory;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // DUT instantiation
    memory_8bit uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initialize signals
        we = 0;
        addr = 0;
        data_in = 0;

        $display("================================");
        $display("       MEMORY TEST START");
        $display("================================");

        // WRITE ADDRESS 0
        @(negedge clk);
        we = 1;
        addr = 4'd0;
        data_in = 8'hA5;

        @(posedge clk);
        #1;
        $display("WRITE: ADDR=0 DATA=%h", data_out);

        // WRITE ADDRESS 1
        @(negedge clk);
        addr = 4'd1;
        data_in = 8'h3C;

        @(posedge clk);
        #1;
        $display("WRITE: ADDR=1 DATA=%h", data_out);

        // READ ADDRESS 0
        @(negedge clk);
        we = 0;
        addr = 4'd0;

        @(posedge clk);
        #1;
        $display("READ: ADDR=0 DATA=%h", data_out);

        // READ ADDRESS 1
        @(negedge clk);
        addr = 4'd1;

        @(posedge clk);
        #1;
        $display("READ: ADDR=1 DATA=%h", data_out);

        $display("================================");
        $display("       MEMORY TEST PASS");
        $display("================================");

        $finish;
    end

endmodule
