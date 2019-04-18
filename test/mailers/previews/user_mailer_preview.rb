
class UserMailerPreview < ActionMailer::Preview
  def receipt_email
    UserMailer.receipt_email(Order.first)
  end
end