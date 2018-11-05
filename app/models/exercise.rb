class Exercise < ApplicationRecord
  validates_presence_of :day
  validates_presence_of :name
  def self.for_today
    all_exercises = where(day: Time.now.utc.wday)
    all_exercises.shuffle.first(4)
  end

  def weekday
    {
      1 => 'Monday',
      2 => 'Tuesday',
      3 => 'Wednesday',
      4 => 'Thursday',
      5 => 'Friday',
      6 => 'Saturday',
      7 => 'Sunday',
    }.fetch(day)
  end
end