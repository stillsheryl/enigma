require_relative 'enigma.rb'

message = File.open(ARGV[0], "r")

incoming_message = message.read

message.close

translated = enigma.encrypt(message, key = generate_random_key, date =  todays_date_to_string)

writer = File.open(ARGV[1], "w")

writer.write()

writer.close
