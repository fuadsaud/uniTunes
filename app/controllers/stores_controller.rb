class StoresController < AuthenticatedController
  def show
    @store = store_view
  end

  private

  def store_view
    MediaView.new(
      media_scope: Medium.all,
      media_content_type: media_content_type_param,
      search_term: search_term_param
    )
  end

  def search_term_param
    params[:search_term]
  end

  def category_id_param
    params[:category_id]
  end

  def media_content_type_param
    params.fetch(:media_content_type, Medium::BOOK)
  end
end
