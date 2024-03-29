/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     WIDTH = WIDTH
*/
module shifter_20 (
    input select0,
    input select1,
    input [15:0] a,
    input [3:0] b,
    output reg [15:0] result
  );
  
  localparam WIDTH = 5'h10;
  
  
  always @* begin
    if (select1) begin
      if (select0) begin
        result = $signed(a) >>> b;
      end else begin
        result = $signed(a) <<< b;
      end
    end else begin
      if (select0) begin
        result = a >> b;
      end else begin
        result = a << b;
      end
    end
  end
endmodule
