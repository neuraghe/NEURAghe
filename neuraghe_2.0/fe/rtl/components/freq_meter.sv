module freq_meter
#(
	parameter FLL_NAME = "CLK_FLL",
	parameter MAX_SAMPLE = 1024
)
(
	input clk
);
	real  past_time = 0;
	real  current_time = 0;
	real  PERIOD = 0;
	real  SAMPLES [MAX_SAMPLE];
	real  TOTAL_PERIOD = 0;
	int  unsigned counter_SAMPLES = 0;
	logic print_freq;
	integer 		FILE;

	string filename = {FLL_NAME,".log"};

	initial 
	begin
		FILE = $fopen(filename,"w");
	end

	always_ff @(posedge clk)
	begin
		current_time <= $time();
		past_time    <= current_time;
	end

	always_comb 
	begin
			PERIOD = current_time - past_time;
	end


	
	always_ff @(posedge clk)
	begin
		SAMPLES[counter_SAMPLES] <=  PERIOD;

		if(counter_SAMPLES < MAX_SAMPLE)
		begin
			counter_SAMPLES <= counter_SAMPLES+1;
			print_freq = 1'b0;
		end
		else
		begin
			print_freq = 1'b1;
			counter_SAMPLES <= 0;
		end
	end

	always_comb 
	begin
		if(print_freq)
		begin
			TOTAL_PERIOD = 0;
			for (int i = 0; i < MAX_SAMPLE; i++) begin
				TOTAL_PERIOD = TOTAL_PERIOD + SAMPLES[i];
			end
			$fdisplay(FILE, "[%s  Frequecy]  is %f [MHz]\t @ %t [ns]" , FLL_NAME, (1000.0*1000.0*MAX_SAMPLE/(TOTAL_PERIOD)), $time()/1000.0);
			$fflush(FILE);
		end
	
	end




endmodule // freq_meter