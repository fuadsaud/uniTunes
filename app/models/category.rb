class Category < ActiveRecord::Base
  enum media_content_type: Medium::MEDIA_CONTENT_TYPES

  validates_presence_of :name, :media_content_type

  validates_uniqueness_of :name, scope: :media_content_type
end
