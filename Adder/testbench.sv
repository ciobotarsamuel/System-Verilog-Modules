module tb;
  
   logic [31:0] a;
  logic [31:0] b;
  logic [31:0] out;
  
  adder dut(.*);
  
  initial begin 
    
    $monitor("a= %d  , b= %d , out= %d",a,b,out);
    $dumpfile("sim.vcd");
    $dumpvars(0,tb);
    
    a= 'd0;
    b= 'd0;
    #10
    
     a= -'d1;
    b= 'd1;
    #10
    
    a= 'hFFFFFFFC;
    b= 'd20;
    
    #10
    
     a= 'hFFFFFFFF;
    b= 'd1;
    
    #10
    
     a= 'd1000;
    b= 'd1000;
    
    #10 $finish;
    
    
  end
  
  
  
endmodule : tb