----------------------------------------------------------------------------
--
--  Project          : Simple 7-seg decoder
--  File Name        : seg7_decoder.vhd
--  Created By       : Me
--  Contact          : prasadp4009@gmail.com
--  Last Modified    : 09/17/2018
--  Revision History : 1v0
--  ------------
--  Description      : 7-seg decoder for 4-bit binary input
--                     Decoder is configurable for both common-anode and
--                     common-cathode type 7-seg displays
--
----------------------------------------------------------------------------
--Start of seg7_decoder
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity seg7_decoder is

-- Common Anode seg_type = 1, Common Cathode seg_type = 0

generic(seg_type : integer range 0 to 1 := 1);
port (
  d_in    :   in std_logic_vector(3 downto 0);
  d_out   :   out std_logic_vector(6 downto 0)
);
end seg7_decoder;

architecture behavioral of seg7_decoder is
begin

  g_common_anode: if seg_type = 1 generate

    process(d_in)
      begin
        case d_in is
          when x"0"  => d_out<="1000000";
          when x"1"  => d_out<="1111001";
          when x"2"  => d_out<="0100100";
          when x"3"  => d_out<="0110000";
          when x"4"  => d_out<="0011001";
          when x"5"  => d_out<="0010010";
          when x"6"  => d_out<="0000010";
          when x"7"  => d_out<="1111000";
          when x"8"  => d_out<="0000000";
          when x"9"  => d_out<="0010000";
          when x"a"  => d_out<="0001000";  -- hex(a)
          when x"b"  => d_out<="0000011";  -- hex(b)
          when x"c"  => d_out<="1000110";  -- hex(c)
          when x"d"  => d_out<="0100001";  -- hex(d)
          when x"e"  => d_out<="0000110";  -- hex(e)
          when x"f"  => d_out<="0001110";  -- hex(f)
          when others=> d_out<="1111111";
      end case;
    end process;

  end generate g_common_anode;

  g_common_cathode: if seg_type = 0 generate

    process(d_in)
      begin
        case d_in is
          when x"0"  => d_out<="0111111";
          when x"1"  => d_out<="0000110";
          when x"2"  => d_out<="1011011";
          when x"3"  => d_out<="1001111";
          when x"4"  => d_out<="1100110";
          when x"5"  => d_out<="1101101";
          when x"6"  => d_out<="1111101";
          when x"7"  => d_out<="0000111";
          when x"8"  => d_out<="1111111";
          when x"9"  => d_out<="1101111";
          when x"a"  => d_out<="1110111";  -- hex(a)
          when x"b"  => d_out<="1111100";  -- hex(b)
          when x"c"  => d_out<="0111001";  -- hex(c)
          when x"d"  => d_out<="1011110";  -- hex(d)
          when x"e"  => d_out<="1111001";  -- hex(e)
          when x"f"  => d_out<="1110001";  -- hex(f)
          when others=> d_out<="0000000";
      end case;
    end process;

  end generate g_common_cathode;

end behavioral; 

--End of seg7_decoder
