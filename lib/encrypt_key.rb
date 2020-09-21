require './lib/key_generator'

class EncryptKey
  include KeyGenerator
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def generate_encrypt_key(key, date)
    final_shift = final_shifts(key, date)
    [alphabet(final_shift[0]), alphabet(final_shift[1]), alphabet(final_shift[2]), alphabet(final_shift[3])]
  end

end
