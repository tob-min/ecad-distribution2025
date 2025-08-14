module tb_updowncounter
  (
   output logic 	  clk,
   output logic 	  rst,
   output logic [3:0] count
   );

   logic         up;

   initial
     begin
        clk = 1;
        rst = 1;
        // set up random to produce the same sequence each time
        //up = ($random(13) & 1) == 1;
        #15 rst = 0;
        #1000 $finish();
     end

   always #5 clk <= !clk;

   updowncounter dut(.clk(clk), .rst(rst), .up(up), .count(count));

   always @(posedge clk)
     begin
        up <= logic'($random());
        $display("%04d: rst=%1b  up=%d  count = %d", $time, rst, up, count);
	 end
endmodule
