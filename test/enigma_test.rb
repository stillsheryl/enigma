require_relative 'test_helper'
require 'mocha/minitest'

class EnigmaTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], enigma.alphabet
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

  def test_find_letter_index
    enigma = Enigma.new()

    assert_equal 18, enigma.find_letter_index("s")
    assert_equal 1, enigma.find_letter_index("b")
  end

  def test_translate_message
    enigma = Enigma.new()
    encrypt_key = EncryptKey.new("04523", "080820")

    spaced_message = ["s", "h", "*", "e", "r", "y", "l"]
    offset_alphabet = encrypt_key.generate_encrypt_key("04523", "080820")
    assert_equal "yc*cndg", enigma.translate_message(spaced_message, offset_alphabet)
  end

  def test_encrypt
    enigma = Enigma.new

    expected = {
              encryption: "yc*cndg",
              key: "04523",
              date: "080820"
            }
    assert_equal expected, enigma.encrypt("sh*eryl", "04523", "080820")

    expected2 = {
              encryption: "keder ohulw!",
              key: "02715",
              date: "040895"
            }
    assert_equal expected2, enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_encrypt_without_optional_arguments
    enigma = Enigma.new
    enigma.stubs(:generate_random_key).returns("04523")
    enigma.stubs(:todays_date_to_string).returns("080820")
    expected = {
              encryption: "yccndg",
              key: "04523",
              date: "080820"
            }
    assert_equal expected, enigma.encrypt("sheryl")
  end

  def test_decrypt
    enigma = Enigma.new

    expected = {
              decryption: "hell*o world!",
              key: "02715",
              date: "040895"
            }
    assert_equal expected, enigma.decrypt("kede*r ohulw!", "02715", "040895")
    expected2 = {
              decryption: "sheryl",
              key: "04523",
              date: "080820"
            }
    assert_equal expected2, enigma.decrypt("yccndg", "04523", "080820")
  end

  def test_decrypt_without_optional_arguments
    enigma = Enigma.new
    enigma.stubs(:generate_random_key).returns("04523")
    enigma.stubs(:todays_date_to_string).returns("080820")
    expected = {
              decryption: "sheryl",
              key: "04523",
              date: "080820"
            }
    assert_equal expected, enigma.decrypt("yccndg", "04523")
  end

  def test_crack
    enigma = Enigma.new

    expected = {
              decryption: "hello world end",
              date: "291018",
              key: "08304"
            }
    assert_equal expected, enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_crack_without_date
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020,9,18))

    expected2 = {
              decryption: "hello world end",
              date: "180920",
              key: "62862"
            }
    assert_equal expected2, enigma.crack("vjqtbeaweqihssi")
  end

end
