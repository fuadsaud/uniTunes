class Medium < ActiveRecord::Base
  belongs_to :category

  monetize :price_centavos

  validates :price_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
end
