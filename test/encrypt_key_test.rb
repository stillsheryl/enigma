require_relative 'test_helper'

class EncryptKeyTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    encrypt_key = EncryptKey.new

    assert_instance_of EncryptKey, encrypt_key
  end

end
