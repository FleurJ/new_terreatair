class Activitytype < ApplicationRecord
  ALLOWED_STATUSES = %w[active inactive].freeze

  belongs_to :user

  has_many :activity_activitytypes, dependent: :destroy
  has_many :activities, through: :activity_activitytypes

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
end
