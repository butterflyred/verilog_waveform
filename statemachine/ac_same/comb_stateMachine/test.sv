module test(
	input w,
	input clk,rst,
	output reg z
);
	enum reg [2:0] { 
		A=3'b000,
		B=3'b001,
		C=3'b010,
		D=3'b011,
		E=3'b100,
		F=3'b101
	} cs,ns;

	// output logic
	always_comb begin
		case (cs)
			A : begin
				z = 0;

			end 
			B : begin
				z = 0;

			end 
			C : begin
				z = 0;

			end 
			D : begin
				z = 1;

			end 
			E : begin
				z = 0;

			end 
			F : begin
				z = 1;

			end 
			default: begin
				z  = 0;
			end
		endcase
		
	end
	// ff
	always @(posedge clk, negedge rst) begin
		if ( !rst ) cs <= 3;
		else cs <= ns;
	end
	// ns
	always_comb begin
		case (cs)
			A : begin
				if ( w == 0 ) begin
					ns = A;
				end else begin
					ns = B;
				end

			end 
			B : begin
				if ( w == 0 ) begin
					ns = E;
				end else begin
					ns = C;
				end

			end 
			C : begin
				if ( w == 0 ) begin
					ns = D;
				end else begin
					ns = C;
				end

			end 
			D : begin
				if ( w == 0 ) begin
					ns = A;
				end else begin
					ns = F;
				end

			end 
			E : begin
				if ( w == 0 ) begin
					ns = A;
				end else begin
					ns = F;
				end

			end 
			F : begin
				if ( w == 0 ) begin
					ns = E;
				end else begin
					ns = C;
				end

			end 
			default: begin
				ns = A;
			end
		endcase
	end
endmodule
