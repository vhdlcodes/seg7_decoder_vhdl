///////////////////////////////////////////////////////////////////////////
//
//  Project          : Simple 7-seg decoder
//  File Name        : seg7_decoder_tb.sv
//  Created By       : Prasad Pandit
//  Contact          : prasadp4009@gmail.com
//  Last Modified    : 09/17/2018
//  Revision History : 1v0
//  ------------
//  Description      : Testing simple 7-seg decoder for 4-bit binary input
//
////////////////////////////////////////////////////////////////////////////

`ifndef SEG7_DECODER_TB__SV
`define SEG7_DECODER_TB__SV

`timescale 1ns/100ps

module seg7_decoder_tb;

  logic [3:0] d_in;
  logic [6:0] d_out;

  int i=0;

  seg7_decoder #(.seg_type(1))  DUT   (
                                        .d_in(d_in),
                                        .d_out(d_out)
                                      );

  initial
  begin
    for(i = 0; i < 16; i++)
    begin
      d_in = i[3:0];
      #10;
      $display ("\n\tInput = %04b, Output = %07b", d_in, d_out);
    end
    //$display("Starting Test");
    #10 $finish;
  end
endmodule : seg7_decoder_tb

`endif

//End of seg7_decoder_tb
