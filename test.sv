import Test_registry_pkg::*;
import Test_base_pkg::*;
import Test_good_pkg::*;
import Test_v3_pkg::*;
import Test_bad_pkg::*;

program automatic test;
   Test_base tb;
   Test_good good_test = new();
   Test_bad bsd_test = new();
   Test_v3 v3_test = new();

   initial begin
      tb = Test_registry::get_test();
      tb.run_test();
   end
endprogram
