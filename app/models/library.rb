class Library < ActiveRecord::Base
  belongs_to :user, validate: true

  validates_presence_of :user

  def media
    Medium.find(user.wallet.purchases.pluck(:medium_id))
  end
end
