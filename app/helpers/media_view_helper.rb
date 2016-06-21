module MediaViewHelper
  def categories_select(media_view, path_helper:)
    select_tag 'category', options_for_select(
      media_view.categories.map { |c|
        [
          c.name,
          path_helper.call(
            media_content_type: media_view.media_content_type,
            category_id: c.id
          )
        ]
      }, path_helper.call(
        media_content_type: media_view.media_content_type,
        category_id: media_view.category.id
      )
    ), data: { role: 'categories-select' }
  end
end
