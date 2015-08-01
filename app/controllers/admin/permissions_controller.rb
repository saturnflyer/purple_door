module Admin
  class PermissionsController < ApplicationController
    before_action :find_user
    before_action

    def edit
      return if redirect_unauthorized

      @available_permissions = PERMISSIONS
      @permissions = @user.permissions
      @user_name = "#{@user.last_name}, #{@user.first_name}"
    end

    def update
      return if redirect_unauthorized

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

    def redirect_unauthorized
      if current_user.nil? ||
         @user.superuser?
         !AuthorizedUser.new(current_user).can?("Manage permissions")
        flash[:error] = "Sorry, but you don't have permission for that"
        redirect_to root_path
        return true
      end
      false
    end
  end
end
