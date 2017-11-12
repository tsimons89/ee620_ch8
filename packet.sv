package Packet_pkg;
   import Packet_base_pkg::*;
   import Header_pkg::*;
   import Payload_pkg::*;
   
class Packet extends Packet_base;

   function new();
      super.new();
   endfunction	//	new
   
   function Packet_base copy();
      copy = new();
      copy.header = header.copy();
      copy.payload = payload.copy();
   endfunction // copy

   virtual function Packet cpy();
      cpy = new();
      cpy.id = id;
      cpy.header = header.copy();
      cpy.payload = payload.copy();
   endfunction // copy
   
   function void display();
      $display("Contents of packet:");
      header.display();
      payload.display();
   endfunction // display
   
   virtual function void calc_header_checksum();
      // $display("Base check sum");
      header.calc_header_checksum();
   endfunction
endclass
endpackage
