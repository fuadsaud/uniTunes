class CreateWallet < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.monetize :balance
      t.timestamps
    end
  end
end
