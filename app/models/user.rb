class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  before_save { |user| user.email = user.email.downcase }
  
  has_secure_password
end