class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:create, :update]

  private

  def configure_permitted_parameters
    permitted_params = [:first_name, :last_name, :email, :password, :current_password]

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(*permitted_params) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(*permitted_params) }
  end

  def build_resource(*)
    super

    resource.build_wallet
  end
end
