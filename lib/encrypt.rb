require_relative 'enigma.rb'

handle = File.open(ARGV[0], "r")

incoming_message = handle.read.to_s.chomp

handle.close

enigma = Enigma.new
translated = enigma.encrypt(incoming_message)

writer = File.open(ARGV[1], "w")

writer.write translated[:encryption]

puts "Created 'encrypted.txt' with the key #{translated[:key]} and date #{translated[:date]}"

writer.close
