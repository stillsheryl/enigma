class KeyGenerator
  attr_reader :key, :date, :key_shifts, :date_offset
  def initialize(key = generate_random_key, date = todays_date_to_string)
    @key = key
    @date = date
    @key_shifts = {}
    @date_offset = {}
  end

  def generate_random_key
    "%05d" % rand(99999)
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

  def key_shift(key)
    @key_shifts[:A] = key[0..1].to_i
    @key_shifts[:B] = key[1..2].to_i
    @key_shifts[:C] = key[2..3].to_i
    @key_shifts[:D] = key[3..4].to_i
    @key_shifts
  end

  def calculate_offset_from_date(date)
    date_squared = (date.to_i ** 2).to_s
    last_four = ("%04d" % date_squared[-4..-1].to_i).to_s
    @date_offset[:A] = last_four[0].to_i
    @date_offset[:B] = last_four[1].to_i
    @date_offset[:C] = last_four[2].to_i
    @date_offset[:D] = last_four[3].to_i
    @date_offset
  end

end
