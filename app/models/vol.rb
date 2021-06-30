class Vol < ApplicationRecord

  def arrival_date(depart, time)
    depart+time*60; # time is in minutes
  end

  def duration_format(min)
    "%02d h %02d m" % [min / 60, min % 60]
  end

end
