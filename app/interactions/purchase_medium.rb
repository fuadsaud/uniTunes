class PurchaseMedium
  def call(user:, medium_id:)
    wallet = find_wallet(user)
    medium = find_medium(medium_id)

    purchase = Purchase.new(split_shares(medium.price).merge(
      wallet: wallet,
      medium: medium,
      amount: medium.price
    ))

    if purchase.valid?
      begin
        response = ActiveRecord::Base.transaction do
          perform_purchase_transaction(purchase)
        end

        purchase = response.purchase
      rescue PerformTransaction::NotEnoughFundsError => e
        purchase.errors.add(:wallet, e.message)
      end
    end

    Response.new(medium: medium, purchase: purchase)
  end

  private

  attr_reader :user

  def split_shares(amount)
    SplitShareStrategy.default.call(amount)
  end

  def perform_purchase_transaction(purchase)
    PerformTransaction.new.call(purchase: purchase)
  end

  def find_wallet(user)
    user.wallet
  end

  def find_medium(medium_id)
    medium_scope.find(medium_id)
  end

  def medium_scope
    Medium.all
  end

  class SplitShareStrategy
    def self.default
      new(author_share: 0.9, admin_share: 0.1)
    end

    def initialize(author_share:, admin_share:)
      raise ArgumentError unless (author_share + admin_share) == 1

      @author_share = author_share
      @admin_share = admin_share
    end

    def call(amount)
      { author_amount: amount * author_share, admin_amount: amount * admin_share }
    end

    private

    attr_reader :author_share, :admin_share
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
