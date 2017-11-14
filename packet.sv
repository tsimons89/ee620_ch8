package Packet_pkg;
   import Packet_base_pkg::*;
   import Header_pkg::*;
   import Payload_pkg::*;
   
class Packet extends Packet_base;

   function new();
      super.new();
   endfunction	//	new
   
   virtual function Packet_base copy();
      Packet pkt = new();
      pkt.id = id;
      pkt.header = header.copy();
      pkt.payload = payload.copy();
      return pkt;
   endfunction // copy
   
   function void display();
      $display("Contents of packet:");
      header.display();
      payload.display();
   endfunction // display
   
   virtual function void calc_header_checksum();
      header.calc_header_checksum();
   endfunction
endclass
endpackage
