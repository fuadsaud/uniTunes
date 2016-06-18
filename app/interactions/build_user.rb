class BuildUser
  def call(user_params)
    initialize_user(
      User.new(
        user_params.merge(
          password_confirmation: user_params[:password],
          confirmed_at: Time.current
        )
      )
    )
  end

  private

  def initialize_user(user)
    InitializeUser.new.call(user: user)
  end
end
