module tb_adder;

  reg [31:0] a;
  reg [31:0] b;
  reg cin;
  wire [31:0] sum;
  wire cout;

  adder dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_adder);

    // Test case 1
    a = 32'h00000001; b = 32'h00000001; cin = 0; #10;
    if (sum !== 32'h00000002 || cout !== 0) begin $display("TB_FAIL: Test case 1 failed"); $finish; end

    // Test case 2
    a = 32'hFFFFFFFF; b = 32'h00000001; cin = 0; #10;
    if (sum !== 32'h00000000 || cout !== 1) begin $display("TB_FAIL: Test case 2 failed"); $finish; end

    // Test case 3
    a = 32'h12345678; b = 32'h87654321; cin = 0; #10;
    if (sum !== 32'h99999999 || cout !== 0) begin $display("TB_FAIL: Test case 3 failed"); $finish; end

    // Test case 4
    a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; cin = 1; #10;
    if (sum !== 32'hFFFFFFFF || cout !== 1) begin $display("TB_FAIL: Test case 4 failed"); $finish; end

    // Test case 5 (added to verify carry out)
    a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; cin = 0; #10;
    if (sum !== 32'hFFFFFFFE || cout !== 1) begin $display("TB_FAIL: Test case 5 failed"); $finish; end

    $display("TB_PASS");
    $finish;
  end

  initial #20000 begin $display("TB_FAIL: timeout"); $finish; end

endmodule