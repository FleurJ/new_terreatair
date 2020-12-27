class Tag < ApplicationRecord
  has_many :contents_tags, dependent: :destroy
  has_many :contents, through: :contents_tags

  has_many :activities_tags, dependent: :destroy
  has_many :activities, through: :activities_tags
end
