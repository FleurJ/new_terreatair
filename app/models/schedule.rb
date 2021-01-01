class Schedule < ApplicationRecord
  ALLOWED_STATUSES = %w[pending validated cancelled].freeze
  ALLOWED_QUANTITIES = %w[4 5 6 autre].freeze

  belongs_to :user

  has_many :schedules_activity, dependent: :destroy
  has_many :activities, through: :schedules_activity

  has_many :animator_schedules, dependent: :destroy
  has_many :users, through: :animator_schedules

  has_rich_text :comment

  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
  validates :classes_qty, presence: true, inclusion: { in: ALLOWED_QUANTITIES,
                                                         message: "%{value} n'est pas une valeur valide" }
end
