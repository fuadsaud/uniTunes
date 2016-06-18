class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.monetize :price
      t.references :category, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
