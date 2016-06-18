class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :load_funds_transactions

  validates_presence_of :user

  monetize :balance_centavos

  def add_credits(amount)
    self.balance = balance + amount

    self
  end
end
