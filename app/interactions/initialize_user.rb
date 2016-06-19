class InitializeUser
  def call(user:)
    user.tap do |u|
      u.build_wallet
      u.build_library
    end
  end
end
