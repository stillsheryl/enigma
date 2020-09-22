require_relative 'test_helper'

class EncryptKeyTest < MiniTest::Test

  def test_it_exists
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_instance_of EncryptKey, encrypt_key
  end

  def test_it_has_attributes
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_equal "04523", encrypt_key.key
    assert_equal "080820", encrypt_key.date
  end

  def test_key_shift
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_equal [4, 45, 52, 23], encrypt_key.key_shift("04523")
  end

  def test_calculate_offset_from_date
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_equal [2, 4, 0, 0], encrypt_key.calculate_offset_from_date("080820")
  end

  def test_final_shifts
    encrypt_key = EncryptKey.new("04523", "080820")

    encrypt_key.key_shift("04523")
    encrypt_key.calculate_offset_from_date("080820")

    assert_equal [6, 49, 52, 23], encrypt_key.final_shifts("04523", "080820")
  end

  def test_alphabet
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_equal ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], encrypt_key.alphabet(6)
  end

  def test_generate_encrypt_key
    encrypt_key = EncryptKey.new("04523", "080820")

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], encrypt_key.generate_encrypt_key("04523", "080820")
  end

end
