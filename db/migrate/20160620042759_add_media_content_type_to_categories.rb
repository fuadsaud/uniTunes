class AddMediaContentTypeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :media_content_type, :integer, null: false
    add_index :categories, %i(name media_content_type), unique: true
  end
end

