class Product < ApplicationRecord
  has_many :orders
  scope :has_image, -> { where.not(image_url: nil) }
end
