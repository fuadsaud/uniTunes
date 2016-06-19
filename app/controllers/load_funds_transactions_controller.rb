class LoadFundsTransactionsController < AuthenticatedController
  before_action :set_load_funds_transaction, only: [:show]

  # GET /load_funds_transactions
  def index
    @load_funds_transactions = scope.all
  end

  # GET /load_funds_transactions/1
  def show
  end

  # GET /load_funds_transactions/new
  def new
    @load_funds_transaction = scope.new
  end

  # POST /load_funds_transactions
  def create
    response = CreateLoadFundsTransaction.new.call(
      user: current_user,
      amount: amount_param
    )

    @load_funds_transaction = response.load_funds_transaction

    if response.success?
      redirect_to @load_funds_transaction, notice: 'Load funds transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def scope
    current_user.wallet.load_funds_transactions
  end

  def set_load_funds_transaction
    @load_funds_transaction = scope.find(params[:id])
  end

  def amount_param
    load_funds_transaction_params[:amount]
  end

  def load_funds_transaction_params
    params.require(:load_funds_transaction).permit(:amount)
  end
end
