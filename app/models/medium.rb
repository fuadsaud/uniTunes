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

  def media_content_id=(id)
    media_content_type = MEDIA_CONTENT_TYPES[id.to_i]
    media_content_id = id
  end
end
