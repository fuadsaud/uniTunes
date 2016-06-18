class AddWalletToUsers < ActiveRecord::Migration
  def change
    add_reference :wallets, :user, index: true
    add_foreign_key :wallets, :users
  end
end
