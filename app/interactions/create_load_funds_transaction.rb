class CreateLoadFundsTransaction
  def call(user:, amount:)
    Response.new(
      load_funds_transaction: process_transaction(wallet: find_wallet(user), amount: amount)
    )
  end

  private

  attr_reader :user

  def process_transaction(wallet:, amount:)
    ActiveRecord::Base.transaction do
      create_transaction(wallet, amount).tap do |transaction|
        wallet.with_lock do
          wallet.add_credits(transaction.amount).save if transaction.persisted?
        end
      end
    end
  end

  def create_transaction(wallet, amount)
    wallet.load_funds_transactions.create(wallet: wallet, amount: amount)
  end

  def find_wallet(user)
    user.wallet
  end

  Response = ImmutableStruct.new(:load_funds_transaction) do
    def success?
      load_funds_transaction.persisted?
    end

    def failed?
      !success?
    end
  end
end
