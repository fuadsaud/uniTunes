class Medium < ActiveRecord::Base
  BOOK    = 'Book'
  SONG    = 'Song'
  VIDEO   = 'Video'
  PODCAST = 'Podcast'

  MEDIA_CONTENT_TYPES = [BOOK, SONG, VIDEO, PODCAST]

  belongs_to :category, validate: true
  belongs_to :author, class_name: 'User', validate: true

  belongs_to :media_content, polymorphic: true

  monetize :price_centavos

  validates :price_centavos, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  validates_presence_of :title, :description, :category, :author

  validate :category_has_proper_media_content_type

  private

  def category_has_proper_media_content_type
    if media_content.present? && media_content.type != category.media_content_type
      errors.add(
        :category,
        "expected #{media_content.type} category, but #{category.name} is a #{category.media_content_type} category"
      )
    end
  end
end
