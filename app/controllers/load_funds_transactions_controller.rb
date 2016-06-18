class LoadFundsTransactionsController < ApplicationController
  before_action :set_load_funds_transaction, only: [:show, :destroy]

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
    @load_funds_transaction = scope.new(load_funds_transaction_params)

    if @load_funds_transaction.save
      redirect_to @load_funds_transaction, notice: 'Load funds transaction was successfully created.'
    else
      render :new
    end
  end

  # DELETE /load_funds_transactions/1
  def destroy
    @load_funds_transaction.destroy
    redirect_to load_funds_transactions_url, notice: 'Load funds transaction was successfully destroyed.'
  end

  private

  def scope
    current_user.wallet.load_funds_transactions
  end

  def set_load_funds_transaction
    @load_funds_transaction = scope.find(params[:id])
  end

  def load_funds_transaction_params
    params.require(:load_funds_transaction).permit(:amount)
  end
end