class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :account_balance

  before_save { |user| user.email = user.email.downcase }

  has_many :picks
  
  has_secure_password
end
