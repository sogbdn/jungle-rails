class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def receipt_email(order)
    @order = order
    @url  = 'http://jungle.com/login'
    mail(to: @order.email, subject: 'Receipt of your order')
  end

end
