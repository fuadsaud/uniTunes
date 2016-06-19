class LibraryMediaController < ApplicationController
  def show
    @medium = scope.find(params[:id])
  end

  private

  def scope
    current_user.library.media
  end
end
