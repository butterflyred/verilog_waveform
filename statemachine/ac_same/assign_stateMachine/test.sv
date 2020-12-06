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
	assign z = (cs == D || cs == F) ? 1:0;
	
	// ff
	always @(posedge clk, negedge rst) begin
		if ( !rst ) cs <= 3;
		else cs <= ns;
	end
	// ns
	assign ns = (cs == A) ? (w) ? B:A : (cs == B) ? (w) ? C:E : (cs == C) ? (w) ? C:D : (cs == D) ? (w) ? F:A : (cs == E) ? (w) ? F:A : (cs == F) ? (w) ? C:E :A;
	// always_comb begin
	// 	case (cs)
	// 		A : begin
	// 			if ( w == 0 ) begin
	// 				ns = A;
	// 			end else begin
	// 				ns = B;
	// 			end

	// 		end 
	// 		B : begin
	// 			if ( w == 0 ) begin
	// 				ns = E;
	// 			end else begin
	// 				ns = C;
	// 			end

	// 		end 
	// 		C : begin
	// 			if ( w == 0 ) begin
	// 				ns = D;
	// 			end else begin
	// 				ns = C;
	// 			end

	// 		end 
	// 		D : begin
	// 			if ( w == 0 ) begin
	// 				ns = A;
	// 			end else begin
	// 				ns = F;
	// 			end

	// 		end 
	// 		E : begin
	// 			if ( w == 0 ) begin
	// 				ns = A;
	// 			end else begin
	// 				ns = F;
	// 			end

	// 		end 
	// 		F : begin
	// 			if ( w == 0 ) begin
	// 				ns = E;
	// 			end else begin
	// 				ns = C;
	// 			end

	// 		end 
	// 		default: begin
	// 			ns = A;
	// 		end
	// 	endcase
	// end
endmodule
