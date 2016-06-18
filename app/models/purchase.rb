class Purchase < ActiveRecord::Base
  belongs_to :medium
  belongs_to :wallet

  validates_presence_of :medium, :wallet

  monetize :amount_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
end
