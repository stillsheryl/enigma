require_relative 'test_helper'

class KeyGeneratorTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    key_generator = KeyGenerator.new("04523", "080820")

    assert_instance_of KeyGenerator, key_generator
    assert_equal "04523", key_generator.key
    assert_equal "080820", key_generator.date
  end

  def test_key_shift
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal [4, 45, 52, 23], key_generator.key_shift("04523")
  end

  def test_calculate_offset_from_date
  key_generator = KeyGenerator.new("04523", "080820")

    assert_equal [2, 4, 0, 0], key_generator.calculate_offset_from_date("080820")
  end

  def test_final_shifts
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")

    assert_equal [6, 49, 52, 23], key_generator.final_shifts("04523", "080820")
  end

  def test_alphabet
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], key_generator.alphabet(6)
  end

  def test_alphabets_for_encoding
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")
    key_generator.final_shifts("04523", "080820")

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], key_generator.alphabets_for_encoding("04523", "080820")
  end

  def test_alphabets_for_decoding
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")
    key_generator.final_shifts("04523", "080820")

    assert_equal [["v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u"], ["f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e"], ["c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b"], ["e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d"]], key_generator.alphabets_for_decoding("04523", "080820")
  end

  def test_generate_encrypt_key
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], key_generator.generate_encrypt_key("04523", "080820")
  end

  def test_generate_decrypt_key
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal [["v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u"], ["f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d",  "e"], ["c",  "d",  "e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b"], ["e",  "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z",  " ",  "a",  "b",  "c",  "d"]], key_generator.generate_decrypt_key("04523", "080820")
  end

end
