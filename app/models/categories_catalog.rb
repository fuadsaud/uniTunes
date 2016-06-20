class CategoriesCatalog
  def initialize(catalog: AllMediaCatalog.new, categories_ids: Category.pluck(:id))
    @catalog = catalog
    @categories_ids = categories_ids
  end

  def media
    catalog.media.where(category: categories_ids)
  end

  private

  attr_reader :catalog, :categories_ids
end
