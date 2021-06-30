class Vol < ApplicationRecord

  def arrival_date(depart, time)
    depart+time;
  end

  def duration_format(sec)
    "%02d h %02d m" % [sec / 3600, sec / 60 % 60]
  end

end
