class CatalogsController < AuthenticatedController
  def show
    @catalog = catalog
  end

  private

  def catalog
    CatalogBuilder.new.call(catalog_params.to_h.symbolize_keys)
  end

  def catalog_params
    params.require(:catalog).permit(:media_content_type, categories_ids: [])
  end
end
