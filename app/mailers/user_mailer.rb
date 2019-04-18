class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order)
    @order=order
    mail(to:@order.email, subject:'Thanks for the order')
  end

end
