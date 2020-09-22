require_relative 'test_helper'

class DecryptKeyTest < MiniTest::Test

  def test_it_exists
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_instance_of DecryptKey, decrypt_key
  end

  def test_it_has_attributes
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_equal "04523", decrypt_key.key
    assert_equal "080820", decrypt_key.date
  end

  def test_key_shift
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_equal [4, 45, 52, 23], decrypt_key.key_shift("04523")
  end

  def test_calculate_offset_from_date
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_equal [2, 4, 0, 0], decrypt_key.calculate_offset_from_date("080820")
  end

  def test_final_shifts
    decrypt_key = DecryptKey.new("04523", "080820")

    decrypt_key.key_shift("04523")
    decrypt_key.calculate_offset_from_date("080820")

    assert_equal [6, 49, 52, 23], decrypt_key.final_shifts("04523", "080820")
  end

  def test_alphabet
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_equal ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], decrypt_key.alphabet(6)
  end

  def test_generate_decrypt_key
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_equal [["v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u"], ["f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e"], ["c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b"], ["e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d"]], decrypt_key.generate_decrypt_key("04523", "080820")
  end

end
