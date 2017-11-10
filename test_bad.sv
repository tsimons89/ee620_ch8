import TestRegistry_pkg::*;
class TestBad extends TestBase;
   function new();
      env = new();
      TestRegistry::register("TestBad",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_config();
      env.build();
      begin
	 PacketBad bad = new();
	 env.gen.blueprint = bad;
      end
      env.run();
      env.wrap_up();
   endtask
endclass // TestBad

TestBad TestBad_handel = new();

