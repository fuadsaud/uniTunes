class BuildConfirmedUser
  def call(user_params)
    BuildUser.new.call(user_params.merge(confirmed_at: Time.current))
  end
end
