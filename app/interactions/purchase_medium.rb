class PurchaseMedium
  def call(user:, medium_id:)
    wallet = find_wallet(user)
    medium = find_medium(medium_id)

    Response.new(
      medium: medium,
      purchase: Purchase.new(wallet: wallet, medium: medium, amount: medium.price)
    )
  end

  private

  attr_reader :user

  def find_wallet(user)
    user.wallet
  end

  def find_medium(medium_id)
    medium_scope.find(medium_id)
  end

  def medium_scope
    Medium.all
  end

  Response = ImmutableStruct.new(:medium, :purchase) do
    def success?
      purchase.persisted?
    end

    def failed?
      !success?
    end
  end
end
