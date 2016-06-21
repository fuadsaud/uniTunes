class StoresController < AuthenticatedController
  def index
    render 'show'
  end

  def show
    @store = store_view
  end

  private

  def store_view
    MediaView.new(
      media_scope: Medium.all,
      media_content_type: media_content_type_param,
      category: category_param
    )
  end

  def category_param
    params[:category_id]
  end

  def media_content_type_param
    params.fetch(:media_content_type, Medium::BOOK)
  end
end
