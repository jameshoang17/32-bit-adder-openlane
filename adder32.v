module full_adder (input a, input b, input cin, output sum, output cout);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module adder #(parameter WIDTH = 32) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input cin,
  output [WIDTH-1:0] sum,
  output cout
);

  wire [WIDTH:0] carry;
  assign carry[0] = cin;

  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1) begin: adder_loop
      full_adder fa (
        .a(a[i]),
        .b(b[i]),
        .cin(carry[i]),
        .sum(sum[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate

  assign cout = carry[WIDTH];

endmodule