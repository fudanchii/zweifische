module Zweifische
  class ISOIEC78164Padding
    def self.pad(num)
      raise ArgumentError.new("max pad is 16 bytes") if num > 15 || num < 0
      return "" if num == 0
      0x80.chr + (0x00.chr * (num - 1))
    end

    def self.unpad(text)
      wpad = text.split("").reverse[0..15]
      count = wpad.each_with_index do |ch, idx|
        return text if ch != 0.chr && ch != 0x80.chr
        break idx if ch == 0x80.chr
      end
      text[0..(-1 * (count + 2))]
    end
  end
end
