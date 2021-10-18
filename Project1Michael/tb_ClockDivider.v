`timescale 1ns/1ns
module tb_ClockDivider();
    wire t_out;
    reg t_in;
    reg t_rst;

    ClockDivider uut(t_in, t_out, t_rst);

    initial
	begin
		$dumpfile("tb_ClockDivider.vcd");
		$dumpvars(0, tb_ClockDivider);
	end

    always #1 t_in = !t_in;

    initial
    begin
        t_rst = 0;
        t_in = 0;
    end

    initial
    begin
        #5 t_rst = 1;
        #4000 $finish;
    end
endmodule