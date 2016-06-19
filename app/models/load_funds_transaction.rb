class LoadFundsTransaction < ActiveRecord::Base
  belongs_to :wallet, validate: true

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates_presence_of :wallet

  monetize :amount_centavos, numericality: {
    greater_than: 0
  }
end
