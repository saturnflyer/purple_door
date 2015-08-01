class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user = User.add_user(create_user_params)
      flash[:notice] = "User added!"
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to :back
    end
  end

  def edit
    @user = User.lookup_user(user_lookup_params)
  end

  def update
    if user = User.lookup_user(user_lookup_params)
      user.edit_info!(edit_user_params)
      flash[:notice] = "User info updated!"
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to :back
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.lookup_user(user_lookup_params)
  end

  private

  def user_lookup_params
    params.permit(:id)
  end

  def create_user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthdate)
  end

  def edit_user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthdate)
  end
end
