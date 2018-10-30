class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
    @featured_product = Product.first
    @products = Product.has_image.limit(3)
  end
end
