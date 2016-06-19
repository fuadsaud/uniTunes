class AddUserSharesToPurchase < ActiveRecord::Migration
  def change
    add_monetize :purchases, :author_amount, null: false, default: 0
    add_monetize :purchases, :admin_amount, null: false, default: 0
  end
end
