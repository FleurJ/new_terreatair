class Product < ApplicationRecord
  belongs_to :user

  has_rich_text :description
  has_one_attached :images
  has_one_attached :img_thumbnail
end
