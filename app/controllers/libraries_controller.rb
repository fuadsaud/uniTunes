class LibrariesController < AuthenticatedController
  def show
    @library = library_view
  end

  private

  def library_view
    MediaView.new(
      media_scope: library.media,
      media_content_type: media_content_type_param,
      search_term: search_term_param
    )
  end

  def search_term_param
    params[:search_term]
  end

  def library
    current_user.library
  end

  def category_id_param
    params[:category_id]
  end

  def media_content_type_param
    params.fetch(:media_content_type, Medium::BOOK)
  end
end
