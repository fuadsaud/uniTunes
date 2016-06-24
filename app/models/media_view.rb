class MediaView
  attr_reader :media_content_type, :search_term

  def initialize(media_scope: Medium.all, media_content_type:, categories_scope: Category.all,
                 category_id: nil, search_term: nil)
    @media_scope = media_scope
    @media_content_type = media_content_type
    @categories_scope = categories_scope
    @category_id = category_id.try(:to_i)
    @search_term = search_term || ''
  end

  def media
    categories_filter.where(media_content_type: media_content_type).where("UPPER(title) LIKE ?", "%#{search_term.strip.upcase}%")
  end

  def categories
    [wildcard_category, *categories_scope.where(media_content_type: media_content_type_enum).to_a]
  end

  def category
    categories.find { |c| c.id == category_id } || wildcard_category
  end

  private

  attr_reader :media_scope, :categories_scope, :category_id

  def categories_filter
    if category.id.present?
      CategoriesFilter.new.call(media_scope: media_scope, categories: category)
    else
      media_scope
    end
  end

  def media_content_type_enum
    Category.media_content_types[media_content_type]
  end

  def wildcard_category
    WildcardCategory.new(name: 'All', media_content_type: media_content_type)
  end

  WildcardCategory = ImmutableStruct.new(:media_content_type) do
    def id
      nil
    end

    def name
      'All'
    end

    def media
      Media.where(media_content_type: media_content_type)
    end
  end
end
