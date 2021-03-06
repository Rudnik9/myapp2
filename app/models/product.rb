class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, presence: true
  scope :has_image, -> { where.not(image_url: nil) }

  def self.search(search_term)
    Product.where("name ILIKE ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}")
  end

 def viewed!
   $redis.incr("product:#{id}")
 end

end
