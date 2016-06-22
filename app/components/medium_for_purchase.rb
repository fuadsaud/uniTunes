class MediumForPurchase
  def initialize(medium, context:)
    @medium = medium
    @context = context
  end

  delegate :title, :description, to: :medium

  def price
    h.humanized_money_with_symbol(medium.price)
  end

  def category_name
    medium.category.name
  end

  def download_url
    medium.file
  end

  def category_path
    h.store_path(media_content_type: medium.media_content_type, category_id: medium.category_id)
  end

  def to_partial_path
    'media/purchased_medium'
  end

  private

  attr_reader :medium, :context

  alias_method :h, :context
end
