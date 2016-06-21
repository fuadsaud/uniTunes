class CatalogMediaController < AuthenticatedController
  def show
    @medium = scope.find(params[:id])
  end

  private

  def scope
    Medium.all
  end
end
