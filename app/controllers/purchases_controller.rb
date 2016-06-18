class PurchasesController < AuthenticatedController
  def index
    @purchases = scope
  end

  def create
    result = PurchaseMedium.new.call(user: current_user, medium_id: medium_id_param)

    @medium = result.medium

    if result.success?
      redirect_to catalog_medium_path(@medium), notice: 'Medium successfully purchased and added to you library'
    else
      redirect_to catalog_medium_path(@medium), notice: 'There was a problem with you purchase'
    end
  end

  private

  def medium_id_param
    purchase_params[:medium_id]
  end

  def purchase_params
    params.require(:purchase).permit(:medium_id)
  end

  def scope
    current_user.wallet.purchases
  end
end
