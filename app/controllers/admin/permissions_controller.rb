module Admin
  class PermissionsController < ApplicationController
    before_action :find_user

    def edit
      return unless allowed("manage_permissions")

      if @user.superuser?
        flash[:alert] = "Sorry, but you don't have permission for that"
        redirect_to root_path
        return
      end

      @available_permissions = PERMISSIONS
      @permissions = @user.permissions
      @user_name = "#{@user.last_name}, #{@user.first_name}"
    end

    def update
      return unless allowed("manage_permissions")

      if @user.superuser?
        flash[:alert] = "Sorry, but you don't have permission for that"
        redirect_to root_path
        return
      end

      current_user.permissions.clear
      if params["permissions"]
        current_user.permissions += params["permissions"].keys
      end
      current_user.save!

      flash[:notice] = "Permissions updated"
      redirect_to action: :edit
    end

    private

    def find_user
      @user = User.find(params[:user_id])
      @user = AuthorizedUser.new(@user) if @user
    end
  end
end
