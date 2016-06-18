class CreateLoadFundsTransactions < ActiveRecord::Migration
  def change
    create_table :load_funds_transactions do |t|
      t.monetize :amount
      t.references :wallet, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
