require './lib/key_generator'

class DecryptKey
  include KeyGenerator
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def alphabets_for_decoding(key, date)
    final_shift = final_shifts(key, date)
    negative_shift = final_shift.map do |shift|
      shift * -1
    end
    [alphabet(negative_shift[0]), alphabet(negative_shift[1]), alphabet(negative_shift[2]), alphabet(negative_shift[3])]
  end

  def generate_decrypt_key(key, date)
    key_shift(key)
    calculate_offset_from_date(date)
    alphabets_for_decoding(key, date)
  end

end
