
module tb;


  reg [31:0] a;
  reg [31:0] b;
  reg [2:0] alu_ctrl;
  wire [31:0] result;
  wire zero;

  // or ALU dut1(.a(a),.b(b), .alu_ctrl(alu_ctrl), .result(result), .zero(zero));
  ALU dut1(.a,.b, .alu_ctrl, .result, .zero);
  initial begin 


    $monitor("a= %b  b= %b  alu_ctrl= %b result=%b zero=%b",a,b,alu_ctrl,result,zero);
    $dumpfile("alu.vcd");
    $dumpvars(0,tb);

    a= 'd2;
    b='d3;
    alu_ctrl='d0;
    #10;

    if(result == 'd5)
      $display("pass");
    else
      $display("fail");




    a= 'd1;
    b='d3;
    alu_ctrl='d1;
    #10;

    if(result [1:0] == 'b10)
      $display("pass");
    else
      $display("fail");


    a= 'd3;
    b='d1;
    alu_ctrl='d2;
    #10;

    if(result[1:0] == 'b01)
      $display("pass");
    else
      $display("fail");


    a= 'd2;
    b='d0;
    alu_ctrl='d3;
    #10;

    if(result[1:0] == 'b10)
      $display("pass");
    else
      $display("fail");



    a= 'd2;
    b='d3;
    alu_ctrl='d4;
    #10;

    if(result == 'b1)
      $display("pass");
    else
      $display("fail");

    a= 'd5;
    b='d3;
    alu_ctrl='d4;
    #10;

    if(result == 'b0)
      $display("pass");
    else
      $display("fail");



    #10 $finish;

  end




endmodule : tb

