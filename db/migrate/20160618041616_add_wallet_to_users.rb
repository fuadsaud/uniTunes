class AddWalletToUsers < ActiveRecord::Migration
  def change
    add_reference :wallets, :user, index: true, foreign_key: true, null: false
  end
end
