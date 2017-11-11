import Test_registry_pkg::*;
class Test_good extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_good",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_config();
      env.build();
      env.run();
      env.wrap_up();
   endtask
endclass // Test_good

Test_good Test_good_handel = new();

