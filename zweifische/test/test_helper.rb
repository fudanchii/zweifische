$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "zweifische"

require "minitest/autorun"

def bytes(input)
  input.force_encoding(Encoding::ASCII_8BIT)
end

def hexify(input)
  bytes([input].pack("H*"))
end
