class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.monetize :amount
      t.references :medium, index: true, foreign_key: true, null: false
      t.references :wallet, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
