import Test_registry_pkg::*;

program automatic test;
   Test_base tb;
   initial begin
      tb = Test_registry::get_test();
      tb.run_test();
   end
endprogram
