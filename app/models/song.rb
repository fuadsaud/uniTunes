class Song < ActiveRecord::Base
  has_one :medium, as: :media_content, validate: true

  accepts_nested_attributes_for :medium

  validates :duration, presence: :true, numericality: {
    greater_than_or_equal_to: 0
  }

  validates_presence_of :medium

  def type
    Medium::SONG
  end
end
