module Zweifische
  class Cipher256ecb
    def encrypt_final(plain_text, pad: nil)
      if pad && pad.respond_to?(:pad)
        c_encrypt_final_with_pad(plain_text, pad)
      else
        c_encrypt_final(plain_text)
      end
    end

    def decrypt_final(crypted_text, pad: nil)
      plain_text = c_decrypt_final(crypted_text)
      if pad && pad.respond_to?(:unpad)
        return pad.unpad(plain_text)
      end
      plain_text
    end

    alias_method :encrypt, :encrypt_final
    alias_method :decrypt, :decrypt_final
  end
end
