class Book < ActiveRecord::Base
  has_one :medium, as: :media_content, validate: true

  accepts_nested_attributes_for :medium

  validates :page_count, presence: :true, numericality: {
    greater_than: 0
  }

  validates_presence_of :medium

  def type
    Medium::BOOK
  end
end
