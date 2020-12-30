class Activitytype < ApplicationRecord
  ALLOWED_STATUSES = %w[active inactive].freeze

  belongs_to :user
  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
end
