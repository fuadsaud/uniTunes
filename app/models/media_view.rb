class MediaView
  def initialize(media_scope: Medium.all, media_content_type:, categories_scope: Category.all,
                 category: nil)
    @media_scope = media_scope
    @media_content_type = media_content_type
    @categories_scope = categories_scope
    @category = category
  end

  def media
    categories_filter.where(media_content_type: media_content_type)
  end

  def categories
    categories_scope.where(media_content_type: media_content_type_enum)
  end

  private

  attr_reader :media_scope, :media_content_type, :categories_scope, :category

  def categories_filter
    if category.present?
      CategoriesFilter.new.call(media_scope: media_scope, categories: category)
    else
      media_scope
    end
  end

  def media_content_type_enum
    Category.media_content_types[media_content_type]
  end
end
