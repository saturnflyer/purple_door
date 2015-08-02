module ApplicationHelper
  def authd_user
    AuthorizedUser.new(current_user)
  end

  def can?(permission)
    authd_user.can?(permission)
  end

  def employee?
    authd_user.employee?
  end

  def admin?
    authd_user.admin?
  end
end
