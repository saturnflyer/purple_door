module ApplicationHelper
  def can?(permission)
    AuthorizedUser.new(current_user).can?(permission)
  end
end
