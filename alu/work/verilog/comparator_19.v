/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     WIDTH = WIDTH
*/
module comparator_19 (
    input select0,
    input select1,
    input z,
    input v,
    input n,
    output reg [15:0] result
  );
  
  localparam WIDTH = 5'h10;
  
  
  always @* begin
    if (select1) begin
      if (select0) begin
        result[0+0-:1] = z | (n ^ v);
      end else begin
        result[0+0-:1] = n ^ v;
      end
    end else begin
      if (select0) begin
        result[0+0-:1] = z;
      end else begin
        result[0+0-:1] = 1'h0;
      end
    end
  end
endmodule
