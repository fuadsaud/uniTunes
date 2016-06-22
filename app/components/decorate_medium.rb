class DecorateMedium
  DECORATORS = {
    PurchasedMedium   => ->(medium, user) { user.library.has?(medium) },
    AuthoredMedium    => ->(medium, user) { medium.author == user },
    MediumForPurchase => ->(medium, user) { true },
  }

  def call(medium, user)
    ->(context) {
      find_decorator_class(medium, user).new(medium, context: context)
    }
  end

  private

  def find_decorator_class(medium, user)
    DECORATORS.find { |_decorator_class, applies| applies.(medium, user) }.first
  end
end
