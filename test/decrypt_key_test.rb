require_relative 'test_helper'

class DecryptKeyTest < MiniTest::Test

  def test_it_exists
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_instance_of DecryptKey, decrypt_key
  end

  def test_it_has_attributes
    encrypt_key = EncryptKey.new("04523", "080820")
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal "04523", encrypt_key.key
    assert_equal "080820", encrypt_key.date
  end

  def test_alphabets_for_decoding
    decrypt_key = DecryptKey.new("04523", "080820")
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")
    key_generator.final_shifts("04523", "080820")

    assert_equal [["v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u"], ["f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e"], ["c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b"], ["e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d"]], decrypt_key.alphabets_for_decoding("04523", "080820")
  end

  def test_generate_decrypt_key
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_equal [["v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u"], ["f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e"], ["c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b"], ["e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d"]], decrypt_key.generate_decrypt_key("04523", "080820")
  end

end
