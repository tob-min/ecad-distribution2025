module twotrafficlights(
      input  logic clk,
      input  logic rst,
      output logic [2:0] lightsA, 
      output logic [2:0] lightsB
    );
  logic [2:0] state;
  
  always_ff @ (posedge clk or posedge rst) begin
    if (rst) state <= 0;
    else state <= state + 1;
  end

  always_comb begin
    lightsA[0] = state == 3'b101 ? 1 : 0;
    lightsA[1] = (state[2] == 1 && state[0] == 0) ? 1 : 0;
    lightsA[2] = (state == 3'b101 || state == 3'b110) ? 0: 1;
    lightsB[0] = state == 3'b001 ? 1: 0;
    lightsB[1] = (state[2] == 0 && state[0] == 0) ? 1: 0;
    lightsB[2] = (state == 3'b001 || state == 3'b010) ? 0: 1;
  
  end

endmodule
