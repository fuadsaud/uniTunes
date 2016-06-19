class AddMediaContentToMedia < ActiveRecord::Migration
  def change
    add_reference :media, :media_content, polymorphic: true, index: true
  end
end
