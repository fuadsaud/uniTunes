module Admin
  class PurchasesController < BaseController
    def index
      @purchases = scope
    end

    def show
      @purchase = scope.find(params[:id])
    end

    private

    def scope
      Purchase.all
    end
  end
end
