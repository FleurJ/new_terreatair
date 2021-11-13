class Address < ApplicationRecord
  belongs_to :user

  ALLOWED_TYPES = %w[facturation livraison].freeze

  validates :address_type, presence: true, inclusion: { in: ALLOWED_TYPES,
                                                message: "%{value} n'est pas un type d'adresse valide" }
  validates :address1, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :country, presence: true
end
