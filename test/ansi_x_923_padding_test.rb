require "test_helper"

class AnsiX923PaddingTest < Minitest::Test
  def test_pad_4
    assert_equal bytes("leet\x00\x00\x00\x04"), "leet" + Zweifische::AnsiX923Padding.pad(4)
  end

  def test_pad_1
    assert_equal bytes("leet\x01"), "leet" + Zweifische::AnsiX923Padding.pad(1)
  end

  def test_pad_0
    assert_equal "leet", "leet" + Zweifische::AnsiX923Padding.pad(0)
  end

  def test_pad_15
    assert_equal(bytes("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0f"),
                 Zweifische::AnsiX923Padding.pad(15))
  end

  # maximum length of pad is 15 bytes
  def test_pad_16
    assert_raises(ArgumentError) { Zweifische::AnsiX923Padding.pad(16) }
  end

  def test_unpad_4
    assert_equal "leet", Zweifische::AnsiX923Padding.unpad("leet\x00\x00\x00\x04")
  end

  def test_unpad_1
    assert_equal "leet", Zweifische::AnsiX923Padding.unpad("leet\x01")
  end

  def test_unpad_0
    assert_equal "leet", Zweifische::AnsiX923Padding.unpad("leet")
  end

  def test_unpad_16
    assert_equal("leet",
      Zweifische::AnsiX923Padding
      .unpad("leet\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10"))
  end

  # still unpad for whatever length of the pad (max 255 (0xff))
  # (implementation limitation)
  def test_unpad_20
    assert_equal("leet",
      Zweifische::AnsiX923Padding
      .unpad("leet\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14"))
  end

  # wont unpad if pad characters is not 0x00
  def test_unpad_16
    assert_equal("leet\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x10",
      Zweifische::AnsiX923Padding
      .unpad("leet\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x10"))
  end
end
