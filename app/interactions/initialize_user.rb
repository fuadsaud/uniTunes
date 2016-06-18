class InitializeUser
  def call(user:)
    user.tap do |u|
      u.build_wallet
    end
  end
end
