class KeyGenerator
  attr_reader :key, :date
  def initialize(key = generate_random_key, date = todays_date_to_string)
    @key = key
    @date = date
  end

  def generate_random_key
    "%05d" % rand(99999)
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

end
