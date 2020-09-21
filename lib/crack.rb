require_relative 'enigma.rb'

handle = File.open(ARGV[0], "r")

incoming_message = handle.read.to_s.chomp

handle.close

enigma = Enigma.new
translated = enigma.crack(incoming_message, ARGV[2])

writer = File.open(ARGV[1], "w")

writer.write translated[:decryption]

puts "Created 'cracked.txt' with the key #{translated[:key]} and date #{translated[:date]}"

writer.close
