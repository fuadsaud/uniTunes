class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.name
      t.timestamps
    end
  end
end
