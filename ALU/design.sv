
module ALU (

  input[31:0] a,
  input [31:0] b,
  input  [2:0] alu_ctrl,
  output reg [31:0] result,
  output reg zero

);
  
  always @(*) begin

    case(alu_ctrl)

      3'b000: result = a+b;
      3'b001: result = a-b;
      3'b010: result = a&b;
      3'b011: result = a|b;
      3'b100:if($signed(a)<$signed(b)) begin
         result = 32'b1;
      end
      else
        begin
         result=32'b0;
        end
      default:result = 32'b0;


      endcase
    
    if(result == 32'b0)
      zero = 1'b1;
    else
      zero = 1'b0;
    end


      endmodule : ALU