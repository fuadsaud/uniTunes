class SongsCatalog
  def initialize(catalog: AllMediaCatalog.new)
    @catalog = catalog
  end

  def media
    catalog.media.includes(:media_content).where(media_content_type: 'Song')
  end

  private

  attr_reader :catalog
end
