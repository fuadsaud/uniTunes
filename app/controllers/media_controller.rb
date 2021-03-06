class MediaController < AuthenticatedController
  before_action :set_medium, only: [:edit, :update, :destroy]

  # GET /media
  def index
    @portfolio = portfolio_view
  end

  # GET /media/1
  def show
    @medium = Medium.find(params[:id])
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  def create
    result = CreateMedium.new.call(
      medium_params: medium_params.merge(author_id: current_user.id)
    )

    @medium = result.medium

    if result.success?
      redirect_to @medium, notice: 'Medium was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /media/1
  def update
    if @medium.update(medium_params)
      redirect_to @medium, notice: 'Medium was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /media/1
  def destroy
    @medium.destroy
    redirect_to media_url, notice: 'Medium was successfully destroyed.'
  end

  private

  def portfolio_view
    MediaView.new(
      media_scope: scope,
      category_id: category_id_param,
      media_content_type: media_content_type_param,
      search_term: search_term_param
    )
  end

  def search_term_param
    params[:search_term]
  end

  def category_id_param
    params[:category_id]
  end

  def media_content_type_param
    params.fetch(:media_content_type, Medium::BOOK)
  end

  def scope
    current_user.media
  end

  def set_medium
    @medium = scope.find(params[:id])
  end

  def medium_params
    params.require(:medium).permit(:title, :description, :price, :category_id, :thumbnail, :file, :media_content_type)
  end
end
