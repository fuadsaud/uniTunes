class PurchasesController < AuthenticatedController
  def index
    @purchases = scope
  end

  def create
    result = PurchaseMedia.new.call(purchase_params: purchase_params)

    @medium = result.medium

    if result.sucess?
      redirect_to @medium, notice: 'Medium successfully purchased and added to you library'
    else
      redirect_to @medium, notice: 'There was a problem with you purchase'
    end
  end

  private

  def purchase_params
    params(:purchase).permit(:medium_id)
  end

  def scope
    current_user.wallet.purchases
  end
end
