`timescale 1ns/1ps

module fifo_tb;

  reg clk, rst, wr_en, rd_en;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire empty, full;
  wire [6:0] counter;

  // Instantiate FIFO
  fifo uut (
    .data_in(data_in),
    .data_out(data_out),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .clk(clk),
    .rst(rst),
    .empty(empty),
    .full(full),
    .counter(counter)
  );

  // Clock generation
  always #5 clk = ~clk;  // 100MHz clock

  initial begin
    $dumpfile("fifo.vcd");     // If using GTKWave
    $dumpvars(0, fifo_tb);

    $display("Starting FIFO Testbench...");
    $monitor("Time=%0t | clk=%b rst=%b wr_en=%b rd_en=%b data_in=%h data_out=%h empty=%b full=%b counter=%d",
             $time, clk, rst, wr_en, rd_en, data_in, data_out, empty, full, counter);

    // Initialize
    clk = 0; rst = 1; wr_en = 0; rd_en = 0; data_in = 0;

    // Apply reset
    #10 rst = 0;

    // Write 5 values
    repeat(12) begin
      @(posedge clk);
      wr_en = 1;
      data_in = data_in + 8'h11;
    end
    @(posedge clk);
    wr_en = 0;

    // Wait a few cycles
    #10;

    // Read 5 values
    repeat(3) begin
      @(posedge clk);
      rd_en = 0;
    end
    @(posedge clk);
    rd_en = 0;

    // Finish simulation
    #20;
    $display("Test completed");
    $finish;
  end

endmodule

