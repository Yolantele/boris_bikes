class Bike
attr_reader :broken

  # def working?
  #   true unless report_broken
  # end

  def report_broken
    broken = true
  end

  def broken?
    true if report_broken
  end

end
