module Zweifische
  class PKCS7Padding < AnsiX923Padding
    def self.pad(num)
      raise ArgumentError.new("max pad is 16 bytes") if num > 15 || num < 0
      num.chr * num
    end

    def self.unpad(text)
      numpad = numpad(text)
      if assert_pad(text, numpad, numpad.chr)
        return text[0..(-1 * (numpad + 1))]
      end
      text
    end
  end
end
