class Schedule < ApplicationRecord
  ALLOWED_STATUSES = %w[pending validated cancelled].freeze

  belongs_to :user

  has_many :schedules_activity, dependent: :destroy
  has_many :activities, through: :schedules_activity
end
