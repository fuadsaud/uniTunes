class LibrariesController < AuthenticatedController
  def show
    @library = library_view
  end

  private

  def library_view
    MediaView.new(
      media_scope: library.media,
      media_content_type: media_content_type_param,
      category: category_param
    )
  end

  def library
    current_user.library
  end

  def category_param
    library_params[:category_id]
  end

  def media_content_type_param
    library_params.fetch(:media_content_type, Medium::BOOK)
  end

  def library_params
    params.permit(library: [:category_id, :media_content_type]).fetch(:library, {})
  end
end
