/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input [4:0] io_button,
    output reg [23:0] io_led,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [63:0] answers;
  
  reg [16:0] instruction;
  
  reg [3:0] p1input;
  
  reg [3:0] p2input;
  
  reg [5:0] p1ideal;
  
  reg [5:0] p2ideal;
  
  reg dynamicRst1;
  
  reg dynamicRst2;
  
  reg p1IEn;
  
  reg p2IEn;
  
  reg p1IData;
  
  reg p2IData;
  
  reg [3:0] p1TestInp;
  
  reg [3:0] p2TestInp;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_left_cond_out;
  reg [1-1:0] M_left_cond_in;
  button_conditioner_2 left_cond (
    .clk(clk),
    .in(M_left_cond_in),
    .out(M_left_cond_out)
  );
  wire [1-1:0] M_right_cond_out;
  reg [1-1:0] M_right_cond_in;
  button_conditioner_2 right_cond (
    .clk(clk),
    .in(M_right_cond_in),
    .out(M_right_cond_out)
  );
  wire [1-1:0] M_up_cond_out;
  reg [1-1:0] M_up_cond_in;
  button_conditioner_2 up_cond (
    .clk(clk),
    .in(M_up_cond_in),
    .out(M_up_cond_out)
  );
  wire [1-1:0] M_down_cond_out;
  reg [1-1:0] M_down_cond_in;
  button_conditioner_2 down_cond (
    .clk(clk),
    .in(M_down_cond_in),
    .out(M_down_cond_out)
  );
  wire [1-1:0] M_center_cond_out;
  reg [1-1:0] M_center_cond_in;
  button_conditioner_2 center_cond (
    .clk(clk),
    .in(M_center_cond_in),
    .out(M_center_cond_out)
  );
  wire [1-1:0] M_center_detect_out;
  reg [1-1:0] M_center_detect_in;
  edge_detector_7 center_detect (
    .clk(clk),
    .in(M_center_detect_in),
    .out(M_center_detect_out)
  );
  localparam WAIT_state = 4'd0;
  localparam CHECKZERO_state = 4'd1;
  localparam CHECKZEROI_state = 4'd2;
  localparam CHECKANS_state = 4'd3;
  localparam CHECKANSI_state = 4'd4;
  localparam SCOREMINUS_state = 4'd5;
  localparam SCOREPLUS_state = 4'd6;
  localparam CHECKWIN_state = 4'd7;
  localparam CHECKSCOREZERO_state = 4'd8;
  localparam CHECKWINI_state = 4'd9;
  localparam CHECKSCOREZEROI_state = 4'd10;
  localparam WIN_state = 4'd11;
  
  reg [3:0] M_state_d, M_state_q = WAIT_state;
  localparam P1_player = 1'd0;
  localparam P2_player = 1'd1;
  
  reg M_player_d, M_player_q = P1_player;
  wire [1-1:0] M_p1Interim_out;
  register_8 p1Interim (
    .clk(clk),
    .rst(rst),
    .en(p1IEn),
    .data(p1IData),
    .out(M_p1Interim_out)
  );
  wire [1-1:0] M_p2Interim_out;
  register_8 p2Interim (
    .clk(clk),
    .rst(rst),
    .en(p2IEn),
    .data(p2IData),
    .out(M_p2Interim_out)
  );
  wire [16-1:0] M_cpu16_out;
  wire [16-1:0] M_cpu16_s1;
  wire [16-1:0] M_cpu16_s2;
  cpu_10 cpu16 (
    .clk(clk),
    .rst(rst),
    .instr(instruction),
    .p1_button(p1TestInp),
    .p2_button(p2TestInp),
    .out(M_cpu16_out),
    .s1(M_cpu16_s1),
    .s2(M_cpu16_s2)
  );
  wire [1-1:0] M_counter1_value;
  counter_11 counter1 (
    .clk(clk),
    .rst(dynamicRst1),
    .value(M_counter1_value)
  );
  wire [1-1:0] M_counter2_value;
  counter_11 counter2 (
    .clk(clk),
    .rst(dynamicRst2),
    .value(M_counter2_value)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_player_d = M_player_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    answers = 64'h2313132131213213;
    p1ideal = {2'h0, answers[(M_cpu16_s1)*4+3-:4]};
    p2ideal = {2'h0, answers[(M_cpu16_s2)*4+3-:4]};
    M_left_cond_in = io_button[3+0-:1];
    M_right_cond_in = io_button[4+0-:1];
    M_up_cond_in = io_button[0+0-:1];
    M_down_cond_in = io_button[2+0-:1];
    M_center_cond_in = io_button[1+0-:1];
    M_center_detect_in = M_center_cond_out;
    p1TestInp = {2'h0, M_left_cond_out, M_down_cond_out};
    p2TestInp = {2'h0, M_up_cond_out, M_right_cond_out};
    io_led = 1'h0;
    io_led[16+7-:8] = M_cpu16_s1;
    io_led[8+7-:8] = M_cpu16_s2;
    io_led[4+3-:4] = answers[(M_cpu16_s1)*4+3-:4];
    io_led[0+3-:4] = answers[(M_cpu16_s2)*4+3-:4];
    dynamicRst1 = 1'h0;
    dynamicRst2 = 1'h0;
    p1IEn = 1'h0;
    p2IEn = 1'h0;
    p1IData = 1'h0;
    p2IData = 1'h0;
    instruction = 17'h1ffff;
    
    case (M_state_q)
      WAIT_state: begin
        io_led[0+23-:24] = 24'hffffff;
        if (M_center_detect_out) begin
          M_state_d = CHECKZERO_state;
        end
      end
      CHECKZERO_state: begin
        
        case (M_player_q)
          P1_player: begin
            instruction = 17'h0c033;
          end
          P2_player: begin
            instruction = 17'h10033;
          end
        endcase
        M_state_d = CHECKZEROI_state;
      end
      CHECKZEROI_state: begin
        
        case (M_player_q)
          P1_player: begin
            if (M_cpu16_out) begin
              p1IEn = 1'h1;
              p1IData = 1'h0;
              dynamicRst1 = 1'h1;
              M_player_d = P2_player;
              M_state_d = CHECKZERO_state;
            end else begin
              if (M_p1Interim_out) begin
                M_state_d = CHECKZERO_state;
                M_player_d = P2_player;
              end else begin
                M_state_d = CHECKANS_state;
              end
            end
          end
          P2_player: begin
            if (M_cpu16_out) begin
              p2IEn = 1'h1;
              p2IData = 1'h0;
              dynamicRst2 = 1'h1;
              M_player_d = P1_player;
              M_state_d = CHECKZERO_state;
            end else begin
              if (M_p2Interim_out) begin
                M_state_d = CHECKZERO_state;
                M_player_d = P1_player;
              end else begin
                M_state_d = CHECKANS_state;
              end
            end
          end
        endcase
      end
      CHECKANS_state: begin
        
        case (M_player_q)
          P1_player: begin
            instruction = {3'h3, 2'h0, p1ideal, 6'h33};
          end
          P2_player: begin
            instruction = {3'h4, 2'h0, p2ideal, 6'h33};
          end
        endcase
        M_state_d = CHECKANSI_state;
      end
      CHECKANSI_state: begin
        
        case (M_player_q)
          P1_player: begin
            if (M_cpu16_out) begin
              M_state_d = SCOREPLUS_state;
            end else begin
              if (M_counter1_value) begin
                M_state_d = CHECKSCOREZERO_state;
              end else begin
                M_player_d = P2_player;
                M_state_d = CHECKZERO_state;
              end
            end
          end
          P2_player: begin
            if (M_cpu16_out) begin
              M_state_d = SCOREPLUS_state;
            end else begin
              if (M_counter2_value) begin
                M_state_d = CHECKSCOREZERO_state;
              end else begin
                M_player_d = P1_player;
                M_state_d = CHECKZERO_state;
              end
            end
          end
        endcase
      end
      SCOREPLUS_state: begin
        
        case (M_player_q)
          P1_player: begin
            instruction = 17'h05040;
            p1IEn = 1'h1;
            p1IData = 1'h1;
            M_state_d = CHECKWIN_state;
          end
          P2_player: begin
            instruction = 17'h0a040;
            p2IEn = 1'h1;
            p2IData = 1'h1;
            M_state_d = CHECKWIN_state;
          end
        endcase
      end
      CHECKWIN_state: begin
        
        case (M_player_q)
          P1_player: begin
            instruction = 17'h04433;
          end
          P2_player: begin
            instruction = 17'h08433;
          end
        endcase
        M_state_d = CHECKWINI_state;
      end
      CHECKWINI_state: begin
        
        case (M_player_q)
          P1_player: begin
            if (M_cpu16_out) begin
              M_state_d = WIN_state;
            end else begin
              M_player_d = P2_player;
              M_state_d = CHECKZERO_state;
            end
          end
          P2_player: begin
            if (M_cpu16_out) begin
              M_state_d = WIN_state;
            end else begin
              M_player_d = P1_player;
              M_state_d = CHECKZERO_state;
            end
          end
        endcase
      end
      WIN_state: begin
        
        case (M_player_q)
          P1_player: begin
            io_led[16+7-:8] = 8'hff;
          end
          P2_player: begin
            io_led[0+7-:8] = 8'hff;
          end
        endcase
      end
      CHECKSCOREZERO_state: begin
        
        case (M_player_q)
          P1_player: begin
            instruction = 17'h04033;
            M_state_d = CHECKSCOREZEROI_state;
          end
          P2_player: begin
            instruction = 17'h08033;
            M_state_d = CHECKSCOREZEROI_state;
          end
        endcase
      end
      CHECKSCOREZEROI_state: begin
        
        case (M_player_q)
          P1_player: begin
            if (M_cpu16_out) begin
              M_player_d = P2_player;
              M_state_d = CHECKZERO_state;
            end else begin
              M_state_d = SCOREMINUS_state;
            end
          end
          P2_player: begin
            if (M_cpu16_out) begin
              M_player_d = P1_player;
              M_state_d = CHECKZERO_state;
            end else begin
              M_state_d = SCOREMINUS_state;
            end
          end
        endcase
      end
      SCOREMINUS_state: begin
        
        case (M_player_q)
          P1_player: begin
            instruction = 17'h05041;
            p1IEn = 1'h1;
            p1IData = 1'h1;
            M_state_d = CHECKZERO_state;
            M_player_d = P2_player;
          end
          P2_player: begin
            instruction = 17'h0a041;
            p2IEn = 1'h1;
            p2IData = 1'h1;
            M_state_d = CHECKZERO_state;
            M_player_d = P1_player;
          end
        endcase
      end
    endcase
    led = {M_counter1_value, M_counter2_value, M_p1Interim_out, M_p2Interim_out};
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
      M_player_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
      M_player_q <= M_player_d;
    end
  end
  
endmodule
