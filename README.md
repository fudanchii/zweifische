# Zweifische

Ruby binding for C implementation of twofish from [@drewcsillag](https://github.com/drewcsillag)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zweifische', git: "https://github.com/fudanchii/zweifische"
```

And then execute:

    $ bundle

## Usage

All key length (256, 192, and 128 bit) is supported. Each respective class can be used directly.

to use:
```ruby
require "zweifische"

# ecb mode

# for 128 bit key (16 bytes)
key="0123456789123456"
tf = Zweifische::Cipher128ecb.new(key)
crypted_text = tf.encrypt("plain text to encrypt here", pad: Zweifische::ZeroPadding)
plain_text = tf.decrypt(crypted_text, pad: Zweifische::ZeroPadding)
```

to encrypt stream use `encrypt_update` for each chunks, then `encrypt_final` at the end of the stream.

Notice that padding is specified explicitly above, by default encryption and decryption wont expect any padding in exchange of
user should explicitly set the data length to be encrypted/decrypted should be a multiple of 16 bytes.

So this will raise RuntimeError:

```ruby
key="0123456789123456"
tf = Zweifische::Cipher128ecb.new(key)
crypted_text = tf.encrypt("plain text to encrypt here")
```

Available padding scheme:

- ANSI X.923 `Zweifische::AnsiX923Padding`
- ISO/IEC 7816-4 `ISOIEC78164Padding`
- PKCS7 `PKC7Padding`
- Zero bytes `ZeroPadding`

Just be aware that padding is _not_ bullet-proof, for example using zero bytes padding for data which may contain zero bytes trailer
may cause all the trailer to be removed at decryption.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fudanchii/zweifische.
