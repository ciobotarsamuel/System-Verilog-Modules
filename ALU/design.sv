
module ALU (

  input logic [31:0] a,
  input logic [31:0] b,
  input  logic [2:0] alu_ctrl,
  output logic [31:0] result,
  output logic zero

);

  always_comb begin

    case(alu_ctrl)

      'b000: result = a+b;
      'b001: result = a-b;
      'b010: result = a&b;
      'b011: result = a|b;
      'b100:if($signed(a)<$signed(b)) begin
        result = 'b1;
      end
      else
        begin
          result='b0;
        end
      default:result = 'b0;


    endcase

    if(result == 'b0)
      zero = 'b1;
    else
      zero = 'b0;
  end


endmodule : ALU