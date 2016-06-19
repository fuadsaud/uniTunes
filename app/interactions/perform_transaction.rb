class PerformTransaction
  NotEnoughFundsError = Class.new(StandardError)

  def call(purchase: purchase)
    with_lock(purchase.wallet) do |buyer_wallet|
      with_lock(purchase.medium) do |medium|
        with_lock(medium.author.wallet) do |author_wallet|
          with_lock(User.admin.wallet) do |admin_wallet|
            buyer_wallet.remove_credits(purchase.amount)

            if buyer_wallet.valid?
              buyer_wallet.save!

              author_wallet.reload.add_credits(purchase.author_amount).save!
              admin_wallet.reload.add_credits(purchase.admin_amount).save!

              purchase.save!
            else
              fail NotEnoughFundsError, 'not enough credits to perform the purchase'
            end

            Response.new(
              medium: medium,
              purchase: purchase,
              author_wallet: author_wallet,
              admin_wallet: admin_wallet
            )
          end
        end
      end
    end
  end

  private

  def with_lock(record)
    record.with_lock do
      yield record
    end
  end

  Response = ImmutableStruct.new(:medium, :purchase, :author_wallet, :admin_wallet) do
    def success?
      [purchase, author_wallet, admin_wallet].all?(&:persisted?)
    end

    def failure?
      !success?
    end
  end
end
