class Library < ActiveRecord::Base
  belongs_to :user, validate: true

  validates_presence_of :user

  def media
    Medium.where(id: user.wallet.purchases.pluck(:medium_id))
  end

  def has?(medium)
    media.exists?(medium)
  end
end
