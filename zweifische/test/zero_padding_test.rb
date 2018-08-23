require "test_helper"

class ZeroPaddingTest < Minitest::Test
  def test_pad_4
    assert_equal bytes("leet\x00\x00\x00\x00"), "leet" + Zweifische::ZeroPadding.pad(4)
  end

  def test_pad_1
    assert_equal bytes("leet\x00"), "leet" + Zweifische::ZeroPadding.pad(1)
  end

  def test_pad_0
    assert_equal "leet", "leet" + Zweifische::ZeroPadding.pad(0)
  end

  def test_pad_15
    assert_equal(bytes("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"),
                 Zweifische::ZeroPadding.pad(15))
  end

  # maximum length of pad is 15 bytes
  def test_pad_16
    assert_raises(ArgumentError) { Zweifische::ZeroPadding.pad(16) }
  end

  def test_unpad_4
    assert_equal "leet", Zweifische::ZeroPadding.unpad("leet\x00\x00\x00\x00")
  end

  def test_unpad_1
    assert_equal "leet", Zweifische::ZeroPadding.unpad("leet\x00")
  end

  def test_unpad_0
    assert_equal "leet", Zweifische::ZeroPadding.unpad("leet")
  end

  def test_unpad_16
    assert_equal("leet",
      Zweifische::ZeroPadding
      .unpad("leet\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"))
  end

  # still unpad for whatever length of the pad
  # (implementation limitation)
  def test_unpad_20
    assert_equal("leet",
      Zweifische::ZeroPadding
      .unpad("leet\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"))
  end
end
