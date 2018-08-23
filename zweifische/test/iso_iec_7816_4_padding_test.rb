require "test_helper"

class ISOIEC78164PaddingTest < Minitest::Test
  def test_pad_4
    assert_equal bytes("leet\x80\x00\x00\x00"), "leet" + Zweifische::ISOIEC78164Padding.pad(4)
  end

  def test_pad_1
    assert_equal bytes("leet\x80"), "leet" + Zweifische::ISOIEC78164Padding.pad(1)
  end

  def test_pad_0
    assert_equal "leet", "leet" + Zweifische::ISOIEC78164Padding.pad(0)
  end

  def test_pad_15
    assert_equal(bytes("\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"),
                 Zweifische::ISOIEC78164Padding.pad(15))
  end

  # maximum length of pad is 15 bytes
  def test_pad_16
    assert_raises(ArgumentError) { Zweifische::ISOIEC78164Padding.pad(16) }
  end

  def test_unpad_4
    assert_equal "leet", Zweifische::ISOIEC78164Padding.unpad(bytes "leet\x80\x00\x00\x00")
  end

  def test_unpad_1
    assert_equal "leet", Zweifische::ISOIEC78164Padding.unpad(bytes "leet\x80")
  end

  def test_unpad_0
    assert_equal "leet", Zweifische::ISOIEC78164Padding.unpad("leet")
  end

  def test_unpad_16
    assert_equal("leet",
      Zweifische::ISOIEC78164Padding
      .unpad(bytes("leet\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")))
  end

  # wont unpad if pad more than 16 bytes
  # (implementation limitation)
  def teset_unpad_20
    assert_equal(bytes("leet\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"),
      Zweifische::ISOIEC78164Padding
      .unpad(bytes("leet\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")))
  end
end
