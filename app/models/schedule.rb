class Schedule < ApplicationRecord
  ALLOWED_STATUSES = %w[open closed booked].freeze

  belongs_to :user
end
