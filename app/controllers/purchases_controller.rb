class PurchasesController < AuthenticatedController
  def index
    @purchases = scope
  end

  def create
    result = PurchaseMedium.new.call(user: current_user, medium_id: medium_id_param)

    medium = result.medium
    purchase = result.purchase

    if result.success?
      redirect_to medium_path(medium),
        notice: 'Medium successfully purchased and added to you library'
    else
      redirect_to medium_path(medium), notice: purchase.errors.full_messages.join(' ')
    end
  end

  def show
    @purchase = scope.find(params[:id])
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
