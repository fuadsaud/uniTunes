class AllMediaCatalog
  def initialize(catalog: OpenStruct.new(media: Medium.all))
    @media = catalog.media
  end

  attr_reader :media
end
