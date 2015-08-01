class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  PERMISSIONS = %w[
    annotate_worksheets
    manage_curriculum
    manage_permissions
  ]
end
