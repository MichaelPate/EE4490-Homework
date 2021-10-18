`timescale 1ns/1ns
module tb_gameSM();
	reg t_clk, t_rst;
	reg t_paddle1, t_paddle2, t_serve;
	
	wire [4:0] t_field;
	wire t_score1, t_score2;
	
	gameSM uut(t_field, t_score1, t_score2, t_clk, t_rst, t_paddle1, t_paddle2, t_serve);
	
	initial
	begin
		$dumpfile("tb_gameSM.vcd");
		$dumpvars(0, tb_gameSM);
	end
	
	always #5 t_clk = !t_clk;
	
	initial
	begin
		t_rst = 1;
		t_clk = 0;
		t_paddle1 = 1;
		t_paddle2 = 1;
		t_serve = 0;
	end
	
	initial
	begin
		#10	t_rst = 0;
		#10 t_serve = 1;
		#30 t_serve = 0;
		#100 t_paddle1 = 0;
		#120	t_serve = 1;
		#140	t_serve = 0;
		#240	$finish;
	end
	
endmodule