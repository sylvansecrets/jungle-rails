class UserMailer < ApplicationMailer
  default from: 'notification@jungle.com'

  def order_email(order)
    @order = order
    @url = 'http://0.0.0.0:3000/orders/#{order.id}'
    mail(to: @order.email, subject: 'Your order has been completed')
  end
end
