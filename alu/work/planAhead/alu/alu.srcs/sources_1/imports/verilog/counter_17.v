/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = $clog2(TOTAL_CASES)
     DIV = 26
     TOP = TOTAL_CASES
     UP = 1
*/
module counter_17 (
    input clk,
    input rst,
    output reg [4:0] value
  );
  
  localparam SIZE = 3'h5;
  localparam DIV = 5'h1a;
  localparam TOP = 5'h1c;
  localparam UP = 1'h1;
  
  
  reg [30:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 31'h73ffffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[26+4-:5];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h1 && M_ctr_q == 31'h73ffffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h1 && M_ctr_q == 1'h0) begin
        M_ctr_d = 31'h73ffffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
