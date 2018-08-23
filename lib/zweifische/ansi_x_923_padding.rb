module Zweifische
  class AnsiX923Padding
    class << self
      def pad(num)
        raise ArgumentError.new("max pad is 16 bytes") if num > 15 || num < 0
        return "" if num == 0
        0x00.chr * (num - 1) + num.chr
      end

      def unpad(text)
        numpad = numpad(text)
        if assert_pad(text, numpad, 0x00.chr)
          return text[0..(-1 * (numpad + 1))]
        end
        text
      end
       
      private

      def assert_pad(text, numpad, char)
        text
          .split("")
          .reverse[1..numpad - 1]
          .all? { |c| c.eql?(char) }
      end

      def numpad(text)
        text
          .force_encoding(Encoding::ASCII_8BIT)
          .split("")
          .last
          .ord
      end
    end
  end
end
