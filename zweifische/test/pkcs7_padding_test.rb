require "test_helper"

class PKCS7PaddingTest < Minitest::Test
  def test_pad_4
    assert_equal bytes("leet\x04\x04\x04\x04"), "leet" + Zweifische::PKCS7Padding.pad(4)
  end

  def test_pad_1
    assert_equal bytes("leet\x01"), "leet" + Zweifische::PKCS7Padding.pad(1)
  end

  def test_pad_0
    assert_equal "leet", "leet" + Zweifische::PKCS7Padding.pad(0)
  end

  def test_pad_15
    assert_equal(bytes("\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f\x0f"),
                 Zweifische::PKCS7Padding.pad(15))
  end

  # maximum length of pad is 15 bytes
  def test_pad_16
    assert_raises(ArgumentError) { Zweifische::PKCS7Padding.pad(16) }
  end


  def test_unpad_4
    assert_equal "leet", Zweifische::PKCS7Padding.unpad("leet\x04\x04\x04\x04")
  end

  def test_unpad_1
    assert_equal "leet", Zweifische::PKCS7Padding.unpad("leet\x01")
  end

  def test_unpad_0
    assert_equal "leet", Zweifische::PKCS7Padding.unpad("leet")
  end

  def test_unpad_16
    assert_equal("leet",
      Zweifische::PKCS7Padding
      .unpad("leet\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10"))
  end

  # still unpad for whatever length of the pad (max 255 (0xff))
  # (implementation limitation)
  def teset_unpad_20
    assert_equal("leet",
      Zweifische::PKCS7Padding
      .unpad("leet\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14\x14"))
  end

  # wont unpad if pad characters is not length byte
  def test_unpad_16
    assert_equal("leet\x10\x10\x10\x10\x10\x10\x10\x09\x10\x10\x10\x10\x10\x10\x10\x10",
      Zweifische::PKCS7Padding
      .unpad("leet\x10\x10\x10\x10\x10\x10\x10\x09\x10\x10\x10\x10\x10\x10\x10\x10"))
  end
end
