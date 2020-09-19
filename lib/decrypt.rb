require_relative 'enigma.rb'

handle = File.open(ARGV[0], "r")

incoming_message = handle.read.to_s.chomp

handle.close

key_date = ARGV
enigma = Enigma.new
translated = enigma.decrypt(incoming_message, key_date[2], key_date[3])

writer = File.open(ARGV[1], "w")

writer.write translated[:decryption]

puts "Created 'decrypted.txt' with the key #{translated[:key]} and date #{translated[:date]}"

writer.close
