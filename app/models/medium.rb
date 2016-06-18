class Medium < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, class_name: 'User'

  monetize :price_centavos

  validates :price_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  validates_presence_of :title, :description, :category, :author
end
