require 'date'
require_relative 'encrypt_key.rb'
require_relative 'decrypt_key.rb'

class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def generate_random_key
    "%05d" % rand(99999)
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

  def find_letter_index(letter)
    @alphabet.index(letter)
  end

  def encrypt(message, key = generate_random_key, date =  todays_date_to_string)
    encrypt_key = EncryptKey.new(key, date)
    offset_alphabet = encrypt_key.generate_encrypt_key(key, date)
    spaced_message = message.downcase.split("")
    encrypted_message = []
    index = 0
    spaced_message.each do |letter|
      if @alphabet.include?(letter)
        encrypted_message << offset_alphabet[index % 4][find_letter_index(letter)]
        index += 1
      else
        encrypted_message << letter
      end
    end
    {:encryption => encrypted_message.join, :key => key, :date => date}
  end

  def decrypt(ciphertext, key, date = todays_date_to_string)
    decrypt_key = DecryptKey.new(key, date)
    offset_alphabet = decrypt_key.generate_decrypt_key(key, date)
    spaced_message = ciphertext.downcase.split("")
    decrypted_message = []
    index = 0
    spaced_message.each do |letter|
      if @alphabet.include?(letter)
        decrypted_message << offset_alphabet[index % 4][find_letter_index(letter)]
        index += 1
      else
        decrypted_message << letter
      end
    end
    {:decryption => decrypted_message.join, :key => key, :date => date}
  end

  def crack(ciphertext, date = todays_date_to_string)
    key = nil
    decryption = nil
    possible_codes = (0..99999).map {|n| "%05d" % n}
    possible_codes.each do |number|
      message = decrypt(ciphertext, number, date)
      if message[:decryption][-4..-1] == " end"
        key = number
        decryption = message[:decryption]
        break
      end
    end
    {:decryption => decryption, :date => date, :key => key}
  end

end
