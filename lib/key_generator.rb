class KeyGenerator
  attr_reader :key, :date, :key_shifts, :date_offset
  def initialize(key, date)
    @key = key
    @date = date
  end

  def key_shift(key)
    key_shifts = [key[0..1].to_i, key[1..2].to_i, key[2..3].to_i, key[3..4].to_i]
  end

  def calculate_offset_from_date(date)
    date_squared = (date.to_i ** 2).to_s
    last_four = ("%04d" % date_squared[-4..-1].to_i).to_s
    date_offset = [last_four[0].to_i, last_four[1].to_i, last_four[2].to_i, last_four[3].to_i]
  end

  def final_shifts(key, date)
    key_shift = key_shift(key)
    date_offset = calculate_offset_from_date(date)
    a = key_shift[0] + date_offset[0]
    b = key_shift[1] + date_offset[1]
    c = key_shift[2] + date_offset[2]
    d = key_shift[3] + date_offset[3]
    final_shifts = [a, b, c, d]
  end

  def alphabet(shift_by)
    alphabet = ("a".."z").to_a << " "
    alphabet.rotate(shift_by)
  end

  def alphabets_for_encoding(key, date)
    final_shift = final_shifts(key, date)
    [alphabet(final_shift[0]), alphabet(final_shift[1]), alphabet(final_shift[2]), alphabet(final_shift[3])]
  end

  def alphabets_for_decoding(key, date)
    final_shift = final_shifts(key, date)
    negative_shift = final_shift.map do |shift|
      shift * -1
    end
    [alphabet(negative_shift[0]), alphabet(negative_shift[1]), alphabet(negative_shift[2]), alphabet(negative_shift[3])]
  end

  def generate_encrypt_key(key, date)
    key_shift(key)
    calculate_offset_from_date(date)
    alphabets_for_encoding(key, date)
  end

  def generate_decrypt_key(key, date)
    key_shift(key)
    calculate_offset_from_date(date)
    alphabets_for_decoding(key, date)
  end

end
