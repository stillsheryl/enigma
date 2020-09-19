require 'date'

class Enigma

  def generate_random_key
    "%05d" % rand(99999)
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

  def find_letter_index(letter)
    alphabet = ("a".."z").to_a << " "
    alphabet.index(letter)
  end

  def encrypt(message, key = generate_random_key, date =  todays_date_to_string)
      key_value = KeyGenerator.new(key, date)
      offset_alphabet = key_value.generate_key(key, date)
      keys = key_value.final_shifts_array
      spaced_message = message.downcase.chars.each_slice(4).map(&:join)
      message = []
      spaced_message.each.with_index(0) do |letter, index|
        message << offset_alphabet[0][find_letter_index(letter[0])] if !letter[0].nil?
        message << offset_alphabet[1][find_letter_index(letter[1])] if !letter[1].nil?
        message << offset_alphabet[2][find_letter_index(letter[2])] if !letter[2].nil?
        message << offset_alphabet[3][find_letter_index(letter[3])] if !letter[3].nil?
      end
      message.join
    end

end
