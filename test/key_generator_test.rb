require_relative 'test_helper'
require 'mocha/minitest'

class KeyGeneratorTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    key_generator = KeyGenerator.new("04523", "080820")

    assert_instance_of KeyGenerator, key_generator
    assert_equal "04523", key_generator.key
    assert_equal "080820", key_generator.date
  end

  def test_generate_random_key
    key_generator = KeyGenerator.new()

    key_generator.stubs(:rand).returns(4523)

    assert_equal "04523", key_generator.generate_random_key
  end

  def test_todays_date_to_string
    key_generator = KeyGenerator.new()
    Date.stubs(:today).returns(Date.new(2020,9,18))

    assert_equal "180920", key_generator.todays_date_to_string
  end

  def test_key_shift
    key_generator = KeyGenerator.new("04523", "080820")

    expected = {
      A: 4,
      B: 45,
      C: 52,
      D: 23
    }
    assert_equal expected, key_generator.key_shift("04523")
  end

  def test_calculate_offset_from_date
  key_generator = KeyGenerator.new("04523", "080820")

    expected = {
      A: 2,
      B: 4,
      C: 0,
      D: 0
    }
    assert_equal expected, key_generator.calculate_offset_from_date("080820")
  end

  def test_calculate_final_shifts
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")

    expected = {
      A: 6,
      B: 49,
      C: 52,
      D: 23
    }
    assert_equal expected, key_generator.final_shifts
  end

  def test_final_shifts_array
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")
    key_generator.final_shifts

    assert_equal [6, 49, 52, 23], key_generator.final_shifts_array
  end

  def test_alphabet
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], key_generator.alphabet(6)
  end

  def test_alphabets_for_encoding
    key_generator = KeyGenerator.new("04523", "080820")
    key_generator.key_shift("04523")
    key_generator.calculate_offset_from_date("080820")
    key_generator.final_shifts

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], key_generator.alphabets_for_encoding([6, 49, 52, 23])
  end

  def test_generate_key
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal [6, 49, 52, 23], key_generator.generate_key("04523", "080820")
  end

end
