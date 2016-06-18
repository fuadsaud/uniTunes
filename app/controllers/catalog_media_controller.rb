class CatalogMediaController < ApplicationController
  def show
    @medium = scope.find(params[:id])
  end

  private

  def scope
    Catalog.default.media
  end
end
