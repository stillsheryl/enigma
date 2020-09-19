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
    enigma = Enigma.new()
    Date.stubs(:today).returns(Date.new(2020,9,18))

    assert_equal "180920", enigma.todays_date_to_string
  end

  def test_encrypt
    enigma = Enigma.new

    assert_equal "yccndg", enigma.encrypt("sheryl", "04523", "080820")
    assert_equal "keder ohulw", enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt
    enigma = Enigma.new

    assert_equal "sheryl", enigma.decrypt("yccndg", "04523", "080820")
    assert_equal "hello world", enigma.decrypt("keder ohulw", "02715", "040895")
  end

end
