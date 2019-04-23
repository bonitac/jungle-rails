class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { without: /\s/ }
  validates :password, presence: true, confirmation: true, length: {minimum: 5}


  def self.authenticate_with_credentials (email, password)
    email = email.downcase
    email = email.strip
    if User.find_by(email: email).try(:authenticate, password)
      true
    else
      false
    end
  end
end
