class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.integer :duration, null: false

      t.timestamps null: false
    end
  end
end
