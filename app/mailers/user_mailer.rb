class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order)
    @order=order
    # mail(to:@order.email, subject:"Order #{@order.id}: Receipt")
    mail(to:"bonitac93@gmail.com", subject:"Order #{order.id}: Receipt")

  end

end
