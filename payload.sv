package Payload_pkg;
   
class Payload;
   rand bit [63:0] payload;

   function Payload copy();
      copy = new this;
   endfunction // copy

   function void display();
      $display("Payload: %h",payload);
   endfunction
endclass

endpackage
