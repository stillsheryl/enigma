require_relative 'test_helper'
require 'mocha/minitest'

class EnigmaTest < MiniTest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_generate_random_key
    enigma = Enigma.new

    enigma.stubs(:rand).returns(4523)

    assert_equal "04523", enigma.generate_random_key
  end

  def test_todays_date_to_string
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020,9,18))

    assert_equal "180920", enigma.todays_date_to_string
  end

  def test_calculate_offset_from_date
    enigma = Enigma.new

    assert_equal 2400, enigma.calculate_offset_from_date("080820")
  end

  def test_calculate_final_shifts
    enigma = Enigma.new

    expected = {
      A: 6,
      B: 49,
      C: 52,
      D: 23
    }
    assert_equal expected, enigma.final_shifts
  end

end
