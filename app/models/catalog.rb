class Catalog
  def self.default
    new(media: Medium.all)
  end

  attr_reader :media

  def initialize(media:)
    @media = media
  end
end
