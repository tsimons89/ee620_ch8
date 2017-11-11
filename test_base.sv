package Test_base_pkg;
   import Enviromnet_pkg::*;
   
virtual class Test_base;
   
   Environment env;
   
   pure virtual task run_test();
   
   function new();
      env = new();
   endfunction
endclass // Test_base
   
endpackage
