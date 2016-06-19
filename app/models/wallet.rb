class Wallet < ActiveRecord::Base
  belongs_to :user

  has_many :load_funds_transactions
  has_many :purchases

  validates_presence_of :user

  monetize :balance_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  def add_credits(amount)
    self.balance = balance + amount

    self
  end

  def remove_credits(amount)
    self.balance = balance - amount

    self
  end
end
