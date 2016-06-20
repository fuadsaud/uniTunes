class CategoriesFilter
  def call(media_scope:, categories:)
    media_scope.where(category: categories)
  end
end
