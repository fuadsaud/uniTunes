class AdminPurchasesController < AdminController
  def index
    @purchases = scope

    render 'purchases/index'
  end

  def show
    @purchase = scope.find(params[:id])

    render 'purchase/index'
  end

  private

  def scope
    Purchase.all
  end
end
