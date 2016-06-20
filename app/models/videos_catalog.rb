class VideosCatalog
  def initialize(catalog: AllMediaCatalog.new)
    @catalog = catalog
  end

  def media
    catalog.media.includes(:media_content).where(media_content_type: 'Video')
  end

  private

  attr_reader :catalog
end
