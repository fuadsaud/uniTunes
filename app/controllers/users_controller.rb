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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:user]
    end
end
