class AdminController < AuthenticatedController
  before_action :authorize_admin!

  private

  def authorize_admin!
    head 403 unless admin?
  end

  def admin?
    current_user.admin?
  end
end
