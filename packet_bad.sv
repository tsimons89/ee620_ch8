`define SV_RAND_CHECK(r) \
  do begin \
    if (!(r)) begin \
      $display("%s:%0d: Randomization failed \"%s\"", \
               `__FILE__, `__LINE__, `"r`"); \
      $finish; \
    end \
  end while (0)

package Packet_bad_pkg;
   import Packet_pkg::*;
class Packet_bad extends Packet;

   rand bit bad;
   
   function new();
      super.new();
      $display("Bad const");
   endfunction // new

   constraint bad_packet{
      bad dist {0:=1,1:=1};
   }

   virtual function void calc_header_checksum();
      header.calc_header_checksum();
      $display("bad before: %p",bad);
      `SV_RAND_CHECK(this.randomize(bad));
      $display("bad after: %p",bad);
      if(bad)
	header.header_checksum = ~header.header_checksum;
   endfunction // calc_header_checksum

endclass
endpackage
