class Product < ApplicationRecord
  has_many :orders
  scope :has_image, -> { where.not(image_url: nil) }

  def self.search(search_term)
    Product.where("name ILIKE ?", "%#{search_term}%")
  end

end
