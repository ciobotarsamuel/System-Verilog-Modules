
module tb;


  reg [31:0] a;
  reg [31:0] b;
  reg [2:0] alu_ctrl;
  wire [31:0] result;
  wire zero;

  ALU dut1(.a(a),.b(b), .alu_ctrl(alu_ctrl), .result(result), .zero(zero));

  initial begin 


    $monitor("a= %b  b= %b  alu_ctrl= %b result=%b zero=%b",a,b,alu_ctrl,result,zero);
    $dumpfile("alu.vcd");
    $dumpvars(0,tb);

    a= 32'd2;
    b=32'd3;
    alu_ctrl=3'd0;
    #10;
    
    if(result == 32'd5)
      $display("pass");
      else
        $display("fail");
        
    
    

    a= 32'd1;
    b=32'd3;
    alu_ctrl=3'd1;
     #10;
    
    if(result [1:0] == 2'b10)
      $display("pass");
      else
        $display("fail");
        
    
    a= 32'd3;
    b=32'd1;
    alu_ctrl=3'd2;
     #10;
    
    if(result[1:0] == 2'b01)
      $display("pass");
      else
        $display("fail");
        
    
    a= 32'd2;
    b=32'd0;
    alu_ctrl=3'd3;
        #10;
    
    if(result[1:0] == 2'b10)
      $display("pass");
      else
        $display("fail");
    
    
    
    a= 32'd2;
    b=32'd3;
    alu_ctrl=3'd4;
    #10;
    
    if(result == 32'b1)
      $display("pass");
      else
        $display("fail");
        
         a= 32'd5;
    b=32'd3;
    alu_ctrl=3'd4;
    #10;
    
    if(result == 32'b0)
      $display("pass");
      else
        $display("fail");
    
    

    #10 $finish;

  end




endmodule : tb

