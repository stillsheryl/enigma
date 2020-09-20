require './lib/key_generator'

class EncryptKey < KeyGenerator
  def initialize(key, date)
    super(key, date)
  end

end
