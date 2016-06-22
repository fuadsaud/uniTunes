class AddThumbnailToMedium < ActiveRecord::Migration
  def change
    add_column :media, :thumbnail, :string
  end
end
