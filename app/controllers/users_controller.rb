class UsersController < AuthenticatedController
  before_action :authorize!
  before_action :set_user, only: [:show, :lock]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  def lock
    @user.lock_access!
  end

  private

  def authorize!
    head 403 unless admin?
  end

  def admin?
    current_user.admin?
  end

  def set_use
    @user = User.find(params[:id])
  end


  def user_params
    params[:user]
  end
end
