class CreateWallet < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.monetize :balance
    end
  end
end
