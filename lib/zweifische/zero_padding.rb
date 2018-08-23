module Zweifische
  class ZeroPadding
    def self.pad(num)
      raise ArgumentError.new("max pad is 16 bytes") if num > 15 || num < 0
      0x00.chr * num
    end

    def self.unpad(text)
      text.gsub(/\x00+\z/, "")
    end
  end
end
