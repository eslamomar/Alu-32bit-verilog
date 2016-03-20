module ALU (
//inputs
input  [31:0]a,
input  [31:0]b,
input  [2:0]f,
//outputs
output [31:0]y,
output  zero
);

reg [31:0]x;
reg z;
//________________________________________________
// y output
always @(*)
case(f) 
0: x=a&b;
1: x=a|b;
2: x=a+b;
6: x=a-b;
7: x=(a<b)?'h00000001:'h00000000;
default : $display("Error in control signal"); 
endcase
//________________________________________________
//zero flag
always@(*)
if (x=='h00000000)
assign z=1;
else
assign z=0; 
//________________________________________________
assign zero=z;
assign y=x;
//________________________________________________
endmodule 