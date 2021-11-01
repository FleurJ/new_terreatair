class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  belongs_to :activity
end
