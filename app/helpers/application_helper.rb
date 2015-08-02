module ApplicationHelper
  def authd_user(user = current_user))
    AuthorizedUser.new(user)
  end

  def can?(permission)
    authd_user.can?(permission)
  end

  def employee?(user = current_user)
    authd_user(user)employee?
  end

  def admin?(user = current_user)
    authd_user(user).admin?
  end
end
