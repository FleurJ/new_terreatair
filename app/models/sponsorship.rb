class Sponsorship < ApplicationRecord
  ALLOWED_FREQUENCY = %w['parrainage unique' annuel trimestriel mensuel].freeze
  ALLOWED_SPONSOR_TYPE = %w[particulier entreprise].freeze
  ALLOWED_SPONSORSHIP_TYPE = %W[propolis nectar].freeze

  belongs_to :user

  validates :amount, presence: true
  validates :sponsorship_type, presence: true
end
