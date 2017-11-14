`define SV_RAND_CHECK(r) \
  do begin \
    if (!(r)) begin \
      $display("%s:%0d: Randomization failed \"%s\"", \
               `__FILE__, `__LINE__, `"r`"); \
      $finish; \
    end \
  end while (0)

package Packet_bad_pkg;
   import Packet_base_pkg::*;
   import Packet_pkg::*;
class Packet_bad extends Packet;

   rand bit bad;
   
   function new();
      super.new();
   endfunction // new

   function Packet_base copy();
      Packet_bad pkt = new();
      pkt.bad = bad;
      pkt.id = id;
      pkt.header = header.copy();
      pkt.payload = payload.copy();
      return pkt;
   endfunction // copy

   constraint bad_packet{
      bad dist {0:=49,1:=1};
   }

   virtual function void calc_header_checksum();
      super.calc_header_checksum();
      if(bad)
	header.header_checksum = ~header.header_checksum;
   endfunction // calc_header_checksum

endclass
endpackage
