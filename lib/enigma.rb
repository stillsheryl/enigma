require 'date'
require_relative 'key_generator.rb'

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
    encryption_info = {}
    key_value = KeyGenerator.new(key, date)
    offset_alphabet = key_value.generate_key(key, date)
    spaced_message = message.downcase.split("")
    encrypted_message = []
    spaced_message.each.with_index(0) do |letter, index|
      encrypted_message << offset_alphabet[index % 4][find_letter_index(letter)]
    end
    encryption_info = {:encryption => encrypted_message.join, :key => key, :date => date}
  end

  def decrypt(ciphertext, key, date = todays_date_to_string)
    decryption_info = {}
    key_value = KeyGenerator.new(key, date)
    offset_alphabet = key_value.generate_decrypt_key(key, date)
    spaced_message = ciphertext.downcase.split("")
    decrypted_message = []
    spaced_message.each.with_index(0) do |letter, index|
      decrypted_message << offset_alphabet[index % 4][find_letter_index(letter)]
    end
    decryption_info = {:decryption => decrypted_message.join, :key => key, :date => date}
  end

end
