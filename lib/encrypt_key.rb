require './lib/key_generator'

class EncryptKey < KeyGenerator
  def initialize(key, date)
    super(key, date)
  end

  def alphabets_for_encoding(key, date)
    final_shift = final_shifts(key, date)
    [alphabet(final_shift[0]), alphabet(final_shift[1]), alphabet(final_shift[2]), alphabet(final_shift[3])]
  end

  def generate_encrypt_key(key, date)
    key_shift(key)
    calculate_offset_from_date(date)
    alphabets_for_encoding(key, date)
  end

end
