class LibrariesController < ApplicationController
  def show
    @library = current_user.library
  end
end
