class Content < ApplicationRecord
  ALLOWED_STATUSES = %w[draft published archived].freeze

  belongs_to :user

  has_many :contents_tags, dependent: :destroy
  has_many :tags, through: :contents_tags

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
end
