class CreateLoadFundsTransactions < ActiveRecord::Migration
  def change
    create_table :load_funds_transactions do |t|
      t.monetize :amount
      t.references :wallet, index: true
      t.foreign_key :wallets
      t.timestamps null: false
    end
  end
end
