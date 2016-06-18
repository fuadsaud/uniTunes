class UsersController < AdminController
  before_action :set_user, only: [:show, :update]

  # GET /users
  def index
    @users = scope
  end

  # GET /users/1
  def show
  end

  def update
    if locked_param?
      @user.lock_access!
    else
      @user.unlock_access!
    end

    render 'show'
  end

  private

  def scope
    User.all
  end

  def set_user
    @user = scope.find(params[:id])
  end

  def locked_param?
    ActiveRecord::Type::Boolean.new.type_cast_from_user(user_params[:locked])
  end

  def user_params
    params.require(:user).permit(:locked)
  end
end
