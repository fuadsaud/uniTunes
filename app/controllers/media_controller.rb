class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  # GET /media
  def index
    @media = Medium.all
  end

  # GET /media/1
  def show
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
    @medium = Medium.new(medium_params)

    if @medium.save
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
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medium_params
      params.require(:medium).permit(:title, :description, :price_centavos, :category_id)
    end
end
