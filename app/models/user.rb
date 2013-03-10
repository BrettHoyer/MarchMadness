class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :account_balance

  before_save { |user| user.email = user.email.downcase }

  has_many :picks, :order => 'created_at desc'

  has_secure_password

  def total_account_value
  	@bank=0
  	self.picks.each do |pick|
  		if pick.win_or_lose==nil
  			@bank += pick.wager_amount
  		end
  	end
  	@bank += self.account_balance
  end

  def total_pending_value
  	@bank=0
  	self.picks.each do |pick|
  		if pick.win_or_lose==nil
  			@bank += pick.wager_amount
  		end
  	end
  	return @bank
  end



end


