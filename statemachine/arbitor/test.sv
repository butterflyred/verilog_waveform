module test(
	input req0,req1,
	input clk,rst,
	output reg gnt0,gnt1
);
	enum reg [2:0] { 
		IDLE=3'b000,
		GNT0=3'b001,
		GNT1=3'b010
	} cs,ns;

	// output logic
	always_comb begin
		case (cs)
			IDLE : begin
				gnt0 = 0;
				gnt1 = 0;

			end 
			GNT0 : begin
				gnt0 = 1;
				gnt1 = 0;

			end 
			GNT1 : begin
				gnt0 = 0;
				gnt1 = 1;

			end 
			default: begin
				gnt0 = 0;
				gnt1 = 0;
			end
		endcase
		
	end
	// ff
	always @(posedge clk, negedge rst) begin
		if ( !rst ) cs <= 0;
		else cs <= ns;
	end
	// ns
	always_comb begin
		case (cs)
			IDLE : begin
				if ( req0 == 1 && req1 != 1) begin
					ns = GNT0;
				end else if ( req0 != 1 && req1 == 1 ) begin
					ns = GNT1;
				end else if ( req0 == 1 && req1 == 1 ) begin
					ns = GNT0;
				end else begin
					ns = IDLE;
				end

			end 
			GNT0 : begin
				if ( req0 == 1 && req1 != 1) begin
					ns = GNT0;
				end else begin
					ns = IDLE;
				end

			end 
			GNT1 : begin
				if ( req0 != 1 && req1 == 1 ) begin
					ns = GNT1;
				end else begin
					ns = IDLE;
				end

			end 
			default: begin
				ns = IDLE;
			end
		endcase
	end
endmodule
