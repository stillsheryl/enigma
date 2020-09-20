require_relative 'test_helper'

class DecryptKeyTest < MiniTest::Test

  def test_it_exists
    decrypt_key = DecryptKey.new("04523", "080820")

    assert_instance_of DecryptKey, decrypt_key
  end

end
