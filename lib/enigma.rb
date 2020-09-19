require 'date'

class Enigma

  def generate_random_key
    "%05d" % rand(99999)
  end

  def todays_date_to_string
    date = Date.today
    date.strftime("%d%m%y")
  end

end
