class Medium < ActiveRecord::Base
  belongs_to :category

  monetize :price_centavos
end
