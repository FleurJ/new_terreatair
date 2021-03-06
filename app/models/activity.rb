class Activity < ApplicationRecord
  ALLOWED_STATUSES = %w[draft published archived].freeze

  belongs_to :user

  has_rich_text :body
  has_rich_text :booking_conditions
  has_one_attached :img_header
  has_one_attached :img_thumbnail

  has_many :activities_tags, dependent: :destroy
  has_many :tags, through: :activities_tags

  has_many :schedules_activity, dependent: :destroy
  has_many :schedules, through: :schedules_activity

  has_many :activity_activitytypes, dependent: :destroy
  has_many :activitytypes, through: :activity_activitytypes

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
end
