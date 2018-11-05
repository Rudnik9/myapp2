class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
    @featured_product = Product.first
    @products = Product.has_image.limit(3)
  end
  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(from: @email,
      to: 'pawellrudnicki@gmail.com',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
end
end
