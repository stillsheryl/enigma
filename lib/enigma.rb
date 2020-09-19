require 'date'

class Enigma
  def initialize

  end

  def alphabet(shift_by)
    alphabet = ("a".."z").to_a << " "
    alphabet.rotate(shift_by)
  end

  def alphabets_for_encoding(final_shifts_array)
    [alphabet(final_shifts_array[0]), alphabet(final_shifts_array[1]), alphabet(final_shifts_array[2]), alphabet(final_shifts_array[3])]
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
