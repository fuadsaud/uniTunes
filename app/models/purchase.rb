class Purchase < ActiveRecord::Base
  belongs_to :medium, validate: true
  belongs_to :wallet, validate: true
  has_one :buyer, through: :wallet, source: :user

  validates_presence_of :medium, :wallet

  validates_uniqueness_of :medium, scope: :wallet, message: 'has already been purchased'

  monetize :amount_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  monetize :author_amount_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  monetize :admin_amount_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  validate :shares_sum_up, :buyer_aint_author

  def seller
    medium.author
  end

  private

  def buyer_aint_author
    if buyer == seller
      errors.add(:base, "author cannot purchase it's own creations")
    end
  end

  def shares_sum
    author_amount + admin_amount
  end

  def shares_sum_up
    unless shares_sum == amount
      errors.add(:amount, 'individual shares do not sum up to total amount')
    end
  end
end
