class LibrariesController < AuthenticatedController
  def show
    @library = current_user.library
  end
end
