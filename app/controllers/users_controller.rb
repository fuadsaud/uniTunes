class UsersController < AuthenticatedController
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

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params[:user]
  end
end
