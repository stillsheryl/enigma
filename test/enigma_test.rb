require_relative 'test_helper'
require 'mocha/minitest'

class EnigmaTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
    assert_equal ({}), enigma.key_shifts
    assert_equal ({}), enigma.date_offset
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
    assert_equal expected, enigma.final_shifts
  end

  def test_final_shifts_array
    enigma = Enigma.new
    enigma.generate_random_key
    enigma.key_shift("04523")
    enigma.calculate_offset_from_date("080820")
    enigma.final_shifts

    assert_equal [6, 49, 52, 23], enigma.final_shifts_array
  end

  def test_alphabet
    enigma = Enigma.new

    assert_equal ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], enigma.alphabet(6)
  end

  def test_alphabets_for_encoding
    enigma = Enigma.new
    enigma.generate_random_key
    enigma.key_shift("04523")
    enigma.calculate_offset_from_date("080820")
    enigma.final_shifts

    assert_equal [["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f"], ["w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v"], ["z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"],["x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w"]], enigma.alphabets_for_encoding([6, 49, 52, 23])
  end

end
