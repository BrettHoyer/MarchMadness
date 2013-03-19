class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :account_balance

  before_save :email_downcase, :capitalize_name

  has_many :picks, :order => 'created_at desc'

  validates_uniqueness_of :email, :name

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

  def email_downcase
  	self.email = self.email.downcase
  end

  def capitalize_name
  	name_array = self.name.split(" ").each { |name| name.capitalize!}
  	self.name = name_array.join(" ")
  end
end


