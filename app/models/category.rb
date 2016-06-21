class Category < ActiveRecord::Base
  enum media_content_type: {
    Medium::BOOK    => 0,
    Medium::SONG    => 1,
    Medium::VIDEO   => 2,
    Medium::PODCAST => 3,
  }

  has_many :media

  validates_presence_of :name, :media_content_type

  validates_uniqueness_of :name, scope: :media_content_type
end
