class Sponsorship < ApplicationRecord
  ALLOWED_FREQUENCY = %w[annuel trimestriel mensuel].freeze

  belongs_to :user

end
