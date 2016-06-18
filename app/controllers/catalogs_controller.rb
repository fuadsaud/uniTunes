class CatalogsController < AuthenticatedController
  def show
    @catalog = Catalog.default
  end
end
