require_relative 'test_helper'
require 'mocha/minitest'

class EnigmaTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
    assert_equal ({}), enigma.key_shifts
    assert_equal ({}), enigma.date_offset
  end

  def test_generate_random_key
    enigma = Enigma.new

    enigma.stubs(:rand).returns(4523)

    assert_equal "04523", enigma.generate_random_key
  end

  def test_key_shift
    enigma = Enigma.new

    expected = {
      A: 4,
      B: 45,
      C: 52,
      D: 23
    }
    assert_equal expected, enigma.key_shift("04523")
  end

  def test_todays_date_to_string
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020,9,18))

    assert_equal "180920", enigma.todays_date_to_string
  end

  def test_calculate_offset_from_date
    enigma = Enigma.new

    expected = {
      A: 2,
      B: 4,
      C: 0,
      D: 0
    }
    assert_equal expected, enigma.calculate_offset_from_date("080820")
  end

  def test_calculate_final_shifts
    enigma = Enigma.new
    enigma.generate_random_key
    enigma.key_shift("04523")
    enigma.calculate_offset_from_date("080820")

    expected = {
      A: 6,
      B: 49,
      C: 52,
      D: 23
    }
  end

  def test_alphabet
    enigma = Enigma.new

    assert_equal ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], enigma.alphabet(6)
  end

  def test_alphabets_for_encoding
    enigma = Enigma.new

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], alphabets_for_encoding(6, 49, 52, 23)
  end

end
