class CatalogsController < AuthenticatedController
  def show
    @catalog = catalog_view
  end

  private

  def catalog_view
    MediaView.new(
      media_scope: Medium.all,
      media_content_type: media_content_type_param,
      category: category_param
    )
  end

  def category_param
    catalog_params[:category_id]
  end

  def media_content_type_param
    catalog_params.fetch(:media_content_type, Medium::BOOK)
  end

  def catalog_params
    params.permit(catalog: [:category_id, :media_content_type]).fetch(:catalog, {})
  end
end
