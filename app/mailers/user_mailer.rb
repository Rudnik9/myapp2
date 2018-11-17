class UserMailer < ApplicationMailer
  default from: "pawellrudnicki@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
       to: 'pawellrudnicki@gmail.com',
       subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "BikeWorld"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

  def order_confirmation_email(user, product)
     @product = product
     @user = user
     mail(to: user.email,
          subject: "BikeWorld: Order confirmation")
  end

end
