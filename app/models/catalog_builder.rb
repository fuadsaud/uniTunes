class CatalogBuilder
  MEDIA_CONTENT_TYPE_CATALOGS = {
    'book' => BooksCatalog,
    'song' => SongsCatalog,
    'video' => VideosCatalog,
    'podcast' => PodcastsCatalog,
  }

  def self.media_content_type_catalog(type:)
    MEDIA_CONTENT_TYPE_CATALOGS.fetch(type)
  end

  def call(media_content_type: 'all', categories_ids: nil)
    categories_catalog(
      media_content_type_catalog(media_content_type),
      categories_ids
    )
  end

  private

  def media_content_type_catalog(type)
    self.class.media_content_type_catalog(type: type).new
  end

  def categories_catalog(catalog, categories_ids)
    if categories_ids
      CategoriesCatalog.new(
        catalog: catalog,
        categories_ids: categories_ids
      )
    else
      catalog
    end
  end

  attr_reader :media_content_type, :categories_ids
end
