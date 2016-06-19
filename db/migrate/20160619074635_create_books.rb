class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :page_count, null: false

      t.timestamps null: false
    end
  end
end
