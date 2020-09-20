require_relative 'test_helper'

class DecryptKeyTest < MiniTest::Test

  def test_it_exists
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_instance_of DecryptKey, decrypt_key
  end

  def test_it_has_attributes
    encrypt_key = EncryptKey.new("04523", "080820")
    key_generator = KeyGenerator.new("04523", "080820")

    assert_equal "04523", encrypt_key.key
    assert_equal "080820", encrypt_key.date
  end

end
