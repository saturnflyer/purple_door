class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.add_user(create_user_params)
    redirect_to user_path(user.id)
  end

  def edit
    @user = User.lookup_user(user_lookup_params)
  end

  def update
    user = User.lookup_user user_lookup_params
    user.edit_info!(edit_user_params)
    #TODO add flash message
    redirect_to user_path(user.id)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.lookup_user(user_lookup_params)
  end

  private

  def user_lookup_params
    #TODO validate and flash messages/error handling
    params.permit(:id)
  end

  def create_user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthdate)
  end

  def edit_user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthdate)
  end
end
