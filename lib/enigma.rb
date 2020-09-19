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




  



end
