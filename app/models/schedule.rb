class Schedule < ApplicationRecord
  ALLOWED_STATUSES = %w[pending validated cancelled].freeze

  belongs_to :user

  has_many :schedules_activity, dependent: :destroy
  has_many :activities, through: :schedules_activity

  has_many :animator_schedules, dependent: :destroy
  has_many :users, through: :animator_schedules

  has_rich_text :comment
end
