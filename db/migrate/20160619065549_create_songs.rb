class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :duration, null: false

      t.timestamps null: false
    end
  end
end
