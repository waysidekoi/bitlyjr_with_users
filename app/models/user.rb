class User < ActiveRecord::Base
  has_many :urls

  EMAIL_REGEX = /[\w-]+@([\w-]+\.)+[\w-]+/
  validates :email, :presence => true, :uniqueness => true, :format => { :with => EMAIL_REGEX }
  validates :encrypted_password, :presence => true


  def self.authenticate(email, password)
    user = User.find_by_email_and_encrypted_password(email, password)
  end
end
