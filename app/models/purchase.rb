class Purchase < ActiveRecord::Base
  belongs_to :media
  belongs_to :wallet

  monetize :amount_centavos
end
