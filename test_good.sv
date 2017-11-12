package Test_good_pkg;
   import Test_registry_pkg::*;
   import Test_base_pkg::*;
class Test_good extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_good",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.build();
      env.run();
      env.wrap_up();
   endtask
endclass // Test_good
endpackage
