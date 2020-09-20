require './lib/key_generator'

class DecryptKey < KeyGenerator
  def initialize(key, date)
    super(key, date)
  end

end
