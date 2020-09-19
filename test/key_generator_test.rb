require_relative 'test_helper'

class KeyGeneratorTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    key_generator = KeyGenerator.new("04523", "080820")

    assert_instance_of KeyGenerator, key_generator
    assert_equal "04523", key_generator.key
    assert_equal "080820", key_generator.date
  end

end
