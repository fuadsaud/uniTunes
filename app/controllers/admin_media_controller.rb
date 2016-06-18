class AdminMediaController < AdminController
  before_action :set_media, only: [:show, :destroy]

  def index
    @media = scope

    render 'media/index'
  end

  def show
    render 'media/show'
  end

  def destroy
    @medium.destroy
    redirect_to admin_media_url, notice: 'Medium was successfully destroyed.'
  end

  private

  def scope
    Medium.all
  end

  def set_medium
    @medium = scope.find(params[:id])
  end
end
