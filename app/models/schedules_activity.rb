class SchedulesActivity < ApplicationRecord
  belongs_to :schedule
  belongs_to :activity
end
