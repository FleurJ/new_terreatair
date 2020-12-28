class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_rich_text :description
  has_one_attached :avatar

  has_many :animator_schedules, dependent: :destroy
  has_many :schedules, through: :animator_schedules
end
