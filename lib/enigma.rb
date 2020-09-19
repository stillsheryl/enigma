require 'date'

class Enigma
  attr_reader :key_shifts, :date_offset
  def initialize
    @key_shifts = {}
    @date_offset = {}
    @final_shifts = {}
  end

  def alphabet(shift_by)
    alphabet = ("a".."z").to_a << " "
    alphabet.rotate(shift_by)
  end

  def alphabets_for_encoding(final_shifts_array)
    [alphabet(final_shifts_array[0]), alphabet(final_shifts_array[1]), alphabet(final_shifts_array[2]), alphabet(final_shifts_array[3])]
  end

  def generate_random_key
    "%05d" % rand(99999)
  end

  def key_shift(key)
    @key_shifts[:A] = key[0..1].to_i
    @key_shifts[:B] = key[1..2].to_i
    @key_shifts[:C] = key[2..3].to_i
    @key_shifts[:D] = key[3..4].to_i
    @key_shifts
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

  def calculate_offset_from_date(date)
    date_squared = (date.to_i ** 2).to_s
    last_four = ("%04d" % date_squared[-4..-1].to_i).to_s
    @date_offset[:A] = last_four[0].to_i
    @date_offset[:B] = last_four[1].to_i
    @date_offset[:C] = last_four[2].to_i
    @date_offset[:D] = last_four[3].to_i
    @date_offset
  end

  def final_shifts
      @final_shifts[:A] = @key_shifts[:A] + @date_offset[:A]
      @final_shifts[:B] = @key_shifts[:B] + @date_offset[:B]
      @final_shifts[:C] = @key_shifts[:C] + @date_offset[:C]
      @final_shifts[:D] = @key_shifts[:D] + @date_offset[:D]
    @final_shifts
  end

  def final_shifts_array
    [@final_shifts[:A], @final_shifts[:B], @final_shifts[:C], @final_shifts[:D]]
  end

  

end
