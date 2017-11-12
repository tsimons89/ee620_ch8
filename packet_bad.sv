package Packet_bad_pkg;
   import Packet_pkg::*;
class Packet_bad extends Packet;

   bit bad;
   
   function new();
      super.new();
   endfunction // new

   constraint bad_packet{
      bad dist {0:=49,1:=1};
   }

   virtual function void calc_header_checksum();
      header.calc_header_checksum();
      if(bad)
	header.header_checksum = ~header.header_checksum;
   endfunction

endclass
endpackage
