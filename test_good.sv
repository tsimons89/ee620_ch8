import TestRegistry_pkg::*;
class TestGood extends TestBase;
   function new();
      env = new();
      TestRegistry::register("TestGood",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_config();
      env.build();
      env.run();
      env.wrap_up();
   endtask
endclass // TestGood

TestGood TestGood_handel = new();

