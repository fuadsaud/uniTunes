class Catalog
  def initialize(catalog: AllMediaCatalog, media_content_type: 'all')
    media_cn
  end

  def media
    catalog.media.where(media_content_type: media_content_type)
  end

  def media_content_type
    @media_content_type == 'all' ? 
  end
end
