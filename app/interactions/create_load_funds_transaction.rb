class CreateLoadFundsTransaction
  def initialize(user:)
    @user = user
  end

  def call(amount:)
    Response.new(transaction: process_transaction(amount: amount))
  end

  private

  attr_reader :user

  def process_transaction(**params)
    ActiveRecord::Base.transaction do
      create_transaction(params).tap do |transaction|
        wallet.add_credits(transaction.amount).save
      end
    end
  end

  def create_transaction(**params)
    wallet.load_funds_transactions.create(params)
  end

  def wallet
    user.wallet
  end

  Response = ImmutableStruct.new(:transaction) do
    def success?
      transaction.persisted?
    end

    def failed?
      !success?
    end
  end
end
