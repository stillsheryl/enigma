require 'date'

class Enigma

  def generate_random_key
    "%05d" % rand(99999)
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

  def calculate_offset_from_date(date)
    date = (date.to_i ** 2).to_s
    date[-4..-1].to_i
  end

end
