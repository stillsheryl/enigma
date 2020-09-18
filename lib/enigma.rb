class Enigma

  def generate_random_key
    "%05d" % rand(99999)
  end

end
