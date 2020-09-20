require_relative 'test_helper'

class EncryptKeyTest < MiniTest::Test

  def test_it_exists
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_instance_of EncryptKey, encrypt_key
  end

  def test_it_has_attributes
    encrypt_key = EncryptKey.new("04523", "080820")
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal "04523", encrypt_key.key
    assert_equal "080820", encrypt_key.date
  end

  def test_alphabets_for_encoding
    encrypt_key = EncryptKey.new("04523", "080820")
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")
    key_generator.final_shifts("04523", "080820")

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], encrypt_key.alphabets_for_encoding("04523", "080820")
  end

end
