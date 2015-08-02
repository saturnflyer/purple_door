class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  PERMISSIONS = %w[
    annotate_worksheets
    create_user
    edit_user
    manage_curriculum
    manage_permissions
  ]

  def allowed(permission)
    unless AuthorizedUser.new(current_user).can?(permission)
      flash[:alert] = "Sorry, but you don't have permission for that"
      redirect_to root_path
      return false
    end
    true
  end
end
