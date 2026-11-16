module memory_8bit (
    input wire clk,
    input wire we,
    input wire [3:0] addr,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] mem [0:15];

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data_in;
            data_out <= data_in;
        end
        else begin
            data_out <= mem[addr];
        end
    end

endmodule
