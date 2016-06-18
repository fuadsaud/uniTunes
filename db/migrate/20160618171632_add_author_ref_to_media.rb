class AddAuthorRefToMedia < ActiveRecord::Migration
  def change
    add_belongs_to :media, :author,
      references: :users,
      index: true,
      null: false

    add_foreign_key :media, :users, column: :author_id
  end
end
